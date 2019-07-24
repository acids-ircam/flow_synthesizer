import argparse
import torch
import json, ast
from matplotlib import pyplot as plt
from osc_server import FlowServer
from utils.data import load_dataset
import librosa
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument('--in_port',    type=int,   default=1234)
parser.add_argument('--out_port',   type=int,   default=1235)
parser.add_argument('--ip',         type=str,   default="127.0.0.1")
# Model arguments
parser.add_argument('--model',      type=str,   default="results/vae_flow_mel_mse_cnn_flow_kl_f_iaf_2.model")
# Data arguments
parser.add_argument('--path',       type=str,   default='/Users/esling/Datasets/diva_dataset', help='')
parser.add_argument('--dataset',    type=str,   default='32par', help='')
parser.add_argument('--train_type', type=str,   default='random', help='')
parser.add_argument('--data',       type=str,   default='mel', help='')
parser.add_argument('--batch_size', type=int,   default=128, help='')
parser.add_argument('--nbworkers',  type=int,   default=0, help='')
parser.add_argument('--device',     type=str,   default='cpu', help='')
args = parser.parse_args()


"""
###################
Load model
###################
"""
model = None
if args.model:
    model = torch.load(args.model, map_location="cpu")

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
    data = np.load(ref_split)['arr_0']
    train_loader, valid_loader, test_loader = data[0], data[1], data[2]
# Take fixed batch from test set
fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(test_loader))
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
def transform_wave(wave):
    data = None
    data = librosa.feature.melspectrogram(wave, sr=22050, n_fft=2048, n_mels=64, hop_length=1024, fmin=30, fmax=11000)
    data = data[:64, :80]
    # Convert to Pytorch
    data = torch.from_numpy(data)
    # Apply final transform
    data = train_loader.dataset.trans_datasets['mel'].transform(data)
    data = data.unsqueeze(0).unsqueeze(0).float()
    return data
model = model.eval()
# Perform an analysis of the dataset
for p in range(4):    
    trans_data = transform_wave(fixed_audio[p].numpy())
    # Check correlation of imshows
    plt.figure()
    plt.subplot(211)
    plt.imshow(fixed_data[p][0])
    plt.subplot(212)
    plt.imshow(trans_data[0][0])
    print('Diffs')
    print(torch.sum(torch.abs(fixed_data[p] - trans_data[0])))
    print('Means')
    print(torch.mean(fixed_data[p][0]))
    print(torch.mean(trans_data[0][0]))
    print(torch.std(fixed_data[p][0]))
    print(torch.std(trans_data[0][0]))
    # Test encoding
    x_tilde, z_tilde, z_loss = model.ae_model(trans_data)
    out = model.regression_model(z_tilde)
    x_tilde, z_tilde, z_loss = model.ae_model(fixed_data[p].unsqueeze(0))
    out_2 = model.regression_model(z_tilde)
    print(torch.sum(torch.abs(fixed_params[p] - out)))
    plt.figure()
    plt.subplot(311)
    plt.bar(np.linspace(0,31,32), fixed_params[p].numpy())
    plt.subplot(312)
    plt.bar(np.linspace(0,31,32), out.detach().numpy()[0])
    plt.subplot(313)
    plt.bar(np.linspace(0,31,32), 1 - out_2.detach().numpy()[0])
    librosa.output.write_wav('/tmp/test_'+str(p)+'.wav', fixed_audio[p].numpy(), sr=22050)

#%%
"""
###################
Load dataset
###################
"""
server = FlowServer(args.in_port, args.out_port, model=model, dataset=audioset, data=args.data, param_names=param_names, param_dict=param_dict)
print('[Running server on ports in : %d - out : %d]'%(args.in_port, args.out_port))
server.run()
