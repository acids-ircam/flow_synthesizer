# -*- coding: utf-8 -*-

import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.distributions as distributions
from torch.distributions import MultivariateNormal
import numpy as np
# Flows library
from models.flows.flow import NormalizingFlow

class DisentanglingFlow(nn.Module):
    """
    Perform disentnglement of target dimensions with normalizing flows 
    using partial density estimation as criterion

    Here, we consider that p(v|f(x)) = KL[p(v) || p(f(x))].
    This version integrates the extra objective 
    Where we consider B independent Gaussians target z^(b)_k ~ N(u_z, eps_var).
    This allows to define the loss as usual for density estimation
    """
    
    def __init__(self, latent_size, blocks=None, flow_length=16, n_dims=1, amortize='input', eps_var=1e-1, var_type='dims_rand', **kwargs):
        super(DisentanglingFlow, self).__init__(**kwargs)
        # Define type of flow
        self.flow = NormalizingFlow(
                dim=latent_size, blocks=blocks, flow_length=flow_length,
                density=MultivariateNormal(torch.zeros(latent_size),
                torch.eye(latent_size)), amortized=amortize)
        self.var_0 = VariationalLambda(1, 1, var_type)
        self.var_1 = VariationalLambda(1, 1, var_type)
        # Prior on our two classes separation problem  
        self.p_mu = torch.zeros(latent_size).detach()
        self.var = torch.ones(latent_size).detach()
        self.p_mu_0 = torch.zeros(1).detach()
        self.p_mu_1 = torch.zeros(1).detach()
        self.p_mu_0[0] = -1
        self.p_mu_1[0] = 1
        self.latent_size = latent_size
    
    def gaussian_likelihood(self, x, mean, logs):
        """ Simple gaussian likelihood """
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
    
    def forward(self, x, meta=None):
        """ Perform basic forward """
        if (self.p_mu_0.device != x.device):
            self.p_mu_0 = self.p_mu_0.to(x.device)
            self.p_mu_1 = self.p_mu_1.to(x.device)
            self.p_mu = self.p_mu.to(x.device)
            self.var = self.var.to(x.device)
        # Compute flow
        z_out, log_jacobians = self.flow(x)
        full_loss = 0
        if (meta is not None):
            # Separate different variaables
            (meta, target, observed, unknown) = meta
            # Retrieve only observed meta
            z_out_obs = z_out[observed, :]
            target_obs = target[observed]
            # Compute Jacobians
            jac_loss = torch.cat(log_jacobians, dim = 1).mean() / (x.shape[0] * x.shape[1])
            # Compute variational variance for both classes
            #var, var_loss = self.var.sample(unknown.sum())
            var_loss_0, var_loss_1, neg_loss, pos_loss = 0, 0, 0, 0
            #print('Entering epoch')
            #print('Unknowns: ' + str(unknown.sum()))
            # Compute objective over negative tags
            if (target_obs.eq(0).sum() > 0):
                var_0, var_loss_0 = self.var_0.sample(target_obs.eq(0).sum())
                #var_0 = self.var[0] * .4
                neg_loss = self.gaussian_likelihood(z_out_obs[target_obs.eq(0), 0], self.p_mu_0.repeat(target_obs.eq(0).sum()), var_0).sum() * 10
                neg_loss += self.gaussian_likelihood(z_out_obs[target_obs.eq(0), 1:], self.p_mu[1:], self.var[1:]).mean()
                #print('Negative')
                #print(var_0)
                #print(z_out_obs[target_obs.eq(0), 0])
            # Compute objective over positive tags
            if (target_obs.eq(1).sum() > 0):
                var_1, var_loss_1 = self.var_1.sample(target_obs.eq(1).sum())
                #var_1 = self.var[0] * .4
                #var_1 = .5
                pos_loss = self.gaussian_likelihood(z_out_obs[target_obs.eq(1), 0], self.p_mu_1.repeat(target_obs.eq(1).sum()), var_1).sum() * 10
                pos_loss += self.gaussian_likelihood(z_out_obs[target_obs.eq(1), 1:], self.p_mu[1:], self.var[1:]).mean()
                #print('Positive')
                #print(var_1)
                #print(z_out_obs[target_obs.eq(1), 0])
            # Compute objective over positive tags
            unk_loss = self.gaussian_likelihood(z_out[unknown, :], self.p_mu, self.var).mean()
            # Full variational loss
            var_loss = (var_loss_0 + var_loss_1)
            # Compute disentangling loss
            dis_loss = (neg_loss + pos_loss + unk_loss)
            # Full loss computaation
            full_loss = (dis_loss + jac_loss + var_loss).mean()
            #print('Losses')
            #print(var_loss_0)
            #print(var_loss_1)
            #print(var_loss)
            #print(neg_loss)
            #print(pos_loss)
            #print(unk_loss)
            #print(jac_loss)
        return z_out, -full_loss
    
    def log_prob(self, x, y):
        """ Compute prediction probability """
        z_out = self.forward(x)
        # Compute variational variance
        var_z, var_loss = self.var_z.sample(y.shape[0])
        loss = self.gaussian_likelihood(y, z_out, var_z)
        return z_out, -(loss + var_loss)

def free_energy_bound(density, zk, log_jacobians):  # That's just the likelihood right?
    sum_of_log_jacobians = sum(log_jacobians)
    return (-sum_of_log_jacobians - torch.log(density(zk) + 1e-9)).mean()


"""
##########

Variational parameters

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

        