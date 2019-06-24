#!/usr/bin/env python3

#%% Plotting
import matplotlib
matplotlib.use('agg')
import os
import time
import argparse
import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
# Internal imports
from utils.data import load_dataset, meta_pairs
from models.basic import GatedMLP, GatedCNN, construct_encoder_decoder, construct_flow, construct_regressor
from evaluate import evaluate_model

# Define arguments
parser = argparse.ArgumentParser()
# Data arguments
parser.add_argument('--path',           type=str,   default='',             help='')
parser.add_argument('--test_sounds',    type=str,   default='',             help='')
parser.add_argument('--output',         type=str,   default='outputs',      help='')
parser.add_argument('--dataset',        type=str,   default='32par',        help='')
parser.add_argument('--data',           type=str,   default='mel',          help='')
parser.add_argument('--train_type',     type=str,   default='fixed',        help='')
parser.add_argument('--nbworkers',      type=int,   default=0,              help='')
# Model arguments
parser.add_argument('--model',          type=str,   default='cnn',          help='')
parser.add_argument('--loss',           type=str,   default='mse',          help='')
parser.add_argument('--rec_loss',       type=str,   default='mse',          help='')
parser.add_argument('--n_classes',      type=int,   default=32,             help='')
parser.add_argument('--n_hidden',       type=int,   default=1024,           help='')
parser.add_argument('--n_layers',       type=int,   default=4,              help='')
# Optimization arguments
parser.add_argument('--batch_size',     type=int,   default=128,            help='')
parser.add_argument('--epochs',         type=int,   default=200,            help='')
parser.add_argument('--eval',           type=int,   default=100,            help='')
parser.add_argument('--lr',             type=float, default=2e-4,           help='')
# Semantic arguments
parser.add_argument('--semantic_dim',   type=int,   default=-1,             help='')
parser.add_argument('--semantic_type',  type=str,   default='cnn',          help='')
# CUDA arguments
parser.add_argument('--device',         type=str,   default='cpu',          help='Device for CUDA')
args = parser.parse_args()
# Track start time (for HPC)
start_time = time.time()
# In case we are CPU
args.synthesize = False
# Parameter checking
if (len(args.path) == 0):
    args.path = (args.device == 'cpu') and '/Users/esling/Datasets/diva_dataset' or '/fast-2/datasets/diva_dataset/'
    args.test_sounds = (args.device == 'cpu') and '/Users/esling/Datasets/synth_testing' or '/fast-2/datasets/flow_synthesizer/synth_testing'
    args.vocal_sounds = '/fast-2/datasets/flow_synthesizer/vocal_testing'
    #args.output = (args.device == 'cpu') and 'outputs' or '/fast-1/philippe/flow_results'
if (args.device != 'cpu'):
    args.synthesize = True
    # Enable CuDNN optimization
    torch.backends.cudnn.benchmark=True
# Handling cuda
args.cuda = not args.device == 'cpu' and torch.cuda.is_available()
args.device = torch.device(args.device if torch.cuda.is_available() else 'cpu')
print('Optimization will be on ' + str(args.device) + '.')

"""
###################
Basic definitions
################### 
"""
print('[Loading dataset]')
ref_split = args.path + '/reference_split_' + args.dataset+ "_" +args.data + '.npz'
if (args.train_type == 'random' or (not os.path.exists(ref_split))):
    train_loader, valid_loader, test_loader, args = load_dataset(args)
    # Take fixed batch
    fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(test_loader))
    fixed_data, fixed_params, fixed_meta, fixed_audio = fixed_data.to(args.device), fixed_params.to(args.device), fixed_meta, fixed_audio
    fixed_batch = (fixed_data, fixed_params, fixed_meta, fixed_audio)
    if (args.train_type == 'fixed'):
        np.savez(ref_split, [train_loader, valid_loader, test_loader])
else:
    data = np.load(ref_split)['arr_0']
    train_loader, valid_loader, test_loader = data[0], data[1], data[2]
    fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(test_loader))
    fixed_data, fixed_params, fixed_meta, fixed_audio = fixed_data.to(args.device), fixed_params.to(args.device), fixed_meta, fixed_audio
    fixed_batch = (fixed_data, fixed_params, fixed_meta, fixed_audio)
    args.output_size = train_loader.dataset.output_size
    args.input_size = train_loader.dataset.input_size

#%%
"""
###################
Semantic data analysis
################### 
"""
favs = [0, 1, 3, 4]
print('Favorite dims : ')
print(meta_pairs[favs[0] + 1])
print(meta_pairs[favs[1] + 1])
print(meta_pairs[favs[2] + 1])
print(meta_pairs[favs[3] + 1])
print('Analyzing basic tags properties')
print(meta_pairs)
# Create basic structures for stats
full_params = []
full_meta = []
nb_tags = torch.zeros(len(favs), 3).float()
batch_seen = torch.zeros(len(favs), 3).float()
# Checking up basic features
for (loader, l_name) in [(train_loader, 'train'), (valid_loader, 'valid'), (test_loader, 'test')]:
    print(['Analyzing ' + l_name])
    for (_, params, meta, _) in loader:
        nb_tags += meta[:, favs].sum(dim=0).float()
        batch_seen += meta[:, favs].sum(dim=0).float().clamp(0, 1)
        full_params.append(params)
        full_meta.append(meta[:, favs])
    print('Number per batch')
    print(nb_tags / len(loader))
    print(batch_seen / len(loader))
