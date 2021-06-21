import matplotlib 
import os 
import time 
import numpy as np 
import torch 
import torch.nn as nn   
import torch.optim as optim 

# Internal imports 
from utils.data import load_dataset, get_external_sounds 
from models.vae.vae import VAE 
from models.vae.vae_flow import VAEFLow 
from models.loss import multinomial_loss, multinomial_mse_loss 
from models.basic import GatedMLP, GatedCNN, construct_encoder_decoder, construct_flow, construct_disentangle, construct_regressor 
from evaluate  import evaluate_model  


class Constants: 
    DATASET_PATH = '' 
    TEST_SOUNDS_PATH = '' 
    OUTPUTS = 'outputs' 
    DATASET = '32par' 
    DATA_TYPE = 'mel' 
    TRAIN_TYPE = 'fixed' 
    N_WORKERS = 0 
    MODEL = 'vae' 
    LOSS = 'mse' 
    REC_LOSS = 'mse' 
    N_CLASSES = 61 
    N_HIDDEN = 1024 
    N_LAYERS = 4 
    CHANNELS = 64 
    KERNEL = 5 
    DILATION = 3 
    LAYERS = 'gated_cnn' 
    ENCODER_DIMS = 64 
    LATENT_DIMS = 0 
    WARM_LATENT = 50 
    START_REGRESS = 100 
    WARM_REGRESS = 100 
    BETA_FACTOR = 1 
    REF_MODEL = '' 
    FLOW = 'iaf' # Type of flow to use 
    FLOW_LENGTH = 16 # Number of flow transforms 
    REGRESSOR = 'mlp' # Type of regressor
    REG_LAYERS = 3  # Number of regression layers
    REG_HIDDENS = 256 # Number of units in regressor
    REG_FLOW = "maf" # Type of flow in regressor 
    REG_FACTOR = 1e3 # Regression loss weight 
    K_RUN = 0 # ID of Runs (k-folds) 
    EARLY_STOP = 60 # Early stopping 
    PLOT_INTERVAL = 100 # Interval of plotting frequency 
    BATCH_SIZE = 64 
    EPOCHS = 200 
    EVAL = 100 # frequency of full evaluation 
    LR = 2e-4 # The learning rate
    SEMANTIC_DIM = -1 # Using semantic dimension 
    DIS_LAYERS = 8 # Number of disentangling layers 
    DISENTANGLING = "density" # Disentangling approach 
    START_DISENTANGLE = 100 # Epoch to start disentangling 
    WARM_DISENTANGLE = 25 # Warmup disentanglement 
    BATCH_EVALS = 16 # Number of batch to evaluate 
    BATCH_OUT = 3 # Number of batch to synthesize) 
    TIME_LIMIT = 0 # Maximum time to train in minutes 
    DEVICE = 'cpu' # Device (GPU Or CPU)
    SYNTHESIZE = False 
    VOCAL_SOUNDS_PATH = ''
    MODEL_PATH = '/models'


def check_parameters():
    if(len(Constants.DATASET_PATH) == 0):
        Constants.DATASET_PATH = (Constants.DEVICE == 'cpu') and '/Datasets/diva_dataset' or '/fast-2/datasets/diva_dataset/' 
        Constants.TEST_SOUNDS_PATH = (Constants.DEVICE == 'cpu') and '/Datasets/synth_testing' or '/fast-2/datasets/flow_synthesizer/synth_testing'
        Constants.VOCAL_SOUNDS_PATH = '/fast-2/datasets/flow_synthesizer/vocal_testing' 
    if(Constants.DEVICE not in ['cpu']): 
        Constants.SYNTHESIZE = True 
    if(Constants.DEVICE != 'cpu'):
        torch.backends.cudnn.benchmark = True 

# Results and checkpoint folders
def make_checkpoint_dirs(): 
    if not os.path.exists('{0}'.fomat(Constants.OUTPUTS)):
        os.makedirs('{0}'.format(Constants.OUTPUTS)) 
        os.makedirs('{0}/audio'.format(Constants.OUTPUTS)) 
        os.makedirs('{0}/images'.format(Constants.OUTPUTS)) 
        os.makedirs('{0}/models'.format(Constants.OUTPUTS))

def save_model_1(model):
    model = torch.save(model.state_dict(), Constants.MODEL_PATH)

def save_model(model, data, loss, latent_dims):
    model_name = '{0}_{1}_{2}_{3}'.format(model, data, loss, latent_dims)
    model_name += '_' + Constants.FLOW

def train_model():
    pass 

def evaluate_model(model): 
    pass 

