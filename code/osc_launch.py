import argparse
import torch
import json, ast
#from matplotlib import pyplot as plt
from osc_server import FlowServer
from utils.data import load_dataset
from evaluate import evaluate_dimensions, evaluate_dataset
import os
import numpy as np

# Debug mode
__DEBUG__ = False

parser = argparse.ArgumentParser()
parser.add_argument('--in_port',    type=int,   default=1234)
parser.add_argument('--out_port',   type=int,   default=1235)
parser.add_argument('--ip',         type=str,   default="127.0.0.1")
# Model arguments
parser.add_argument('--model',      type=str,   default="results/32par/vae_flow_mel_mse_cnn_mlp_iaf_1.model")
# Data arguments
parser.add_argument('--path',       type=str,   default='/Users/esling/Datasets/diva_dataset', help='')
parser.add_argument('--dataset',    type=str,   default='32par', help='')
parser.add_argument('--train_type', type=str,   default='fixed', help='')
parser.add_argument('--data',       type=str,   default='mel', help='')
parser.add_argument('--batch_size', type=int,   default=128, help='')
parser.add_argument('--nbworkers',  type=int,   default=0, help='')
parser.add_argument('--reanalyze',  type=int,   default=0, help='')
parser.add_argument('--device',     type=str,   default='cpu', help='')
args = parser.parse_args()

#%%
"""
###################
Load model
###################
"""
model = None
if args.model:
    model = torch.load(args.model, map_location="cpu")
    model = model.eval()

"""
###################
Load dataset
###################
""" 
print('[Loading dataset for ' + args.data + ']')
if (args.train_type == 'random'):
    train_loader, valid_loader, test_loader, args = load_dataset(args)
else:
    ref_split = args.path + '/reference_split_' + args.dataset + "_" + args.data + '.npz'
    print('[About to load]')
    data = np.load(ref_split)['arr_0']
    train_loader, valid_loader, test_loader = data[0], data[1], data[2]
    print('[Changing refs in reference]')
    for idx in range(len(train_loader.dataset.data_files)):
        train_loader.dataset.trans_datasets['mel'].spectral_files[idx] = train_loader.dataset.trans_datasets['mel'].spectral_files[idx].replace('/fast-2/datasets/diva_dataset/', '/Users/esling/Datasets/diva_dataset')
        train_loader.dataset.data_files[idx] = train_loader.dataset.data_files[idx].replace('/fast-2/datasets/diva_dataset/', '/Users/esling/Datasets/diva_dataset')
    for idx in range(len(valid_loader.dataset.data_files)):
        valid_loader.dataset.trans_datasets['mel'].spectral_files[idx] = valid_loader.dataset.trans_datasets['mel'].spectral_files[idx].replace('/fast-2/datasets/diva_dataset/', '/Users/esling/Datasets/diva_dataset')
        valid_loader.dataset.data_files[idx] = valid_loader.dataset.data_files[idx].replace('/fast-2/datasets/diva_dataset/', '/Users/esling/Datasets/diva_dataset')
    for idx in range(len(test_loader.dataset.data_files)):
        test_loader.dataset.trans_datasets['mel'].spectral_files[idx] = test_loader.dataset.trans_datasets['mel'].spectral_files[idx].replace('/fast-2/datasets/diva_dataset/', '/Users/esling/Datasets/diva_dataset')
        test_loader.dataset.data_files[idx] = test_loader.dataset.data_files[idx].replace('/fast-2/datasets/diva_dataset/', '/Users/esling/Datasets/diva_dataset')
    np.savez(ref_split, [train_loader, valid_loader, test_loader])
    
#%% Take fixed batch from test set
fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(train_loader))
# Combine sets    
audioset = [train_loader, valid_loader, test_loader]
# Handle DIVA parameters
with open("synth/diva_params.txt") as f:
    diva_midi_desc = ast.literal_eval(f.read())
rev_idx = {diva_midi_desc[key]: key for key in diva_midi_desc}
if args.dataset == "toy":
    with open("synth/param_nomod.json") as f:
        params_default = json.load(f)
if args.dataset == "32par":
    with open("synth/param_default_32.json") as f:
        params_default = json.load(f)
param_dict = params_default
param_names = test_loader.dataset.final_params
print('[Reference set on which model was trained]')
print(param_names)

#%%
"""
###################
Perform model pre-analysis
###################
""" 
if (not os.path.exists(args.model.replace('.model', '.analysis') + '.npy') or args.reanalyze):
    # Perform dimension evaluation    
    d_idx, d_vars, d_params, d_desc, desc_max =  evaluate_dimensions(model, test_loader)
    # Perform dataset evaluation
    z_trans, final_z, final_meta, pca, z_vars, z_means = evaluate_dataset(model, [train_loader, valid_loader, test_loader])
    # Save information s
    model_analysis = {
     'd_idx':d_idx, 
     'd_vars':d_vars, 
     'd_params':d_params, 
     'd_desc':d_desc, 
     'desc_max':desc_max,
     'z_trans':z_trans, 
     'final_z':final_z,
     'final_meta':final_meta, 
     'pca':pca, 
     'z_vars':z_vars, 
     'z_means':z_means
     }
    np.save(args.model.replace('.model', '.analysis'), model_analysis)
else:
    model_analysis = np.load(args.model.replace('.model', '.analysis') + '.npy').item()

#%%
"""
###################
Create server
###################
"""
server = FlowServer(args.in_port, args.out_port, model=model, dataset=audioset, data=args.data, param_names=param_names, param_dict=param_dict, analysis=model_analysis, debug=__DEBUG__)
#%%
if (__DEBUG__):
    # Test pitch analysis
    print('[Debug mode : Testing server on given functions]')
else:
    print('[Running server on ports in : %d - out : %d]'%(args.in_port, args.out_port))
    server.run()
    
#%% DATASET SHIT
import json, codecs
with codecs.open("dataset.json", encoding="utf-8") as f:
    diva_dataset = json.load(f)
for k_hash, v in diva_dataset.items():
    