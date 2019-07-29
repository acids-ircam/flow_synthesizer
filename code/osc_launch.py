import argparse
import torch
import json, ast
#from matplotlib import pyplot as plt
from osc_server import FlowServer
from utils.data import load_dataset
from evaluate import evaluate_dimensions, evaluate_dataset
from torch.utils.data import DataLoader
import numpy as np
import os

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
# Remove the shuffling from dataset
train_loader = DataLoader(train_loader.dataset, batch_size=64, shuffle=False, num_workers=2)
valid_loader = DataLoader(valid_loader.dataset, batch_size=64, shuffle=False, num_workers=2)
test_loader = DataLoader(test_loader.dataset, batch_size=64, shuffle=False, num_workers=2)

    
#%% Combine sets    
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
characters = []
features = []
categories = []
cat_large = []
for k_hash, v in diva_dataset.items():
    if (v['Meta'].get('Character') is not None):
        [characters.append(x) for x in v['Meta'].get('Character')]
    if (v['Meta'].get('Features') is not None):
        [features.append(x) for x in v['Meta'].get('Features')]
    if (v['Meta'].get('Categories') is not None):
        [categories.append(x) for x in v['Meta'].get('Categories')]
        [cat_large.append(x.split(':')[0]) for x in v['Meta'].get('Categories')]
# Characters
char_count = [[x,characters.count(x)] for x in set(characters)]
char_count = sorted(char_count,key=lambda x: x[1])
# Count features (Arp, Mono, Poly, Chord)
feat_count = [[x,features.count(x)] for x in set(features)]
feat_count = sorted(feat_count,key=lambda x: x[1])
# Sort categories (large: Keys, FX, Drums)
cat_large_count = [[x,cat_large.count(x)] for x in set(cat_large)]
cat_large_count = sorted(cat_large_count,key=lambda x: x[1])
# Sort categories (precise)
cat_count = [[x,categories.count(x)] for x in set(categories)]
cat_count = sorted(cat_count,key=lambda x: x[1])
# Turn counts into IDx
def turn_count_to_idx(l):
    final_dict = {}
    for i in range(len(l)):
        final_dict[l[i][0]] = i + 1
    return final_dict
char_idx = turn_count_to_idx(char_count)
feat_idx = turn_count_to_idx(feat_count)
cat_large_idx = turn_count_to_idx(cat_large_count)
cat_idx = turn_count_to_idx(cat_count)
#%% New dataset check
with open('dataset.txt', 'w') as f:
    cur_id = 0
    sets_len = 0
    for loader in [train_loader, valid_loader, test_loader]:
        sets_len += len(loader)
    f.write('\t(\n')
    f.write('\t\t( presets\n')
    f.write('\t\t\t( hash s )\n')
    f.write('\t\t\t( features s )\n')
    f.write('\t\t\t( category s )\n')
    f.write('\t\t\t( categories s )\n')
    for d in range(32):
        f.write('\t\t\t( x%d f )\n'%(d))
    f.write('\t\t)\n')    
    # Create sets of categorical variables
    set_cat = torch.ones(sets_len, 3) * -1              
    f.write('\t\t(\n')    
    for loader in [train_loader, valid_loader, test_loader]:
        cur_l_id = 0
        for (x, y, meta, _) in loader:
            for b in range(x.shape[0]):           
                f.write('\t\t\t(\n')               
                f.write('\t\t\t\t( preset_id %d )\n'%(cur_id + 1) ) 
                fname = os.path.basename(loader.dataset.data_files[cur_l_id]).split('_')[0]
                f.write('\t\t\t\t( hash %s )\n'%(fname))
                v = diva_dataset[fname]
                if (v['Meta'].get('Character') is not None):
                    pass
                feat_str = 'None'
                if (v['Meta'].get('Features') is not None):
                    cur_f = 0
                    for x in v['Meta'].get('Features'):
                        if (feat_idx[x] > cur_f):
                            cur_f = feat_idx[x]
                            feat_str = x
                f.write('\t\t\t\t( features %s )\n'%(feat_str))
                cat_large_str = 'None'
                cat_str = 'None'
                if (v['Meta'].get('Categories') is not None):
                    cur_c = 0
                    cur_l = 0
                    for x in v['Meta'].get('Categories'):
                        if (cat_idx[x] > cur_c):
                            cur_c = cat_idx[x]
                            cat_str = x
                        x = x.split(':')[0]
                        if (cat_large_idx[x] > cur_l):
                            cur_l = cat_large_idx[x]
                            cat_large_str = x
                f.write('\t\t\t\t( category %s )\n'%(cat_large_str))
                f.write('\t\t\t\t( categories %s )\n'%(cat_str))
                for d in range(final_z.shape[1]):
                    f.write('\t\t\t\t( x%d %f )\n'%(d, final_z[cur_id, model_analysis['d_idx'][d]]))
                print(fname)
                #loaded = np.load(loader.dataset.data_files[cur_l_id])
                #params = loaded['param'].item()
                #params = torch.Tensor([params[p] for p in loader.dataset.final_params])        
                f.write('\t\t\t)\n')          
                cur_l_id += 1
                cur_id += 1
    f.write('\t\t)\n')    
    f.write('/t)\n')
#/Users/esling/Datasets/diva_dataset/32par/raw/940f6727635f57e7b451528455107716_60_100.npz