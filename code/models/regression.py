# -*- coding: utf-8 -*-

import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.distributions as distributions
from torch.distributions import MultivariateNormal
import numpy as np
# Flows library
from models.flows.flow import NormalizingFlow, Flow
from models.flows.layers import GaussianDiag, sum_dims

"""
##########

Set of predictors based on flows

##########
"""

class VariationalLambda(nn.Module):
    """
    Computation of the lambdas (error variances).
    
    Rely on a variational approximator to do so.
    """
    
    def __init__(self, latent_size, init_val=1e-1, init_type='fixed', variational=True, **kwargs):
        super(VariationalLambda, self).__init__(**kwargs)
        self.latent_size = latent_size
        # Posterior approximate mean and variance (Gaussian)
        self.q_mean = nn.Parameter(torch.zeros(latent_size))
        self.q_var = nn.Parameter(torch.ones(latent_size) * init_val)
        # Prior mean and variance (Gaussian)
        self.p_mean = torch.zeros(latent_size).detach()#nn.Parameter(torch.zeros(latent_size))
        self.p_var = torch.ones(latent_size).detach()#nn.Parameter(torch.ones(latent_size))
        if init_type == 'rand':
            self.q_var = nn.Parameter(torch.ones(latent_size) * (torch.abs(torch.randn(latent_size)) * init_val))
        # Base distribution
        self.base_dist = MultivariateNormal(torch.zeros(latent_size), torch.eye(latent_size))
        # Register buffers for CUDA call
        self.register_buffer('p_m', self.p_mean)
        self.register_buffer('p_v', self.p_var)
    
    def gaussian_likelihood(self, x, mean, logs):
        """ Simple gaussian likelihood """
        log_2pi = float(np.log(2 * np.pi))        
        return -0.5 * (logs * 2. + ((x - mean) ** 2) / torch.exp(logs * 2.) + log_2pi)
    
    def sample(self, n_vals):
        samples = self.get_values(n_vals)
        if (self.p_mean.device != samples.device):
            self.p_mean = self.p_mean.to(samples.device)
            self.p_var = self.p_var.to(samples.device)
        q_likelihood = self.gaussian_likelihood(samples, self.q_mean, self.q_var).mean()
        prior = self.gaussian_likelihood(samples, self.p_mean, self.p_var).mean()
        return samples, (q_likelihood - prior)
    
    def sample_fixed(self, params):
        mu, sig = params.chunk(2, 1)
        samples = (torch.exp(sig) * torch.rand_like(mu).detach()) + mu
        q_likelihood = self.gaussian_likelihood(samples, mu, sig).mean()
        prior = self.gaussian_likelihood(samples, self.p_mean, self.p_var).mean()
        return samples, (q_likelihood - prior)
    
    # Retrieve posterior value
    def get_values(self, n_vals):
        samples = torch.rand(n_vals, self.latent_size).to(self.q_var.device) #self.base_dist.sample((n_vals, ))
        samples = (self.q_var * samples.detach()) + self.q_mean
        return samples

class FlowPredictor(nn.Module):
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowPredictor, self).__init__(**kwargs)
        # Define type of flow
        self.flow = NormalizingFlow(
                dim=latent_size, blocks=blocks, flow_length=flow_length,
                density=MultivariateNormal(torch.zeros(latent_size),
                torch.eye(latent_size)), amortized=amortize)
        self.var_y = VariationalLambda(latent_size, eps_var, var_type)
        self.var_z = VariationalLambda(latent_size, eps_var, var_type)
        self.latent_size = latent_size
    
    def gaussian_likelihood(self, x, mean, logs):
        """
        Gaussian likelihood
        lnL = -1/2 * { ln|Var| + ((X - Mu)^T)(Var^-1)(X - Mu) + kln(2*PI) }
              k = 1 (Independent) / Var = logs ** 2
        """
        log_2pi = float(np.log(2 * np.pi))
        return -0.5 * (logs * 2. + ((x - mean) ** 2) / torch.exp(logs * 2.) + log_2pi)

    def kullback_leibler(self, f_mu, f_sig, g_mu, g_sig):
        """ Kullback-Leibler (KL) divergence """
        var_1 = torch.sum(f_sig)
        var_2 = torch.sum(g_sig)
        var_frac = torch.sum(torch.exp(g_sig) / (torch.exp(f_sig) + 1e-9))
        means = (f_mu - g_mu)
        div = 0.5 * (var_2 - var_1 + var_frac + torch.sum((means ** 2) / (var_2 + 1e-9)))
        return -div
    
    def kullback_leibler_mvn(self, f_mu, f_sig, g_mu, g_sig):
        res_div = torch.zeros(f_mu.shape[0])
        for b in range(f_mu.shape[0]):
            f = MultivariateNormal(f_mu[b], torch.eye(f_mu.shape[1]) * f_sig[b])
            g = MultivariateNormal(g_mu[b], torch.eye(f_mu.shape[1]) * g_sig[b])
            res_div[b] = distributions.kl.kl_divergence(f, g)
        return res_div
    
    def forward(self, inputs):
        """ Perform basic forward """
        z_out, _ = self.flow(inputs)
        return z_out
    
    def log_prob(self, x, y):
        """ Compute prediction probability """
        z_out = self.forward(x)
        # Compute variational variance
        var_z, var_loss = self.var_z.sample(y.shape[0])
        loss = self.gaussian_likelihood(y, z_out, var_z)
        return z_out, -(loss + var_loss)

