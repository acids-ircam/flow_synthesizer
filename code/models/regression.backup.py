# -*- coding: utf-8 -*-

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.distributions import MultivariateNormal
import numpy as np
# Flows library
from models.flows.flow import NormalizingFlow, Flow
from models.flows.layers import GaussianDiag, sum_dims


class FlowMixture(nn.Module):
    """
    Perform prediction with normalizing flows seen as mixtures.

    Here the goal is to have f_t(z_0) = z_k
    Where we consider B independent Gaussians target z^(b)_k ~ N(u_z, eps_var).
    This allows to define the loss as usual for density estimation

    We can use
    D_v(f|g) = \sum \pi_a log \frac{sum }

    """

    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowMixture, self).__init__(**kwargs)
        # Define type of flow
        self.flow = NormalizingFlow(
                dim=latent_size, blocks=blocks, flow_length=flow_length,
                density=MultivariateNormal(torch.zeros(latent_size),
                torch.eye(latent_size)), amortized=amortize)
        if var_type == 'dims':
            self.eps_var_z = nn.Parameter(torch.ones(latent_size) * eps_var)
            self.eps_var_y = nn.Parameter(torch.ones(latent_size) * eps_var)
        elif var_type == 'dims_rand':
            self.eps_var_z = nn.Parameter(torch.ones(latent_size) * (torch.abs(torch.randn(latent_size)) * eps_var))
            self.eps_var_y = nn.Parameter(torch.ones(latent_size) * (torch.abs(torch.randn(latent_size)) * eps_var))
        else:
            self.eps_var_z = nn.Parameter(torch.Tensor([eps_var]))
            self.eps_var_y = nn.Parameter(torch.Tensor([eps_var]))
        self.latent_size = latent_size

    def kullback_leibler_diag(self, f_mu, f_sig, g_mu, g_sig):
        var_1 = torch.sum(f_sig)
        var_2 = torch.sum(g_sig)
        var_frac = torch.sum(torch.exp(g_sig) / (torch.exp(f_sig) + 1e-9))
        means = (f_mu - g_mu)
        div = 0.5 * (var_2 - var_1 + var_frac + torch.sum((means ** 2) / (var_2 + 1e-9)))
        return -div

    def kullback_leibler_nosum(self, f_mu, f_sig, g_mu, g_sig):
        var_1 = torch.sum(f_sig)
        var_2 = torch.sum(g_sig)
        var_frac = (torch.exp(g_sig) / (torch.exp(f_sig) + 1e-9))
        means = (f_mu - g_mu)
        div = 0.5 * (var_2 - var_1 + var_frac + ((means ** 2) / (torch.exp(var_2) + 1e-9)))
        return -torch.sum(div, dim=1)

    def kullback_leibler_mix(self, f_mu, f_sig, g_mu, g_sig):
        div = 0
        for a in range(f_mu.shape[0]):
            mu_rep = f_mu[a].repeat(f_mu.shape[0], 1)
            sig_rep = f_sig[a].repeat(f_sig.shape[0], 1)
            div_a = self.kullback_leibler_nosum(f_mu, f_sig, mu_rep, sig_rep)
            div_b = self.kullback_leibler_nosum(mu_rep, sig_rep, g_mu, g_sig)
            rep_b = torch.sum(torch.exp(div_b))
            rep_a = torch.sum(torch.exp(div_a))
            div += torch.log(rep_b / rep_a)
        return div

    def forward(self, inputs):
        z_out, _ = self.flow(inputs)
        return z_out

    def log_prob(self, x, y):
        #x = x + (torch.randn_like(x).detach() * self.eps_var)
        z_out, log_jacobians = self.flow(x)
        jac_loss = torch.cat(log_jacobians, dim = 1).mean(dim = 1).unsqueeze(1) / x.shape[0]
        #reg_loss = GaussianDiag.likelihood(y, torch.ones_like(x).detach() * self.eps_var, z_out).sum(dim=1).unsqueeze(1)#log_normal_diag(z_out, y, torch.ones_like(y).detach() * self.eps_var, average=True, dim=1).unsqueeze(1)#
        #p_x = self.flow.base_density.log_prob(x)
        var = torch.ones_like(x).detach()
        reg_loss = self.kullback_leibler_diag(z_out, var * self.eps_var_z, y, var * self.eps_var_y) * 1e2
        full_loss = (reg_loss + jac_loss).mean()
        #print('Regression (flow mix):')
        #print(torch.mean(jac_loss))
        #print(torch.mean(reg_loss))
        return z_out, -full_loss


