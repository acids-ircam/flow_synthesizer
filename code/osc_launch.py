import argparse
import torch
import json, ast
from osc_server import FlowServer
from utils.data import load_dataset

parser = argparse.ArgumentParser()
parser.add_argument('--in_port',    type=int,   default=1234)
parser.add_argument('--out_port',   type=int,   default=1235)
parser.add_argument('--ip',         type=str,   default="127.0.0.1")
# Model arguments
parser.add_argument('--model',      type=str,   default="results/vae_flow_mel_mse_cnn_flow_kl_f_iaf_2.model")
# Data arguments
parser.add_argument('--path',       type=str,   default='/Users/esling/Datasets/diva_dataset', help='')
parser.add_argument('--dataset',    type=str,   default='32par', help='')
parser.add_argument('--train_type', type=str,   default='fixed', help='')
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
train_loader, valid_loader, test_loader, args = load_dataset(args)
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


"""
###################
Load dataset
###################
"""
server = FlowServer(args.in_port, args.out_port, model=model, dataset=audioset, data=data, param_names=param_names, param_dict=param_dict)
print('[Running server on ports in : %d - out : %d]'%(args.in_port, args.out_port))
server.run()