class FlowTransform(FlowPredictor):
    """
    Perform prediction with normalizing flows.

    Here the goal is to have f_t(z_0) = z_k
    Where we consider B independent Gaussians target z^(b)_k ~ N(u_z, eps_var).
    This allows to define the loss as usual for density estimation
    """
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', jacobian_loss = False, **kwargs):
        super(FlowTransform, self).__init__(latent_size, blocks, flow_length, amortize, eps_var, var_type, **kwargs)
        # Computation of Jacobian determinant losses
        self.jacobian_loss = jacobian_loss
    
    def log_prob(self, x, y):
        # Pass through flow
        z_out, log_jacobians = self.flow(x)
        jac_loss = 0
        # Compute Jacobian loss
        if (self.jacobian_loss):
            jac_loss = torch.cat(log_jacobians, dim = 1).sum(dim = 1).unsqueeze(1)
        # Compute variational variance
        var_z, var_loss = self.var_z.sample(y.shape[0])
        # Compute log N(y; f(x), sig)
        reg_loss = self.gaussian_likelihood(y, z_out, var_z).sum(dim=1).unsqueeze(1)
        # Compute full loss
        full_loss = (reg_loss + jac_loss + var_loss).mean()
        # Return prediction and loss
        return z_out, -full_loss
 
"""
#################

Predictors based on Kullback-Leibler divergence

#################
"""
class FlowKL(FlowPredictor):
    """
    Perform prediction with normalizing flows using KL divergence as criterion

    Here, we consider that p(v|f(x)) = KL[p(v) || p(f(x))]
    Where we consider B independent Gaussians target z^(b)_k ~ N(u_z, eps_var).
    This allows to define the loss as usual for density estimation and leads to the objective
    
    """
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowKL, self).__init__(latent_size, blocks, flow_length, amortize, eps_var, var_type, **kwargs)
    
    def log_prob(self, x, y):
        # Compute flow
        z_out, log_jacobians = self.flow(x)
        # Compute variational variance
        var_y, var_y_loss = self.var_y.sample(y.shape[0])
        var_z, var_z_loss = self.var_z.sample(y.shape[0])
        var_loss = (var_y_loss + var_z_loss)
        # Compute KL loss
        reg_loss = self.kullback_leibler(z_out, var_z, y, var_y)
        #print(jac_loss)
        full_loss = (reg_loss + var_loss).mean()
        return z_out, -full_loss

