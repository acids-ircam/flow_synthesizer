#%% -*- coding: utf-8 -*-

import matplotlib
matplotlib.use('agg')
import torch
import torch.nn as nn
import os.path
import argparse
import numpy as np
from utils.data import load_dataset
from utils.plot import compare_batch_detailed
from models.loss import spectral_losses
# Plotting
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
from mpl_toolkits.mplot3d import Axes3D
from sklearn import decomposition
import librosa

"""
###################
Compute descriptors for a batch of spectral representations
###################
"""
# Set of descriptors we will analyze
descriptors = ['loudness', 'centroid', 'bandwidth', 'flatness', 'rolloff']
# Helper function to sample, synthesize and analyze a point in space
def compute_descriptors(batch_mels):
    # Create descriptors matrix
    out_desc = np.zeros((batch_mels.shape[0], len(descriptors)))
    # Compute inverse transform at this point
    for b in range(batch_mels.shape[0]):
        cur_val = batch_mels[b]
        # Compute all descriptors
        try:
            out_desc[b, 0] = librosa.feature.rmse(S = cur_val).mean()
            out_desc[b, 1] = librosa.feature.spectral_centroid(S = cur_val).mean() / 1e4
            out_desc[b, 2] = librosa.feature.spectral_flatness(S = cur_val).mean()
            out_desc[b, 3] = librosa.feature.spectral_bandwidth(S = cur_val).mean() / 1e4
            out_desc[b, 4] = librosa.feature.spectral_rolloff(S = cur_val).mean() / 1e4
        except:
            pass
    return out_desc

def save_batch_audio(final_audio, name):
    # Figure out len of full audio
    final_size = sum([int(f.shape[0]) for f in final_audio]) + (2205 * len(final_audio))
    wave_out = np.zeros(int(final_size))
    cur_p = 0
    for b in range(len(final_audio)):
        wave_out[cur_p:(cur_p + final_audio[b].shape[0])] += final_audio[b]
        cur_p += final_audio[b].shape[0] + 2205
    librosa.output.write_wav(name + '.wav', wave_out, 22050)

"""
###################


AE-specific evaluation 
    - Latent space 
    - Semantic parameter 
    - Meta-parameters 
    - AE reconstruction


###################
"""

