import argparse, os
import matplotlib
matplotlib.use('Agg')
import torch
from evaluate import evaluate_synthesis, evaluate_projection
import numpy as np
from synth.synthesize import create_synth
from utils.data import get_external_sounds
parser = argparse.ArgumentParser()

parser.add_argument('--model_path',    type=str,   default="/fast-1/philippe/flow_results_final/32par/models/vae_flow_mel_mse_cnn_mlp_iaf_1.model", help='')
parser.add_argument('--real_output',    type=str,   default="/fast-1/naotake", help='')
parser.add_argument('--batch_evals',    type=int,   default=16, help='')

parser.add_argument('--epochs',         type=int,   default=200, help='')
parser.add_argument('--device',         type=str,   default='cpu', help='Device for CUDA')
parser.add_argument('--project',  action="store_true", help='')

parser.add_argument('--dataset',        type=str,   default='32par', help='')
parser.add_argument('--n_classes',      type=int,   default=32, help='')
parser.add_argument('--batch_out',      type=int,   default=3, help='')
parser.add_argument('--test_sounds',    type=str,   default='/fast-2/datasets/flow_synth_test', help='')
parser.add_argument('--nbworkers',      type=int,   default=0,              help='')
args = parser.parse_args()


args.output = os.path.split(args.model_path)[0] #.../models
args.output = os.path.split(args.output)[0]

args.synthesize=True
model_name = os.path.splitext(os.path.basename(args.model_path))[0]
print
args.base_model = args.real_output + '/models/' + model_name
model_pars = model_name.split("_")
if model_pars[0]+model_pars[1] in ["vaeflow", "gatedcnn", "gatedmlp", "rescnn"]:
    args.model = model_pars[0] + "_" + model_pars[1]
    idx = 2
else:
    args.model = model_pars[0]
    idx = 1
if model_pars[idx+1] == "mfcc": #mel_mfcc
    args.data="mel_mfcc"
    idx += 1
else:
    args.data = model_pars[idx]
args.loss = model_pars[idx+1]

base_img = '{0}/images/{1}_re'.format(args.real_output, model_name)
base_audio = '{0}/audio/{1}_re'.format(args.real_output, model_name)

args.cuda = not args.device == 'cpu' and torch.cuda.is_available()
args.device = torch.device(args.device if torch.cuda.is_available() else 'cpu')

args.model_name, args.base_img, args.base_audio = model_name, base_img, base_audio

ref_split = '/fast-2/datasets/diva_dataset' + '/reference_split_' + args.dataset+ "_" +args.data + '.npz'
data = np.load(ref_split)['arr_0']
train_loader, valid_loader, test_loader = data[0], data[1], data[2]
args.batch_size = test_loader.batch_size
args.output_size = train_loader.dataset.output_size
args.input_size = train_loader.dataset.input_size
model = torch.load(args.model_path, map_location=args.device)
model.to(args.device)
args.engine, args.generator, args.param_defaults, args.rev_idx = create_synth(args.dataset)
if not args.project:
    evaluate_synthesis(model, test_loader, args, train=False)
else:
    test_sounds = get_external_sounds(args.test_sounds, test_loader.dataset, args)
    evaluate_projection(model, test_sounds, args, train=False)