class FlowKLFull(FlowPredictor):
    """
    Perform prediction with normalizing flows using KL divergence as criterion

    Here, we consider that p(v|f(x)) = KL[p(v) || p(f(x))].
    This version integrates the extra objective 
    Where we consider B independent Gaussians target z^(b)_k ~ N(u_z, eps_var).
    This allows to define the loss as usual for density estimation
    """
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowKLFull, self).__init__(latent_size, blocks, flow_length, amortize, eps_var, var_type, **kwargs)# Prior distribution
        # Prior on y 
        self.p_y_mean = torch.zeros(latent_size).detach()
        self.p_y_var = torch.ones(latent_size).detach()

    def log_prob(self, x, y):
        if (self.p_y_mean.device != x.device):
            self.p_y_mean = self.p_y_mean.to(x.device)
            self.p_y_var = self.p_y_var.to(x.device)
        # Compute flow
        z_out, log_jacobians = self.flow(x)
        # Compute Jacobians
        jac_loss = torch.cat(log_jacobians, dim = 1).mean() / (x.shape[0] * x.shape[1])
        # Compute variational variance
        var_y, var_loss = self.var_y.sample(y.shape[0])
        # Compute Kullback-Leibler
        reg_loss = self.gaussian_likelihood(z_out, y, var_y)#.sum(dim=1).unsqueeze(1)
        # Compute prior loss over z
        p_y = self.gaussian_likelihood(y, self.p_y_mean, self.p_y_var)
        # Full loss
        full_loss = (reg_loss + p_y + jac_loss + var_loss).mean()
        return z_out, -full_loss
    
"""
#################

Predictors based on external amortization

#################
"""
class FlowAmortizedPredictor(FlowPredictor):
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='none', eps_var=1e-1, var_type='dims_rand', n_layers=4, n_hiddens=512, **kwargs):
        super(FlowAmortizedPredictor, self).__init__(latent_size, blocks, flow_length, 'ext', eps_var, var_type, **kwargs)
        
    def amortization_net(self, dim, n_hidden, out, nlayers=2, activation=nn.ReLU):
        net = nn.ModuleList()
        for l in range(nlayers):
            cur_n = nn.Linear((l==0) and dim or n_hidden, (l==nlayers-1) and out or n_hidden)
            nn.init.xavier_uniform_(cur_n.weight.data, gain=.1)
            cur_n.bias.data.uniform_(0,0)
            net.append(cur_n)
            if (l < nlayers - 1):
                net.append(nn.BatchNorm1d((l==nlayers-1) and out or n_hidden))
                net.append(activation())
        return nn.Sequential(*net)

class FlowCDE(FlowAmortizedPredictor):
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowCDE, self).__init__(latent_size, blocks, flow_length, 'ext', eps_var, var_type, **kwargs)
        # Parameters of flow
        self.n_params = self.flow.n_parameters()
        # Variational approximation to parameter posterior
        self.flow_params = VariationalLambda(self.n_params, init_val=eps_var*1e-2, init_type='fixed')
        # Define a network for conditioning
        # self.h_net = self.amortization_net(latent_size, 256, self.n_params * 2)
    
    def forward(self, inputs):
        # Sample variational flow parameters
        f_params, f_loss = self.flow_params.sample(inputs.shape[0])
        self.flow.set_parameters(f_params)
        # Compute flow
        z_out, log_jacobians = self.flow(inputs)
        return z_out
    
    def log_prob(self, x, y):
        # Amortize to find first params
        # f_params = self.h_net(x) 
        # Sample variational flow parameters
        f_params, f_loss = self.flow_params.sample(x.shape[0])
        #f_params, f_loss = self.h_net(x), 0
        self.flow.set_parameters(f_params)
        # Compute flow
        z_out, log_jacobians = self.flow(x)
        #z_out = F.sigmoid(z_out)
        # Compute Jacobians
        jac_loss = torch.cat(log_jacobians, dim = 1).mean(dim=1).unsqueeze(1)
        # Compute variational variance
        var_y, var_y_loss = self.var_y.sample(y.shape[0])
        # All variational losses
        var_loss = (var_y_loss + f_loss)
        # Compute prediction likelihood
        reg_loss = self.gaussian_likelihood(z_out, y, var_y)
        # Full loss
        full_loss = (reg_loss + jac_loss + var_loss).mean()
        return z_out, -full_loss