"""
###################
Latent space evaluation for AE models
###################
"""
def evaluate_latent_space(model, test_loader, args, train=False, name=None):
    print('  - Evaluate latent space.')
    l1_losses = []
    mse_losses = []
    final_params = []
    final_z_space = []
    full_meta = []
    mse = nn.MSELoss(reduction = 'none')
    l1 = nn.SmoothL1Loss(reduction = 'none')
    for (x, y, meta, _) in test_loader:
        # Send to device
        x, y = x.to(args.device), y.to(args.device)
        # Encode our fixed batch
        if (not (args.model in ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn'])): 
            # Auto-encode
            x_tilde, z_tilde, z_loss = model.ae_model(x)
            if (args.semantic_dim > -1):
                z_tilde, _ = model.disentangling(z_tilde)
            # Perform regression on params
            out = model.regression_model(z_tilde)
            final_z_space.append(z_tilde)
        else:
            out = model(x)
        if (args.loss in ['multinomial']):
            tmp = out.view(out.shape[0], -1, y.shape[1]).max(dim=1)[1]
            out = tmp.float() / (args.n_classes - 1.)
        if (args.loss in ['multi_mse']):
            out = out.view(out.shape[0], -1, y.shape[1])
            out = out[:, -1, :]
        final_params.append(out)
        full_meta.append(meta)
        mse_losses.append(mse(out, y) / torch.mean(mse(y, torch.zeros_like(y).to(args.device)) + 1e-9))
        l1_losses.append(l1(out, y) / torch.mean(l1(y, torch.zeros_like(y).to(args.device) + 1e-9)))
    # Final space of all z points
    final_z_space = torch.cat(final_z_space, dim = 0).detach().cpu()
    final_meta = torch.cat(full_meta, dim = 0).detach().cpu()
    # Compute variances of latent
    args.final_z_space = final_z_space
    args.final_meta = final_meta
    args.z_vars = final_z_space.std(dim = 0)
    args.z_means = final_z_space.mean(dim = 0)
    # Create PCA 
    pca = decomposition.PCA(n_components=3)
    # Fit it
    pca.fit(final_z_space)
    X = pca.transform(final_z_space)
    args.z_pca_space = X
    args.pca = pca
    # Plot to figure
    fig = plt.figure(1, figsize=(10, 10))
    ax = Axes3D(fig, rect=[0, 0, .95, 1], elev=20, azim=130)
    ax.scatter(X[:, 0], X[:, 1], X[:, 2])#, c=yc, cmap=plt.cm.nipy_spectral, edgecolor='k')
    if (name is not None):
        plt.savefig(name + '_latent_space.pdf')
        plt.close()                
    if (train == False and name is None):
        plt.savefig(args.base_img + '_latent_space.pdf')
        plt.close()                
    return args

"""
###################
Semantic parameters evaluation for VAE-Flows models
###################
"""
def evaluate_semantic_parameters(model, test_loader, args, train=False, name=None):
    # Retrieve metadata
    meta = args.final_meta
    # Reorganize metadata
    meta_names = ["Bright_Dark", "Clean_Dirty", "Modern_Vintage", "Phat_Thin", 
               "Soft_Aggressive", "Constant_Moving", "Natural_Synthetic", 
               "Wide_Narrow", "Harmonic_Inharmonic", "Dynamic_Static"]
    z_pca = args.z_pca_space
    fig = plt.figure(figsize=(10,18))
    for m in range(10):
        ax = fig.add_subplot(5, 2, m+1, projection='3d')
        cur_meta = meta[:, m, :]
        idx_pos = cur_meta[:, 0].nonzero()
        idx_neg = cur_meta[:, 1].nonzero()
        ax.scatter(z_pca[idx_pos, 0], z_pca[idx_pos, 1], z_pca[idx_pos, 2]*10, 'b')
        ax.scatter(z_pca[idx_neg, 0], z_pca[idx_neg, 1], z_pca[idx_neg, 2]*10, 'r')
        ax.set_title(meta_names[m])
    if (name is not None):
        plt.savefig(name + '_metatags_space.pdf')
        plt.close()                
    if (train == False and name is None):
        plt.savefig(args.base_img + '_metatags_space.pdf')
        plt.close()  

"""
###################
Meta-parameters evaluation for AE models
###################
"""
def evaluate_meta_parameters(model, test_loader, args, train=False, name=None, n_recons = 8, n_steps = 100):
    print('  - Evaluate meta parameters.')
    latent_dims = model.ae_model.latent_dims
    fig = plt.figure(figsize=(10, 20))
    outer = gridspec.GridSpec(latent_dims + 1, 3, wspace=0.2, hspace=0.4)
    # Select 5 random points from the test set
    fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(test_loader))
    in_data = fixed_data[np.random.randint(0, fixed_data.shape[0], size=(32))].to(args.device)
    # Find corresponding params
    _, in_data, _ = model.ae_model(in_data)
    if (args.semantic_dim > -1):
        in_data, _ = model.disentangling(in_data)
    z_var = 0
    for l in range(latent_dims):
        var_z = torch.linspace(-4, 4, n_steps)
        fake_batch = torch.zeros(n_steps, latent_dims)
        fake_batch[:, l] = var_z
        fake_batch = fake_batch.to(args.device)
        # Generate VAE outputs
        x_tilde_full = model.ae_model.decode(fake_batch)
        # Perform regression
        out = model.regression_model(fake_batch)
        # Select parameters
        var_param = out.std(dim=0)
        idx = torch.argsort(var_param, descending=True)
        # To keep coloring consistent we blank out all parameters above 5 most varying
        out[:, idx[5:]] = torch.zeros(out.shape[0], len(idx[5:])).to(out.device)
        ax = plt.Subplot(fig, outer[l*3])
        ax.plot(out.detach().cpu().numpy())
        ax.get_xaxis().set_visible(False)
        ax.get_yaxis().set_visible(False)
        if (hasattr(args, 'z_vars')):
            z_var = args.z_vars[l].item()
        ax.set_title('$z_{' + str(l) + '}$ - %.2f - %.3f'%((z_var), (var_param[idx[:5]].mean().item())))
        fig.add_subplot(ax)
        # Reconstruct a handful of points
        fake_batch = torch.zeros(n_recons, latent_dims)
        fake_batch[:, l] = torch.linspace(-4, 4, n_recons)
        fake_batch = fake_batch.to(args.device)
        # Reconstruct with the VAE
        x_tilde = model.ae_model.decode(fake_batch)
        # Reconstruct with the synth engine
        if (args.synthesize == True and train == False and ((var_param[idx[:5]].mean().item() > 0.15) or ((args.semantic_dim > -1) and (l == 0)))):
            out_batch = model.regression_model(fake_batch)
            print('      - Generate audio for latent ' + str(l))
            from synth.synthesize import synthesize_batch
            audio = synthesize_batch(out_batch.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=None, name=None)
            save_batch_audio(audio, args.base_audio + '_meta_parameters_z' + str(l) + '_v' + str(var_param[idx[:5]].mean().item()))
            # Now check how this parameter act on various sounds
            n_ins = ((args.semantic_dim > -1) and (l == 0)) and 32 or 4
            for s in range(n_ins):
                print('          - Generate audio for meta-modified ' + str(s))
                tmp_data = in_data[s].clone().unsqueeze(0).repeat(n_recons, 1)
                tmp_data[:, l] = torch.linspace(-4, 4, n_recons)
                tmp_data = model.regression_model(tmp_data)
                # Synthesize meta-modified test example :)                
                audio = synthesize_batch(tmp_data.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=None, name=None)
                save_batch_audio(audio, args.base_audio + '_meta_parameters_z' + str(l) + '_b' + str(s))
        if len(x_tilde.shape) > 3:
            x_tilde = x_tilde[:,0]
        inner = gridspec.GridSpecFromSubplotSpec(1, 8,
            subplot_spec=outer[l*3+1], wspace=0.1, hspace=0.1)
        for n in range(n_recons):
            ax = plt.Subplot(fig, inner[n])
            ax.imshow(x_tilde[n].detach().cpu().numpy(), aspect='auto')
            ax.get_xaxis().set_visible(False)
            ax.get_yaxis().set_visible(False)
            fig.add_subplot(ax)
        # Unscale and un-log output
        x_tilde_full = (x_tilde_full * test_loader.dataset.vars["mel"]) + test_loader.dataset.means["mel"]
        if (args.data in ['mel',"mel_mfcc"]):
            x_tilde_full = torch.exp(x_tilde_full)
        x_tilde_full = x_tilde_full[:,0]
        # Compute descriptors
        descs = compute_descriptors(x_tilde_full.detach().cpu().numpy())
        ax = plt.Subplot(fig, outer[l*3+2])
        ax.plot(descs)
        fig.add_subplot(ax)
    # Just fake plots for legends
    fake = torch.linspace(1, len(idx), len(idx)).repeat(out.shape[0], 1)
    ax = plt.Subplot(fig, outer[latent_dims*3])
    ax.plot(fake.numpy())
    ax.legend(test_loader.dataset.final_params)
    fig.add_subplot(ax)
    fake = torch.linspace(1, len(descriptors), len(descriptors)).repeat(out.shape[0], 1)
    ax = plt.Subplot(fig, outer[latent_dims*3+2])
    ax.plot(fake.numpy())
    ax.legend(descriptors)
    fig.add_subplot(ax)
    # Just generate a legend for kicks
    if (name is not None):
        plt.savefig(name + '_meta_parameters.pdf')
        plt.close()
    if (train == False and name is None):
        plt.savefig(args.base_img + '_meta_parameters.pdf')
        plt.close()
"""
###################
Evaluate latent neighborhoods 
###################
"""
def evaluate_latent_neighborhood(model, test_loader, args, train=False, name=None):
    from synth.synthesize import synthesize_batch
    print('  - Evaluate latent neighborhoods.')
    cur_batch = 0
    for (x, y, _, x_wave) in test_loader:
        if (cur_batch > 8):
            break
        # Send to device
        x, y = x.to(args.device), y.to(args.device)
        # Encode our fixed batch
        _, out, _ = model.ae_model(x)
        if (args.semantic_dim > -1):
            out, _ = model.disentangling(out)
        print('  - Generate audio outputs (batch ' + str(cur_batch) + ').')
        # Select two random examples
        ids = [np.random.randint(0, x.shape[0]), np.random.randint(0, x.shape[0])]
        # Generate different local neighborhoods
        for i in [0, 1]:
            v_r = 0.5
            out1 = out[ids[i]] + (torch.randn(8, out.shape[1]) * v_r).to(args.device)
            out1 = model.regression_model(out1)
            audio = synthesize_batch(out1.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=x_wave, name=None)
            save_batch_audio(audio, args.base_audio + '_neighbors_' + str(cur_batch) + '_p' + str(i))
            # Compute mel spectrograms
            full_mels = []
            for b in range(8):
                _, mse, sc, lm, f_mel = spectral_losses(audio[b], x[b], test_loader, args, raw=True)
                if (args.data == 'mel'):
                    f_mel = torch.log(f_mel + 1e-3)
                full_mels.append(f_mel.unsqueeze(0))
            full_mels = torch.cat(full_mels, dim=0)
            # Output batches comparisons
            if len(x.shape)>3: # get rid of mfcc
                x = x[:,0]
            id_full = [ids[i], 1, 2, 3, 4, 5, 6, 7]
            compare_batch_detailed(x[id_full].cpu(), y[id_full].cpu(), full_mels[:8].cpu().numpy(), out1[:8].detach().cpu(), None, x_wave[id_full].cpu(), audio[:8], name=args.base_img + '_neighbors_' + str(cur_batch) + '_' + str(i))
        # Create linear interpolation
        print('Perform interpolation')
        outs = torch.zeros(8, out.shape[1])
        for e in range(8):
            outs[e] = model.regression_model(((out[ids[0]] * ((7.0-e)/7.0)) + (out[ids[1]] * (e/7.0))).unsqueeze(0))[0]
        # Compute mel spectrograms
        full_mels = []
        audio = synthesize_batch(outs.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=x_wave, name=None)
        save_batch_audio(audio, args.base_audio + '_neighbors_' + str(cur_batch) + '_interpolate')
        for b in range(outs.shape[0]):
            _, mse, sc, lm, f_mel = spectral_losses(audio[b], x[b], test_loader, args, raw=True)
            if (args.data == 'mel'):
                f_mel = torch.log(f_mel + 1e-3)
            full_mels.append(f_mel.unsqueeze(0))
        full_mels = torch.cat(full_mels, dim=0)
        # Output batches comparisons
        if len(x.shape)>3: # get rid of mfcc
            x = x[:,0]
        id_full = [ids[0], ids[1], 2, 3, 4, 5, 6, 7]
        compare_batch_detailed(x[id_full].cpu(), y[id_full].cpu(), full_mels[:8].cpu().numpy(), outs[:8].detach().cpu(), None, x_wave[id_full].cpu(), audio[:8], name=args.base_img + '_neighbors_' + str(cur_batch) + 'interpolate')
        cur_batch += 1

    
"""
###################
Reconstruction evaluation for AE models
###################
"""
def evaluate_reconstruction(model, test_loader, args, train=False, name=None):
    mse_losses, sc_losses, lm_losses = [], [], []
    print('  - Evaluate reconstruction losses.')
    for (x, y, _, _) in test_loader:
        # Send to device
        x, y = x.to(args.device), y.to(args.device)
        # Auto-encode current batch
        x_tilde, z_tilde, z_loss = model.ae_model(x)
        if (args.semantic_dim > -1):
            z_tilde, _ = model.disentangling(z_tilde)
        # Compute spectral losses
        _, mse_loss, sc_loss, lm_loss, _ = spectral_losses(x_tilde, x, test_loader, args=args, raw=False)
        # Append to final
        mse_losses.append(mse_loss)
        sc_losses.append(sc_loss)
        lm_losses.append(lm_loss)
        x_tilde = None
    final_mse = torch.cat(mse_losses, dim=0)
    final_sc = torch.cat(sc_losses, dim=0)
    final_lm = torch.cat(lm_losses, dim=0)
    loss_stats = [final_mse.mean().cpu(), final_mse.std().cpu(), 
                  final_sc.mean().cpu(), final_sc.std().cpu(),
                  final_lm.mean().cpu(), final_lm.std().cpu()]
    # Save re-synthesis results   
    if (name is not None):
        np.save(name + '.recons.results', loss_stats)
    if (train == False):
        np.save(args.base_model + '.recons.results', loss_stats)
    return loss_stats, final_mse, final_sc, final_lm

"""
###################


Generic evaluation 

    - Parameters evaluation
    - Synthesis (through synth)
    - Projection of new sounds


###################
"""
    
"""
###################
Parameters evaluation
###################
"""
def evaluate_params(model, test_loader, args, losses=[], train=False, name=None):
    print('  - Evaluate parameters losses.')
    mse = nn.MSELoss(reduction = 'none')
    l1 = nn.SmoothL1Loss(reduction = 'none')
    mse_losses = []
    l1_losses = []
    final_params = []
    if (len(losses) > 0):
        losses = losses.cpu()
    for (x, y, _, _) in test_loader:
        # Send to device
        x, y = x.to(args.device), y.to(args.device)
        # Encode our fixed batch
        out = model(x)
        if (args.loss in ['multinomial']):
            tmp = out.view(out.shape[0], -1, y.shape[1]).max(dim=1)[1]
            out = tmp.float() / (args.n_classes - 1.)
        if (args.loss in ['multi_mse']):
            out = out.view(out.shape[0], -1, y.shape[1])
            out = out[:, -1, :]
        final_params.append(out)
        mse_losses.append(mse(out, y) / torch.mean(mse(y, torch.zeros_like(y).to(args.device)) + 1e-9))
        l1_losses.append(l1(out, y) / torch.mean(l1(y, torch.zeros_like(y).to(args.device) + 1e-9)))
    print('  - Computing losses stats.')
    final_mse = torch.cat(mse_losses, dim=0)
    final_l1 = torch.cat(l1_losses, dim=0)
    loss_stats = [final_mse.mean().cpu(), final_mse.std().cpu(), final_l1.mean().cpu(), final_l1.std().cpu()]
    print(loss_stats)
    # Save parameters difference results
    if (name is not None):
        np.save(name + '.params.results', [losses, loss_stats])
    if (train == False and name is None):
        if (losses.sum() > 0):
            np.save(args.base_model + '.params.results', [losses, loss_stats])
   
"""
###################
Synthesis evaluation
###################
""" 
def evaluate_synthesis(model, test_loader, args, train=False, name=None):
    from synth.synthesize import synthesize_batch
    print('  - Evaluate audio synthesis losses.')
    n_evals = 0
    sc_losses = []
    lm_losses = []
    mse_losses = []
    for (x, y, _, x_wave) in test_loader:
        if (n_evals > args.batch_evals):
            break
        # Debug mode
        if (args.epochs == 1):
            x, y, x_wave = x[:2], y[:2], x_wave[:2]
        # Send to device
        x, y = x.to(args.device), y.to(args.device)
        # Encode our fixed batch
        out = model(x)
        if (args.loss in ['multinomial']):
            tmp = out.view(out.shape[0], -1, y.shape[1]).max(dim=1)[1]
            out = tmp.float() / (args.n_classes - 1.)
        if (args.loss in ['multi_mse']):
            out = out.view(out.shape[0], -1, y.shape[1])
            out = out[:, -1, :]
        print('  - Generate audio outputs.')
        # Generate the test batch for comparison
        audio = synthesize_batch(out.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=x_wave, name=args.base_audio + '_batch_' + str(n_evals))
        # Compute mel spectrogram
        full_mels = []
        for b in range(x.shape[0]):
            _, mse, sc, lm, f_mel = spectral_losses(audio[b], x[b], test_loader, args, raw=True)
            sc_losses.append(sc)
            lm_losses.append(lm)
            mse_losses.append(mse)
            if (args.data == 'mel'):
                f_mel = torch.log(f_mel + 1e-3)
            full_mels.append(f_mel.unsqueeze(0))
        full_mels = torch.cat(full_mels, dim=0)
        # Output batches comparisons
        if len(x.shape)>3: # get rid of mfcc
            x = x[:,0]
        if (n_evals < args.batch_out):
            compare_batch_detailed(x[:8].cpu(), y[:8].cpu(), full_mels[:8].cpu().numpy(), out[:8].detach().cpu(), None, x_wave[:8], audio[:8], name=args.base_img + '_final_' + str(n_evals))
        full_mels = None
        n_evals += 1
    # Concatenate losses
    final_sc = torch.cat(sc_losses, dim=0)
    final_lm = torch.cat(lm_losses, dim=0)
    final_mse = torch.cat(mse_losses, dim=0)
    print([final_sc.mean().cpu(), final_sc.std().cpu(), final_lm.mean().cpu(), final_lm.std().cpu(), final_mse.mean().cpu(), final_mse.std().cpu()])
    # Save re-synthesis results   
    if (name is not None):
        np.save(name + '.synth.results', [final_sc.mean().cpu(), final_sc.std().cpu(), final_lm.mean().cpu(), final_lm.std().cpu(), final_mse.mean().cpu(), final_mse.std().cpu()])
    if (train == False):
        np.save(args.base_model + '.synth.results', [final_sc.mean().cpu(), final_sc.std().cpu(), final_lm.mean().cpu(), final_lm.std().cpu(), final_mse.mean().cpu(), final_mse.std().cpu()])

"""
###################
Evaluate sounds from different synths
###################
""" 
def evaluate_projection(model, test_loader, args, train=False, name=None, type_val='project'):
    n_evals = 0
    sc_losses = []
    lm_losses = []
    mse_losses = []
    # Go through the testing sounds
    for (x, x_wave) in test_loader:
        if (n_evals > args.batch_evals):
            break
        # Send to device
        x = x.to(args.device)
        # Encode our fixed batch
        if (not (args.model in ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn'])): 
            # Auto-encode
            x_tilde, z_tilde, z_loss = model.ae_model(x)
            if (args.semantic_dim > -1):
                z_tilde, _ = model.disentangling(z_tilde)
            # Perform regression on params
            out = model.regression_model(z_tilde)
        else:
            out = model(x)
        if (args.loss in ['multinomial']):
            tmp = out.view(out.shape[0], args.n_classes, -1).max(dim=1)[1]
            out = tmp.float() / (args.n_classes - 1.)
        if (args.loss in ['multi_mse']):
            out = out.view(out.shape[0], args.n_classes + 1, -1)
            out = out[:, -1, :]
        if (args.synthesize == True):
            from synth.synthesize import synthesize_batch
            # Generate the test batch for comparison
            audio = synthesize_batch(out.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=x_wave, name=args.base_audio + '_' + type_val + '_' + str(n_evals))
            # Compute mel spectrogram
            for b in range(x.shape[0]):
                _, mse, sc, lm, f_mel = spectral_losses(audio[b], x[b], test_loader, args, raw=True)
                sc_losses.append(sc)
                lm_losses.append(lm)
                mse_losses.append(mse)
        n_evals += 1
    # Concatenate losses
    final_sc = torch.cat(sc_losses, dim=0)
    final_lm = torch.cat(lm_losses, dim=0)
    final_mse = torch.cat(mse_losses, dim=0)
    print([final_sc.mean().cpu(), final_sc.std().cpu(), final_lm.mean().cpu(), final_lm.std().cpu(), final_mse.mean().cpu(), final_mse.std().cpu()])
    # Save projection results   
    if (name is not None):
        np.save(name + '.' + type_val + '.results', [final_sc.mean().cpu(), final_sc.std().cpu(), final_lm.mean().cpu(), final_lm.std().cpu(), final_mse.mean().cpu(), final_mse.std().cpu()])
    if (train == False):
        np.save(args.base_model + '.' + type_val + '.results', [final_sc.mean().cpu(), final_sc.std().cpu(), final_lm.mean().cpu(), final_lm.std().cpu(), final_mse.mean().cpu(), final_mse.std().cpu()])

"""
###################


Combined evaluations
    - Batch evaluation (during train)
    - Full final evaluation (end of train)
    - Model checking (for compiled results on same test set)


###################
"""

"""
###################
Full final evaluation (end of train)
###################
""" 
def evaluate_model(model, fixed_data, test_loader, args, train=False, name=None):
    # Retrieve different datas
    (x, y, meta, wave) = fixed_data
    # Non-generative models
    if (args.model in ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn']):
        out = model(x)
        x_tilde = None
    else:
        # Auto-encode
        x_tilde, z_tilde, z_loss = model.ae_model(x)
        if (args.semantic_dim > -1):
            z_tilde, _ = model.disentangling(z_tilde)
        # Perform regression on params
        out = model.regression_model(z_tilde)
        # Handle variables
        x_tilde = x_tilde.detach().cpu()
    if (args.loss in ['multinomial']):
        tmp = out.view(args.batch_size, -1, y.shape[1]).max(dim=1)[1]
        out = tmp.float() / (args.n_classes - 1.)
    if (args.loss in ['multi_mse']):
        out = out.view(args.batch_size, -1, y.shape[1])
        out = out[:, -1, :]
    # Plot the fixed batch for comparison
    if args.data == "mel_mfcc": # plot just the melspectrogram
        x = x[:,0]
        if not x_tilde is None:
            x_tilde = x_tilde[:,0]
    print(x.shape)
    if (x_tilde is None):
        compare_batch_detailed(x[:8].cpu(), y[:8].cpu(), None, out[:8].detach().cpu(), None, name=name)
    else:
        compare_batch_detailed(x[:8].cpu(), y[:8].cpu(), x_tilde[:8], out[:8].detach().cpu(), None, name=name)
    # Full evaluation for generative models
    if (not (args.model in ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn'])):
        # Analyze reconstruction of the model
        evaluate_reconstruction(model, test_loader, args, train=train, name=name)
        # First analyze latent space
        # args = evaluate_latent_space(model, test_loader, args, train=train, name=name)
        # Then analyze meta_parameters
        evaluate_meta_parameters(model, test_loader, args, train=train, name=name)

"""
###################
Model checking (for compiled results on same test set)
###################
"""
def check_model(base_model, model_name, fixed_data, test_loader, args):
    train_l = torch.zeros(200, 3)
    param_r = torch.zeros(4)
    synth_r = torch.zeros(6)
    project_r = torch.zeros(6)
    recons_r = torch.zeros(6)
    fig_names = base_model.replace('models', 'final')
    d = ''#(args.device == 'cpu') and '.cpu' or ''
    # Check if a non k-fold run model exists
    if (os.path.isfile(base_model + d + '.model') and args.eval_type == 'full'):
        # Load current model
        model = torch.load(base_model + d + '.model')
        # Perform full evalution
        evaluate_model(model, fixed_data, test_loader, args, name=fig_names)
    # Check parameters results are found
    if (os.path.isfile(base_model + '.params.results' + d + '.npy')):
        param_res = np.load(base_model + '.params.results' + d + '.npy')
        print(base_model)
        if len(param_res) == 4:
            param_r = torch.Tensor([p.item() for p in param_res])
        else:
            train_l = param_res[0]
            if (train_l[:, 2].max() > 1.5):
                train_l = train_l.clamp(0, 1)
            param_r = torch.cat([p.unsqueeze(0) for p in param_res[1]])
        if (sum(torch.isinf(param_r)) + sum(torch.isnan(param_r)) > 0):
            param_r = torch.zeros(4)
            
        #plt.figure()
        #plt.plot(train_l[50:, 2].detach().numpy())
        #plt.title(base_model)
        if (train_l.shape[0] > 200):
            train_l = train_l[:200]
            print('Params:')
            print(param_r)
    # Check synthesis results are found
    if (os.path.isfile(base_model + '.synth.results' + d + '.npy')):
        param_res = np.load(base_model + '.synth.results' + d + '.npy')
        synth_r = torch.from_numpy(param_res)
        print(base_model)
        print('Synth:')
        print(synth_r)
        if (sum(torch.isinf(synth_r)) + sum(torch.isnan(synth_r)) > 0):
            synth_r = torch.zeros(6)
    # Check projection results are found
    if (os.path.isfile(base_model + '.project.results' + d + '.npy')):
        param_res = np.load(base_model + '.project.results' + d + '.npy')
        project_r = torch.from_numpy(param_res)
        print('Project:')
        print(project_r)
        if (sum(torch.isinf(project_r)) + sum(torch.isnan(project_r)) > 0):
            project_r = torch.zeros(6)
    # Check projection results are found
    if (os.path.isfile(base_model + '.recons.results' + d + '.npy')):
        param_res = np.load(base_model + '.recons.results' + d + '.npy')
        recons_r = torch.from_numpy(param_res)
        #print('Recons:')
        #print(recons_r)
        if (sum(torch.isinf(recons_r)) + sum(torch.isnan(recons_r)) > 0):
            recons_r = torch.zeros(6)
    return train_l, param_r, synth_r, project_r, recons_r
    
if __name__ == '__main__':
    # Define arguments
    parser = argparse.ArgumentParser()
    # Data arguments
    parser.add_argument('--path',       type=str,   default='/Users/esling/Datasets/diva_dataset', help='')
    parser.add_argument('--output',     type=str,   default='flow_results_final/32par/', help='')
    parser.add_argument('--dataset',    type=str,   default='toy', help='')
    parser.add_argument('--data',       type=str,   default='mel', help='')
    parser.add_argument('--batch_size', type=int,   default=128, help='')
    parser.add_argument('--n_classes',  type=int,   default=64, help='')
    parser.add_argument('--nbworkers',  type=int,   default=0, help='')
    parser.add_argument('--epochs',     type=int,   default=100, help='')
    parser.add_argument('--device',     type=str,   default='cpu', help='')
    parser.add_argument('--eval_type',  type=str,   default='summary', help='')
    parser.add_argument('--test_regress',type=int,   default=1 , help='')
    args = parser.parse_args()
    if (args.device != 'cpu'):
        matplotlib.use('agg')
        args.synthesize = True
        # Import synthesis
        from synth.synthesize import create_synth
        # Create synth rendering system
        args.engine, args.generator, args.param_defaults, args.rev_idx = create_synth()
    # List of datas
    data = ['mel', 'mfcc', 'mel_mfcc']
    # Models list
    models = ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn', 'ae', 'vae', 'wae', 'vae_flow']
    # List of losses
    losses = ['mse', 'l1', 'multinomial', 'multi_mse']
    # List of layers
    layers = ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn']
    test_regressors = (args.test_regress > 0) #False
    # Regressors
    if (test_regressors == True):
        regressor = ['mlp', 'flow_cde', 'flow_ext', 'flow_kl_f', 'flow_trans', 'flow_kl', 'flow_post']
        #args.output = 'flow_results_regress'
    else:
        regressor = ['mlp']#, 'flow_cde', 'flow_ext', 'flow_kl_f', 'flow_trans', 'flow_kl', 'flow_post']
        #args.output = 'flow_results_final/32par/'
    # Save all results
    train_losses = torch.zeros(200, 3, len(data), len(models), len(losses), len(layers), 6)
    param_results = torch.zeros(4, len(data), len(models), len(losses), len(layers), 6)
    synth_results = torch.zeros(6, len(data), len(models), len(losses), len(layers), 6)
    proj_results = torch.zeros(6, len(data), len(models), len(losses), len(layers), 6)
    recons_results = torch.zeros(6, len(data), len(models), len(losses), len(layers), 6)
    # Parse through results
    for d in range(len(data)):
        args.data = data[d]
        if (args.eval_type == 'full'):
            print('[Loading dataset for ' + data[d] + ']')
            train_loader, valid_loader, test_loader, args = load_dataset(args)
            #% Take fixed batches (test set)
            b_data, b_params, b_meta, b_audio = next(iter(test_loader))
            batch_data = (b_data, b_params, b_meta, b_audio)
        else:
            print('[Summary analysis - no data loading.]')
            test_loader = None
            batch_data = None
        #% Parse through different models        
        for m in range(len(models)):
            args.model = models[m]
            for l in range(len(losses)):
                args.loss = losses[l]
                # Model save file
                model_name = '{0}_{1}_{2}'.format(args.model, args.data, args.loss)
                base_models = '{0}/models/{1}'.format(args.output, model_name)
                # Check across runs
                for k in range(1, 5):
                    model_name_r = model_name + '_' + str(k)
                    base_dir = base_models + '_' + str(k)
                    # Check k-fold model    
                    train_l, param_r, synth_r, proj_r, recons_r = check_model(base_dir, model_name_r, batch_data, test_loader, args)
                    train_losses[:len(train_l), :, d, m, l, 0, k] = train_l
                    param_results[:, d, m, l, 0, k] = param_r
                    synth_results[:, d, m, l, 0, k] = synth_r
                    proj_results[:, d, m, l, 0, k] = proj_r
                    recons_results[:, d, m, l, 0, k] = recons_r
                    if (args.model in ['ae', 'vae', 'wae', 'vae_flow']):
                        for la in range(len(layers)):
                            args.layers = layers[la]
                            for reg in range(len(regressor)):
                                regress = regressor[reg]
                                model_name_r = model_name + '_' + args.layers + '_' + regress + '_' + str(k)
                                base_dir = base_models + '_' + args.layers + '_' + regress + '_'  + str(k)
                                if (args.model == 'vae_flow'):
                                    model_name_r = model_name + '_' + args.layers + '_' + regress + '_iaf_' + str(k)
                                    base_dir = base_models + '_' + args.layers + '_' + regress + '_iaf_' + str(k)
                                # Check k-fold model    
                                train_l, param_r, synth_r, proj_r, recons_r = check_model(base_dir, model_name_r, batch_data, test_loader, args)
                                train_losses[:len(train_l), :, d, m, l, la, k] = train_l
                                param_results[:, d, m, l, la, k] = param_r
                                synth_results[:, d, m, l, la, k] = synth_r
                                proj_results[:, d, m, l, la, k] = proj_r
                                recons_results[:, d, m, l, la, k] = recons_r
    #zerzer
    if (test_regressors):
        sdivns
    def boxplot_value(full_results_c, val_names, dim, cond=None, dim_cond=0, cond_sub=0, name=None, ax=None):
        # Analyze flow
        if (cond is None):
            plt.figure()
            ax = plt.subplot(111)
        for rz in range(0, full_results_c.shape[0], 2):
            full_results = full_results_c[rz] / torch.max(full_results_c[rz])
            r_start = ((rz / 2) * len(val_names))
            if (cond is not None):
                full_results = np.take(full_results, cond, axis=dim_cond).unsqueeze(dim_cond)
            for r in range(len(val_names)):
                #cur_name = val_names[r]
                cur_mse = np.take(full_results, r, axis=dim).flatten()
                cur_mse = cur_mse[cur_mse.nonzero()].t()
                ax.boxplot(cur_mse, positions = [r_start + r + 1])
        ax.set_xlim(0.5, r_start + r + 1.5)
        ax.set_xticks(np.linspace(1, len(val_names), len(val_names)))
        ax.set_xticklabels(val_names)
        for tick in ax.get_xticklabels():
            tick.set_rotation(90)
        #ax.xticks(np.linspace(1, len(val_names), len(val_names)), val_names, rotation='vertical')
        if (name is not None):
            plt.savefig(name + '.pdf')
            plt.close()
        
    def evaluate_train_curves(train_loss, val_names, dim, cond=None, dim_cond=0, cond_sub=0):
        # Analyze flow
        if (cond is None):
            fig = plt.figure()
            ax = plt.subplot(111)
        else:
            train_loss = np.take(train_loss.detach(), cond, axis=dim_cond).unsqueeze(dim_cond)
            ax = plt.subplot(cond_sub)
        axis_legend = []
        N = len(val_names)
        cmap = plt.cm.get_cmap('jet', len(val_names))
        # Fill all configurations
        mean_curves, min_curves, max_curves = [np.zeros(200)] * N, [np.zeros(200)] * N, [np.zeros(200)] * N
        for v in range(len(val_names)):
            axis_legend.append(val_names[v])
            var_curves = np.take(train_loss.detach(), v, dim)
            var_curves = var_curves.transpose(0, var_curves.ndimension() - 1).contiguous().view(-1, 200).detach().numpy()
            var_nonz, = np.nonzero(np.sum(var_curves, axis=1))
            if (len(var_nonz) == 0):
                continue
            # Only keep non_zeros
            var_curves = var_curves[var_nonz, :]
            # Compute curves
            min_curves[v] = np.min(var_curves, axis=0)
            max_curves[v] = np.max(var_curves, axis=0)
            mean_curves[v] = np.mean(var_curves, axis=0)
        for v in range(len(val_names)):
            ax.plot(mean_curves[v], c=cmap(v), linewidth = 2.5, alpha = 0.85)
        for v in range(len(val_names)):
            ax.plot(min_curves[v], c=cmap(v), linewidth = 0.75, alpha = 0.6)
            ax.plot(max_curves[v], c=cmap(v), linewidth = 0.75, alpha = 0.6)
            for i in range(1, 200):
                plt.fill([i-1, i-1, i, i], [min_curves[v][i-1], max_curves[v][i-1], max_curves[v][i], min_curves[v][i]], c=cmap(v), alpha=0.2)
        ax.legend(axis_legend)
        
    def print_table(full_results, val_names, dim, file, cond=None, dim_cond=0, cond_sub=0):
        # Analyze flow
        if (cond is not None):
            full_results = np.take(full_results, cond, axis=dim_cond).unsqueeze(dim_cond)
        for ops in [np.min, np.mean]:
            print_all(ops.__name__, file)
            for r in range(len(val_names)):
                cur_name = val_names[r]
                cur_loss = np.take(full_results, r, axis=dim).view(full_results.shape[0], -1).numpy()
                loss_nonz, = np.nonzero(np.sum(cur_loss, axis=0))
                cur_loss = cur_loss[:, loss_nonz]
                if (cur_loss.shape[1] == 0):
                    continue
                ops_vals = ops(cur_loss, axis=1)
                str_vals = ['%.4f'%v for v in ops_vals]
                print_all('%16s\t%s'%(cur_name, str_vals), file)
    
    def print_all(msg, files):
        print(msg)
        for f in files:
            f.write(msg + '\n')

    analysis_vals = [data, models, losses, layers]  
    analysis_names = ['data', 'models', 'losses', 'layers'] 
    res_list = {'params':param_results,'synth':synth_results, 'proj':proj_results, 'recons':recons_results}
    #param_results = torch.zeros(4, len(data), len(models), len(losses), len(layers), 6)
    #synth_results = torch.zeros(6, len(data), len(models), len(losses), len(layers), 6)
    for k, v in res_list.items():    
        files = [args.output + '/final/summary.'+k+'.txt', args.output + '/final/summary.'+k+'.fixed.txt']
        files = [open(f, 'w') for f in files]
        base_name = args.output + '/final/' + k
        cur_res = v
        #losses = [param_results]
        for a in range(len(analysis_vals)):
            out_name = base_name + '_' + analysis_names[a]
            boxplot_value(cur_res, analysis_vals[a], a, name=out_name)
            #evaluate_train_curves(train_losses[:, 2], analysis_vals[a], a+1)
            # Print a loss table based on averaging
            print_all('-----------', files)
            print_all(str(analysis_vals[a]), files)
            print_table(cur_res, analysis_vals[a], a+1, [files[0]])
            # Create compound figure
            fig = plt.figure(figsize=(5, 10))
            outer = gridspec.GridSpec(len(analysis_vals[a]), 1, wspace=0.2, hspace=0.4)
            for cur_cond in range(len(analysis_vals[a])):
                cur_id = 1
                print(len(analysis_vals))
                inner = gridspec.GridSpecFromSubplotSpec(1, len(analysis_vals)-1, subplot_spec=outer[cur_cond], wspace=0.1, hspace=0.1)
                for a_id in range(len(analysis_vals)):
                    if (a == a_id):
                        continue
                    print(cur_id)
                    ax = plt.Subplot(fig, inner[cur_id-1])
                    boxplot_value(cur_res, analysis_vals[a_id], a_id, cur_cond, a, 100 + ((len(analysis_vals) - 1) * 10) + cur_id, ax=ax)
                    fig.add_subplot(ax)
                    cur_id += 1
                #outer[cur_cond].set_title(analysis_vals[a][cur_cond])
                cur_id = 1
                #fig = plt.figure(figsize=(10, 5))
                #for a_id in range(len(analysis_vals)):
                #    if (a == a_id):
                #        continue
                    #evaluate_train_curves(train_losses[:, 2], analysis_vals[a_id], a_id + 1, cur_cond, a + 1, 100 + ((len(analysis_vals) - 1) * 10) + cur_id)
                #    cur_id += 1
                #fig.suptitle(analysis_vals[a][cur_cond])
                #fig.show()
                files[1].write('*** Fixing as ' + analysis_vals[a][cur_cond] + ' ***\n')
                for a_id in range(len(analysis_vals)):
                    if (a == a_id):
                        continue
                    print_table(cur_res, analysis_vals[a_id], a_id+1, [files[1]], cur_cond, a + 1)
            fig.show()
            plt.savefig(out_name + '_fixed.pdf')
            plt.close()
        [f.close() for f in files]
            
        
#%%
    print('Param results :')
    for d in range(len(data)):
        print(data[d])
        param_results[:, d, :, :]
        for m in range(len(models)):
            print(models[m])
            for l in range(len(losses)):
                if (torch.sum(param_results[:, d, m, l, :]) == 0):
                    continue
                if (models[m] in ['ae', 'vae', 'wae', 'vae_flow']):
                    for la in range(len(layers)):
                        print(losses[l][:7] + '\t' + str(param_results[:, d, m, l, la, 1]))
                else:                    
                    print(losses[l][:7] + '\t' + str(param_results[:, d, m, l, 0, 1]))
    print('Synth results :')
    for d in range(len(data)):
        print(data[d])
        param_results[:, d, :, :]
        for m in range(len(models)):
            print(models[m])
            for l in range(len(losses)):
                if (torch.sum(param_results[:, d, m, l, :]) == 0):
                    continue
                print(losses[l][:7] + '\t' + str(synth_results[:, d, m, l, 0, 1]))
                