full_params = torch.cat(full_params, dim=0)
full_meta = torch.cat(full_meta, dim=0)
#%%
# Now analyze global tags properties
full_var = full_params.std(dim=0)
for f in range(len(favs)):
    print('Full variance :')
    print(full_var)
    for c in range(3):
        print(meta_pairs[favs[f] + 1][c])
        # Find ids of that class
        ids = (full_meta[:, f, c] == 1)
        cur_var = (full_params[ids].std(dim=0))
        print(torch.abs(cur_var - full_var)/full_var)

#%% Now try to optimize our favs (based on parameters)
"""
for f in range(len(favs)):
    print('About to classify this from parameters')
    print(meta_pairs[favs[f] + 1])
    cur_tag = favs[f]
    # Create baseline classifier on parameters
    model = GatedMLP(full_params.shape[1], 2, hidden_size = 128, n_layers = 5, type_mod='normal').float().to(args.device)
    # Optimizer model
    optimizer = optim.Adam(model.parameters(), lr=args.lr)
    # Learning rate scheduler
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode='min', factor=0.5, patience=20, verbose=True, threshold=1e-7)
    # Create loss
    loss = nn.CrossEntropyLoss(reduction='none').float().to(args.device)
    # Vector of final losses
    losses = torch.zeros(args.epochs, 3)
    # Train the model
    for i in range(args.epochs):
        print('Epoch ' + str(i))
        # Go through the 3 sets
        for (loader, l_name, l_i) in [(train_loader, 'train', 0), (valid_loader, 'valid', 1), (test_loader, 'test', 2)]:
            if (l_name == 'train'):
                model.train()
            else:
                model.eval()
            full_loss = 0
            for (_, y, meta, _) in loader:
                meta = meta[:, favs[f]].squeeze(1)
                target = meta[:, 1].long().to(args.device)
                y, meta = y.to(args.device).float(), meta.to(args.device).float()
                # Separate examples
                loss_mask = 1 - meta[:, 2]
                observed_examples = loss_mask.eq(1)
                unknown_examples = loss_mask.eq(0)
                optimizer.zero_grad()
                out = torch.softmax(model(y), dim=1)
                b_loss = (loss_mask * loss(out, target)).sum()
                if (l_name == 'train'):
                    b_loss.backward()
                    optimizer.step()
                full_loss += b_loss.item()
            full_loss /= len(loader)
            losses[i, l_i] = full_loss
            if (l_name == 'valid'):
                scheduler.step(full_loss)
        print(losses[i, :])
    # Now save reference results
    torch.save(losses, args.output + '/models/classify_params_' + meta_pairs[0][favs[f]] + '.results')
"""
               
#%% Now try to optimize our favs (based on audio)
args.kernel = 5
args.dilation = 3
for f in range(len(favs)):
    print('About to classify this from audio')
    print(meta_pairs[favs[f] + 1])
    cur_tag = favs[f]
    # Create baseline classifier on parameters
    model = GatedCNN(args.input_size, 2, n_layers = 3, type_mod='normal', args=args).float().to(args.device)
    # Optimizer model
    optimizer = optim.Adam(model.parameters(), lr=args.lr)
    # Learning rate scheduler
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode='min', factor=0.5, patience=20, verbose=True, threshold=1e-7)
    # Create loss
    loss = nn.CrossEntropyLoss(reduction='none').float().to(args.device)
    # Vector of final losses
    losses = torch.zeros(args.epochs, 3)
    # Train the model
    for i in range(args.epochs):
        print('Epoch ' + str(i))
        # Go through the 3 sets
        for (loader, l_name, l_i) in [(train_loader, 'train', 0)]:
            model.train()
            full_loss = 0
            for (x, _, meta, _) in loader:
                meta = meta[:, favs[f]].squeeze(1)
                target = meta[:, 1].long().to(args.device)
                x, meta = x.float().to(args.device), meta.float().to(args.device)
                # Separate examples
                loss_mask = 1 - meta[:, 2]
                observed_examples = loss_mask.eq(1)
                unknown_examples = loss_mask.eq(0)
                optimizer.zero_grad()
                out = torch.softmax(model(x), dim=1)
                b_loss = (loss_mask * loss(out, target)).sum()
                b_loss.backward()
                optimizer.step()
                full_loss += b_loss
            full_loss /= len(loader)
            losses[i, l_i] = full_loss
            if (l_name == 'valid'):
                scheduler.step(full_loss)
        for (loader, l_name, l_i) in [(valid_loader, 'valid', 1), (test_loader, 'test', 2)]:
            model.eval()
            full_loss = 0
            with torch.no_grad():
                for (x, _, meta, _) in loader:
                    meta = meta[:, favs[f]].squeeze(1)
                    target = meta[:, 1].long().to(args.device)
                    x, meta = x.float().to(args.device), meta.float().to(args.device)
                    # Separate examples
                    loss_mask = 1 - meta[:, 2]
                    observed_examples = loss_mask.eq(1)
                    unknown_examples = loss_mask.eq(0)
                    optimizer.zero_grad()
                    out = torch.softmax(model(x), dim=1)
                    b_loss = (loss_mask * loss(out, target)).sum()
                    if (l_name == 'train'):
                        b_loss.backward()
                        optimizer.step()
                    full_loss += b_loss
                full_loss /= len(loader)
                losses[i, l_i] = full_loss
                if (l_name == 'valid'):
                    scheduler.step(full_loss)
        print(losses[i, :])
    # Now save reference results
    torch.save(losses, args.output + '/models/classify_audios_' + meta_pairs[0][favs[f]] + '.results')
        