class FlowExternal(FlowAmortizedPredictor):
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='none', eps_var=1e-1, var_type='dims_rand', n_layers=4, n_hiddens=512, **kwargs):
        super(FlowExternal, self).__init__(latent_size, blocks, flow_length, 'ext', eps_var, var_type, **kwargs)
        # Find number of parameters to amortize on
        self.amortize_params = self.flow.n_parameters()
        # Learnable mean and variance for base distrib
        self.mean = nn.Parameter(torch.zeros(latent_size))
        self.var = nn.Parameter(torch.ones(latent_size))
        # Define a network for conditioning
        self.h_net = self.amortization_net(latent_size, n_hiddens, self.amortize_params)
        # Base distribution (zero_mean / unit-var Gaussian)
        self.base_dist = MultivariateNormal(torch.zeros(latent_size), torch.eye(latent_size))
    
    def forward(self, inputs):
        # Sample from the base distribution
        samples = torch.rand_like(inputs).detach().to(self.var)
        samples = (self.var * samples) + self.mean
        # Compute amortization parameters
        params = self.h_net(inputs)
        # Amortize the flow
        self.flow.set_parameters(params)
        # Compute flow
        z_out, log_jac = self.flow(samples)
        return z_out
    
    def log_prob(self, x, y):
        # Sample from the base distribution
        samples = torch.rand_like(x).detach().to(self.var)#self.base_dist.sample((x.shape[0],))
        samples = (self.var * samples) + self.mean
        # Compute amortization parameters
        params = self.h_net(x)
        # Amortize the flow
        self.flow.set_parameters(params)
        # Compute amortized flow transform
        z_out, jac_loss = self.flow(samples)
        # Concatenate jacobians
        jac_loss = torch.cat(jac_loss, dim = 1).mean()
        # Compute variational variance
        var_y, var_loss = self.var_y.sample(y.shape[0])
        # Compute likelihood of the output
        out_loss = self.gaussian_likelihood(z_out, y, var_y)
        # Final loss computation
        full_loss = (out_loss + jac_loss + var_loss).mean()
        return z_out, -full_loss

class FlowPosterior(FlowPredictor):
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowPosterior, self).__init__(latent_size, blocks, flow_length, amortize, eps_var, var_type, **kwargs)
        # Prior on y 
        self.q_y_mean = torch.zeros(latent_size).detach()
        self.q_y_var = torch.ones(latent_size).detach()
        # Prior on z 
        self.p_z_mean = nn.Parameter(torch.zeros(latent_size))
        self.p_z_var = nn.Parameter(torch.ones(latent_size))

    def log_prob(self, x, y):
        full_loss = 0
        if (self.q_y_mean.device != x.device):
            self.q_y_mean = self.q_y_mean.to(x.device)
            self.q_y_var = self.q_y_var.to(x.device)
        for mc_it in range(4):
            # Compute flow
            z_out, log_jacobians = self.flow(x + (torch.rand_like(x) * 1e-2))
            # Compute Jacobians
            jac_loss = torch.cat(log_jacobians, dim = 1).mean()
            # Compute variational variance
            var_y, var_loss = self.var_y.sample(y.shape[0])
            # Compute posterior
            reg_loss = self.gaussian_likelihood(z_out, y, var_y)#.sum(dim=1).unsqueeze(1)
            # Compute prior loss over z
            q_v = self.gaussian_likelihood(y, self.q_y_mean, self.q_y_var)
            # Compute prior loss over z
            p_z = self.gaussian_likelihood(z_out, self.p_z_mean, self.p_z_var)
            # Full loss
            full_loss += (reg_loss + p_z + jac_loss + var_loss - q_v).mean()
        return z_out, -full_loss

class FlowDecoder(FlowPredictor):
    
    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowDecoder, self).__init__(latent_size, blocks, flow_length, amortize, eps_var, var_type, **kwargs)
    
    def forward():
        pass
    
    def log_prob(self, x, y):
        pass
    


"""
##########

Set of classes for bayesian NN optimization

##########
"""

class LinearFlow(Flow):

    def __init__(self, dim, context_dim):
        super(LinearFlow, self).__init__()
        self.dim = dim
        self.context_dim = context_dim
        self.mean = nn.Linear(context_dim, dim)
        self.lstd = nn.Linear(context_dim, dim)
        self.lstd.weight.data.uniform_(-1, 1)
        self.init_parameters()

    def _call(self, z):
        x, context = z
        mean = self.mean(context)
        lstd = self.lstd(context)
        std = F.softplus(lstd)
        x_ = mean + std * x
        return x_

    def log_abs_det_jacobian(self, z):
        x, context = z
        lstd = self.lstd(context)
        std = F.softplus(lstd)
        return -sum_dims(torch.log(std + 1e-9))


class Param(nn.Module):

    def __init__(self, param):
        super(Param, self).__init__()
        self.param = nn.Parameter(param)


