import matplotlib 
import os 
import time 
import numpy as np 
import torch
from torch._C import device, get_device
from torch.jit import Error 
import torch.nn as nn   
import torch.optim as optim
from torch.optim import optimizer 

# Internal imports 
from utils.data import load_dataset, get_external_sounds 
from models.vae.ae import AE, RegressionAE, DisentangleAE
from models.vae.vae import VAE 
from models.vae.vae_flow import VAEFLow 
from models.loss import multinomial_loss, multinomial_mse_loss 
from models.basic import GatedMLP, GatedCNN, construct_encoder_decoder, construct_flow, construct_disentangle, construct_regressor 
from evaluate  import (evaluate_model, evaluate_params, evaluate_synthesis,\
            evaluate_projection, evaluate_reconstruction, evaluate_latent_space,\
            evaluate_meta_parameters, evaluate_semantic_parameters,\
            evaluate_latent_neighborhood)



# TODO: Dealing with args
# Search for how to add attributes to dict objects on the fly?


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
    LAYERS = 'vae_flow' 
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
    INPUT_SIZE = 10 # This is the  input size to the encoder its needs to be defined by the user
    OUTPUT_SIZE = 10 # TODO: this value needs to be defined by the user
    OUTPUT = 'outputs' # path to saved models
    PLOT = '' # 
    MODEL_NAME = 'vae_with_flow'



class LossTypes:
    MSE = "mse" 
    L1 = "l1" 
    MULTINOMIAL = "multinomial" 
    MULTINOMIAL_MSE = "multi_mse"

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
    torch.save(model.state_dict(), Constants.MODEL_PATH)

def save_model(model, data, loss, latent_dims):
    model_name = '{0}_{1}_{2}_{3}'.format(model, data, loss, latent_dims)
    model_name += '_' + Constants.FLOW
    if(not (Constants.MODEL in ['mlp', 'gated_mlp', 'cnn', 'gated_cnn', 'res_cnn'])):
        model_name += '_' + Constants.LAYERS
    model_name += '_' + Constants.FLOW
    if(Constants.SEMANTIC_DIM > -1):
        model_name += '_' + str(Constants.SEMANTIC_DIM) + '_' + Constants.DISENTANGLING 
    if(Constants.K_RUN > 0):
        model_name += '_' + str(Constants.K_RUN) 
    base_dir = '{0}'.format(Constants.OUTPUTS) 
    base_img = '{0}/images/{1}'.format(Constants.OUTPUTS, model_name) 
    base_audio = '{0}/audio/{1}'.format(Constants.OUTPUTS, model_name)
    return torch.save(model.state_dict(), Constants.MODEL_PATH + '/' + model_name)

def set_device(device_type="cpu"):
    if device_type == "gpu":
        if torch.cuda.is_available():
            torch.device(device_type)
        else: 
            raise Error("{} device not available valid inputs are [cpu or gpu]".format(device_type))
    else: 
        torch.device("cpu")


    
def get_dataloaders_wrong():
    ref_split = Constants.DATASET_PATH + '/reference_split_' + Constants.DATASET + '.th' 
    data = torch.load(ref_split) 
    train_loader, valid_loader, test_loader = data[0], data[1], data[2] 
    fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(test_loader))
    fixed_data, fixed_params, fixed_meta, fixed_audio = fixed_data.to(Constants.DEVICE), fixed_params.to(Constants.DEVICE), fixed_meta, fixed_audio 
    fixed_batch = (fixed_data, fixed_params, fixed_meta, fixed_audio) 

def get_dataloaders():
    ref_split = Constants.DATASET_PATH + '/reference_split_' + Constants.DATASET + '.th' 
    data = torch.load(ref_split) 
    train_loader, valid_loader, test_loader = data[0], data[1], data[2] 
    return train_loader, valid_loader, test_loader 

def get_fixed_data(): 
    _, _, test_loader = get_dataloaders() 
    fixed_data, fixed_params, fixed_meta, fixed_audio = next(iter(test_loader)) 
    fixed_data, fixed_params = fixed_data.to(Constants.DEVICE), fixed_params.to(Constants.DEVICE)
    fixed_batch = (fixed_data, fixed_params, fixed_meta, fixed_audio)
    return fixed_batch

def get_latent_dims():
    latent_dims = 0 
    train_loader, _, _ = get_dataloaders() 
    if Constants.LATENT_DIMS == 0: 
        latent_dims = train_loader.dataset.ouput_size
    return latent_dims



