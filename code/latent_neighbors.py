# -*- coding: utf-8 -*-

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

def evaluate_neighborhood(model, test_loader, args, train=False, name=None):
    from synth.synthesize import synthesize_batch
    print('  - Evaluate audio synthesis losses.')
    cur_batch = 0
    for (x, y, _, x_wave) in test_loader:
        print('Loading')
        # Send to device
        x, y = x.to(args.device), y.to(args.device)
        print('Loaded')
        # Encode our fixed batch
        _, out, _ = model.ae_model(x)
        print('  - Generate audio outputs.')
        # Select two random examples
        ids = [np.random.randint(0, x.shape[0]), np.random.randint(0, x.shape[0])]
        # Generate different local neighborhoods
        for i in [0, 1]:
            for v_r in [1, 0.5, 0.2]:
                out1 = out[ids[i]] + (torch.randn(64, out.shape[1]) * v_r).to(args.device)
                out1 = model.regression_model(out1)
                audio = synthesize_batch(out1.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=x_wave, name=None)
                # Compute mel spectrograms
                full_mels = []
                for b in range(x.shape[0]):
                    _, mse, sc, lm, f_mel = spectral_losses(audio[b], x[b], test_loader, args, raw=True)
                    if (args.data == 'mel'):
                        f_mel = torch.log(f_mel + 1e-3)
                    full_mels.append(f_mel.unsqueeze(0))
                full_mels = torch.cat(full_mels, dim=0)
                # Output batches comparisons
                if len(x.shape)>3: # get rid of mfcc
                    x = x[:,0]
                id_full = [ids[i], 1, 2, 3, 4, 5, 6, 7]
                compare_batch_detailed(x[id_full].cpu(), y[id_full].cpu(), full_mels[:8].cpu().numpy(), out1[:8].detach().cpu(), None, x_wave[id_full].cpu(), audio[:8], name=name + '_' + str(cur_batch) + '_' + str(i) + '_' + str(v_r))
        # Create linear interpolation
        print('Perform interpolation')
        outs = torch.zeros(8, out.shape[1])
        for e in range(8):
            outs[e] = model.regression_model(((out[ids[0]] * ((7.0-e)/7.0)) + (out[ids[1]] * (e/7.0))).unsqueeze(0))[0]
        # Compute mel spectrograms
        full_mels = []
        audio = synthesize_batch(outs.cpu(), test_loader.dataset.final_params, args.engine, args.generator, args.param_defaults, args.rev_idx, orig_wave=x_wave, name=None)
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
        compare_batch_detailed(x[id_full].cpu(), y[id_full].cpu(), full_mels[:8].cpu().numpy(), outs[:8].detach().cpu(), None, x_wave[id_full].cpu(), audio[:8], name=name + '_' + str(cur_batch) + 'interpolate')
        
# Define arguments
parser = argparse.ArgumentParser()
# Data arguments
parser.add_argument('--path',       type=str,   default='/fast-2/datasets/diva_dataset/', help='')
parser.add_argument('--ref_model',  type=str,   default='/fast-1/philippe/flow_results_final/32par/models/vae_flow_mel_mse_cnn_mlp_iaf_1.model', help='')
parser.add_argument('--output',     type=str,   default='/fast-1/philippe/flow_results_final/32par/', help='')
parser.add_argument('--dataset',    type=str,   default='32par', help='')
parser.add_argument('--data',       type=str,   default='mel', help='')
parser.add_argument('--batch_size', type=int,   default=128, help='')
parser.add_argument('--n_classes',  type=int,   default=64, help='')
parser.add_argument('--nbworkers',  type=int,   default=0, help='')
parser.add_argument('--epochs',     type=int,   default=100, help='')
parser.add_argument('--device',     type=str,   default='cuda:2', help='')
parser.add_argument('--eval_type',  type=str,   default='summary', help='')
args = parser.parse_args()
if (args.device != 'cpu'):
    matplotlib.use('agg')
    args.synthesize = True
    # Import synthesis
    from synth.synthesize import create_synth
    # Create synth rendering system
    args.engine, args.generator, args.param_defaults, args.rev_idx = create_synth(args.dataset)
# Load dataset
ref_split = args.path + '/reference_split_' + args.dataset+ "_" +args.data + '.npz'
data = np.load(ref_split)['arr_0']
train_loader, valid_loader, test_loader = data[0], data[1], data[2]
# Load model
model = torch.load(args.ref_model)
model = model.to(args.device)
evaluate_neighborhood(model, test_loader, args, train=False, name=args.output + '/neighbors_32')