class StochasticFlowParameters(nn.Module):
    """
    Set of parameters for bayesian neural network
    """

    def __init__(self, flow_blocks, flow_length=4):
        super(StochasticFlowParameters, self).__init__()
        self.flow_blocks = flow_blocks
        self.flow_length = flow_length
        self.flows = nn.ModuleList()
        self.samplers = nn.ModuleList()
        self.shared_params = nn.ModuleList()
        self.counter = 0

    def register_param(self, param):
        self.shared_params.append(Param(param))
        self.counter += 1
        ind = self.counter - 1
        return lambda: self.shared_params[ind].param

    def add_stochastic_param(self, size, dimc=1):
        # stochastic
        dim = int(np.prod(size))
        self.samplers.append(LinearFlow(dim, dimc))
        flow = NormalizingFlow(dim, blocks=self.flow_blocks, flow_length=self.flow_length, density=MultivariateNormal(torch.zeros(dim), torch.eye(dim)), amortized='self')
        self.flows.append(flow)
        ind = len(self.samplers)-1
        return lambda: self.sample_set(ind)

    def sample_set(self, ind):
        return self.samples[ind]

    def add_deterministic_param(self, param):
        # deterministic
        return self.register_param(param)

    def sample(self, n=1, context=None):
        if context is None:
            context = torch.autograd.Variable(torch.ones(1, 1))
        self.samples = []
        self.logdets = []
        for s in range(len(self.samplers)):
            x = self.samplers[s]((n, context))
            x_logdet = self.samplers[s].log_abs_det_jacobian((n, context))
            cur_samp, cur_logdet = self.flows[s](x)
            self.samples.append(cur_samp)
            self.logdets.append(torch.mean(torch.cat(cur_logdet, dim=1), dim=1) + x_logdet)
        return torch.cat(self.samples, dim=1), torch.cat(self.logdets).sum()

    def add(self, params, dimc=1, type=0):
        if type == 0:
            return self.add_stochastic_param(params, dimc)
        elif type == 1:
            return self.add_deterministic_param(params)
        return None


class StochasticLinear(nn.Module):

    def __init__(self, in_features, out_features, parameters, dimc=1):
        super(StochasticLinear, self).__init__()
        self.in_features = in_features
        self.out_features = out_features
        self.scale = parameters.add((1, out_features), dimc)
        self.direction = parameters.add(torch.randn(out_features, in_features), None, 1)
        self.bias = parameters.add(torch.zeros((1, out_features)), None, 1)

    def forward(self, input, conditional=False):
        dir_ = self.direction()
        weight = dir_.div(dir_.pow(2).sum(1).sqrt()[:,None])
        bias = self.bias()[0]
        scale = self.scale()[0]
        return scale * F.linear(input, weight, bias)


class BayesianRegressor(nn.Module):

    def __init__(self, in_size, out_size, hidden_size=32, n_layers=3, blocks=None, flow_length=4, std=2.):
        super(BayesianRegressor, self).__init__()
        # Create normalizing flow
        self.params = StochasticFlowParameters(blocks, flow_length)
        # Prior parameters (context)
        self.mean = nn.Parameter(torch.zeros(1))
        self.log_var = nn.Parameter(torch.ones(1) * 1e-1)  # self.mean + 2 * np.log(std)
        self.model = nn.Sequential()
        for l in range(n_layers):
            in_s = (l==0) and in_size or hidden_size
            out_s = (l == n_layers - 1) and out_size or hidden_size
            self.model.add_module('s%i'%l, StochasticLinear(in_s, out_s, self.params))
            if l < n_layers - 1:
                #self.model.add_module('e%i'%l, nn.BatchNorm1d(out_s))
                self.model.add_module('e%i'%l, nn.ELU())

    def forward(self, x):
        _, self.logdet = self.params.sample()
        out = self.model(x)
        return out

    def prior(self):
        samps = torch.cat(self.params.samples, dim=1).t().sum(dim=1)
        ll = GaussianDiag.likelihood(self.mean, self.log_var, samps).mean()
        return ll

    def likelihood(self, x, y):
        out = self.forward(x)
        return GaussianDiag.likelihood(y, self.mean + np.log(9), out).sum(), out

    def log_prob(self, x, y):
        ll, out = self.likelihood(x, y)
        ll = ll + self.prior() - self.logdet
        return out, -ll