def get_loss(loss_type=""):
    loss = None 
    if loss_type == "mse":
        loss = nn.MSELoss(reduction="sum").to(Constants.DEVICE) 
    elif loss_type == "l1":
        loss = nn.SmoothL1Loss(reduction="sum").to(Constants.DEVICE) 
    elif loss_type == "multinomial":
        loss = multinomial_loss 
    elif loss_type == "multi_mse":
        loss = multinomial_mse_loss 
    else: 
        raise Exception("Unknown reconstruction loss " + loss_type)
    return loss 

def get_input_and_output_size(error_type=None):
    train_data_loader, _, _ = get_dataloaders()
    input_size = train_data_loader.dataset.input_size 
    output_size = train_data_loader.dataset.output_size
    if error_type in ['multinomial']: 
        output_size *= Constants.N_CLASSES 
    elif error_type in ['multinomial_mse']: 
        output_size *=(Constants.N_CLASSES + 1) 
    return input_size, output_size




def define_vae_with_flow_model():
    latent_dims = get_latent_dims()
    flow = Constants.FLOW 
    flow_length = Constants.FLOW_LENGTH 
    rec_loss = get_loss(loss_type=LossTypes.MSE)
    input_size, output_size = get_input_and_output_size()
    channels = Constants.CHANNELS 
    n_layers = Constants.N_LAYERS
    hidden_size = Constants.N_HIDDEN 
    type_mod = Constants.LAYERS
    encoder_dims = Constants.ENCODER_DIMS
    regressor = Constants.REGRESSOR
    reg_hiddens = Constants.REG_HIDDENS 
    reg_flow = Constants.REG_FLOW 
    reg_layers = Constants.REG_LAYERS
    semantic_dim = Constants.SEMANTIC_DIM
    disentangling = Constants.DISENTANGLING 
    dis_layers = Constants.DIS_LAYERS

    encoder, decoder = construct_encoder_decoder(Constants.INPUT_SIZE, Constants.ENCODER_DIMS,\
        latent_dims, channels = channels, n_layers=n_layers, hidden_size=hidden_size, n_mlp= n_layers//2, type_mod=type_mod)
    flow, blocks = construct_flow(latent_dims, flow_type=flow, flow_length=flow_length, amortization='input') 

    model = VAEFLow(encoder, decoder, input_size, encoder_dims, latent_dims)
    # construct specific regressor
    regression_model = construct_regressor(latent_dims, output_size, model=regressor,\
        hidden_dims=reg_hiddens, n_layers=reg_layers, flow_type=reg_flow)
    if(semantic_dim == -1):
        model = RegressionAE(model, latent_dims, output_size, rec_loss, regressor=regression_model,\
            regressor_name=regressor)
    else:
        # Construct disentangling flow
        disentangling = construct_disentangle(latent_dims, model=disentangling, semantic_dim=semantic_dim,\
            n_layers=dis_layers, flow_type=reg_flow)
        model = DisentangleAE(model, latent_dims, output_size, rec_loss, regressor=regression_model,\
            regressor_name=regressor, disentangling=disentangling, semantic_dim=semantic_dim)
    model = model.to(Constants.DEVICE) 
    return model 

def get_adam_optimizer_and_scheduler(model):
    optimizer = optim.Adam(model.parameters(), lr=Constants.LR)
    scheduler = optim.lr_scheduler.ReduceLROnPlateau(optim, mode='min', factor=0.5, patience=20, verbose=True, threshold=1e-7)
    return optimizer, scheduler


def make_final_evaluation(model, losses, test_loader, args): 
    plot = Constants.PLOT 
    plot = 'final' 
    model_name = Constants.MODEL_NAME
    base_img = None 
    base_dir = None 
    base_audio = None 
    base_model_name = None 
    base_model = Constants.OUTPUT + '/models/' + model_name  
    vocal_sounds = None
    device = set_device(device_type="cpu")
    print('[Reload best performing model]') 
    model = torch.load(Constants.OUTPUT + '/models/' + model_name + '.model') 
    model = model.to(device)
    print('[Performing final evaluation]') 
    # Memory saver 
    with torch.no_grad(): 
        # Perform parameters evaluation 
        evaluate_params(model, test_loader, args, losses=losses)
        # Synthesis engine on (GPU) 
        if(torch.device() == "gpu" and Constants.SYNTHESIZE):
            # Importh synthesis 
            from synth.synthesize import create_synth 
            print('[Synthesis evaluation]') 
            engine, generator, param_defaults, rev_idx = create_synth(Constants.DATASET) 
        # Perform reconstruction evaluation
        evaluate_reconstruction(model, test_loader, args, train=False) 
        # Evaluate latent space 
        args = evaluate_latent_space(model, test_loader, args, train=False)
        # Perform meta-parameter analysis 
        evaluate_meta_parameters(model, test_loader, args, train=False) 
        # Perform latent neighborhood analysis
        evaluate_latent_neighborhood(model, test_loader, args, train=False)

        if (Constants.SYNTHESIZE): 
            # Evaluate synthetizer output 
            evaluate_synthesis(model, test_loader, args, train=False) 
            print('[Load set of testing sound (outside Diva)]') 
            test_sounds = get_external_sounds(vocal_sounds, test_loader.dataset, args)
            # Evaluate projection 
            evaluate_projection(model, test_sounds, args, train=False, type_val='vocal')




def train_model(with_final_evaluation=False):
    epochs = Constants.EPOCHS
    losses = torch.zeros(epochs, 3) 
    beta_factor = Constants.BETA_FACTOR
    beta = 0 
    warm_latent = Constants.WARM_LATENT
    gamma = 0
    reg_factor = Constants.REG_FACTOR
    warm_regress = Constants.WARM_REGRESS
    start_regress = Constants.START_REGRESS
    delta = 0 
    start_disentangle = Constants.START_DISENTANGLE
    warm_disentangle = Constants.WARM_DISENTANGLE
    early_stop = Constants.EARLY_STOP
    regressor = Constants.REGRESSOR
    plot_interval = Constants.PLOT_INTERVAL
    plot = Constants.PLOT
    fixed_batch = get_fixed_data()
    model = define_vae_with_flow_model()
    model_name = 'vae_with_flow'
    base_dir = '{0}'.format(Constants.OUTPUTS) 
    base_img = '{0}/images/{1}'.format(Constants.OUTPUTS, model_name) 
    base_audio = '{0}/audio/{1}'.format(Constants.OUTPUTS, model_name)
    train_loader, valid_loader, test_loader = get_dataloaders()
    loss = get_loss(loss_type=LossTypes.MSE)
    adam_optimizer, scheduler = get_adam_optimizer_and_scheduler(model)
    if(epochs == 0):
        losses = torch.zeros(200, 3) 
    best_loss = np.inf 
    print('[Starting Training]') 
    for i in range(epochs):
        if(start_regress == 0):
            from pympler import muppy, summary 
            all_objects = muppy.get_objects() 
            sum1 = summary.summarize(all_objects) 
            # Prints out a summary of the large objects 
            print('******* Summary at the beginning of epoch *******')
            summary.print_(sum1) 
        # set warm-up values 
        beta = beta_factor * (float(i) / float(max(warm_latent, i)))
        if( i >= start_regress):
            gamma = ((float(i - start_regress) * reg_factor) / float(max(warm_regress, i - start_regress)))
            if(regressor != 'mlp'):
                gamma *= 1e-1
        else: 
            gamma = 0 
        if(i >= start_disentangle):
            delta = ((float(i - start_disentangle)) / float(max(warm_disentangle, i - start_disentangle)))
        else: 
            delta = 0 
        print('%.3f - % .3f' % (beta, gamma))
        # Perform one epoch of train 
        losses[i, 0] = model.train_epoch(train_loader, loss, adam_optimizer, args)
        # Perform validation 
        losses[i, 1] = model.eval_epoch(valid_loader, loss, optimizer, args)
        # Learning rate scheduling
        if( i>= start_regress):
            scheduler.step(losses[i, 1]) 
        # Perform test evaluation 
        losses[i, 2] = model.eval_epoch(test_loader, loss, args) 
        if (start_regress == 1000): 
            losses[i, 1] = losses[i, 0] 
            losses[i, 2] = losses[i, 0]
        # Model saving 
        if(losses[i, 1] < best_loss): 
            # Save model 
            best_loss = losses[i, 1] 
            torch.save(model, Constants.OUTPUTS + '/models/' + model_name + '.model')
            early = 0 
        # Check for early stopping 
        elif(early_stop > 0 and i > start_regress): 
            early += 1 
            if(early > early_stop):
                print('[Model stopped early]') 
                break  
        # Periodic evaluation (or debug model) 
        if((i + 1) % plot_interval == 0 or (epochs == 1)):
            plot = 'train' 
            with torch.no_grad(): 
                model.eval() 
                evaluate_model(model, fixed_batch, test_loader, args, train=True, name=base_img + '_batch_' + str(i))
        print('Epoch ' + str(i)) 
        print(losses[i]) 
        torch.cuda.empty_cache()
        if(with_final_evaluation):
            make_final_evaluation()

        
    



def training_checklist():
    set_device(device_type="cpu") 
    make_checkpoint_dirs()