class FlowBayesHybrid(nn.Module):
    """
    Perform prediction with hybrid normalizing flows and hybrid regressor
    """

    def __init__(self, latent_size, blocks=None, flow_length=16, eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(FlowBayesHybrid, self).__init__(**kwargs)
        self.flow_mix = FlowMixture(latent_size, blocks, flow_length, eps_var, var_type)
        self.predict = BayesianRegressor(latent_size, latent_size, hidden_size=256, n_layers=2, blocks=blocks, flow_length=2, std=2.)

    def flow(self, x):
        z = self.flow_mix(x)
        z_out = self.predict(z)
        return z_out

    def log_prob(self, x, y):
        # Pass through flow
        z, log_jacobians = self.flow_mix.flow(x)
        jac_loss = torch.cat(log_jacobians, dim = 1).mean(dim = 1).unsqueeze(1) / x.shape[0]
        # Now pass through bayesian
        _, self.logdet = self.predict.params.sample()
        z_out = self.predict.model(z)
        ll = self.predict.log_prob(z_out, y)
        var = torch.ones_like(x).detach()
        reg_loss = self.flow_mix.kullback_leibler_diag(z, var * self.flow_mix.eps_var_z, y, var * self.flow_mix.eps_var_y)
        reg_loss += self.flow_mix.kullback_leibler_diag(z_out, var * self.flow_mix.eps_var_z, y, var * self.flow_mix.eps_var_y)
        #p_x = self.flow.base_density.log_prob(x)
        full_loss = (jac_loss + reg_loss + ll).mean()
        return z_out, -full_loss


class FlowPrediction(nn.Module):
    """
    Perform prediction with normalizing flows.

    Here the goal is to have f_t(z_0) = z_k
    Where we consider B independent Gaussians target z^(b)_k ~ N(u_z, eps_var).
    This allows to define the loss as usual for density estimation
    """

    def __init__(self, latent_size, blocks=None, flow_length=16, amortize='input', eps_var=1e-2, var_type = 'dims_rand', **kwargs):
        super(FlowPrediction, self).__init__(**kwargs)
        self.flow = NormalizingFlow(
                dim=latent_size, blocks=blocks, flow_length=flow_length,
                density=MultivariateNormal(torch.zeros(latent_size),
                torch.eye(latent_size)), amortized=amortize)
        if var_type == 'dims':
            self.eps_var = nn.Parameter(torch.ones(latent_size) * eps_var)
        elif var_type == 'dims_rand':
            self.eps_var = nn.Parameter(torch.ones(latent_size) * (torch.abs(torch.randn(latent_size)) * eps_var))
        else:
            self.eps_var = nn.Parameter(torch.Tensor([eps_var]))
        self.latent_size = latent_size

    def forward(self, inputs):
        z_out, _ = self.flow(inputs)
        return z_out

    def log_prob(self, x, y):
        #x = x + (torch.randn_like(x).detach() * self.eps_var)
        z_out, log_jacobians = self.flow(x)
        jac_loss = torch.cat(log_jacobians, dim = 1).mean(dim = 1).unsqueeze(1) / x.shape[0]
        reg_loss = GaussianDiag.likelihood(y, torch.ones_like(x).detach() * self.eps_var, z_out).sum(dim=1).unsqueeze(1) * 1e2 #log_normal_diag(z_out, y, torch.ones_like(y).detach() * self.eps_var, average=True, dim=1).unsqueeze(1)#
        #p_x = self.flow.base_density.log_prob(x)
        #full_loss = (jac_loss + reg_loss).mean()
        full_loss = (reg_loss + jac_loss).mean()
        #print('Regression (flow pred):')
        #print(torch.mean(jac_loss))
        #print(torch.mean(reg_loss))
        return z_out, -full_loss


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

