import asyncio
from pythonosc import udp_client
from pythonosc import dispatcher
from pythonosc import osc_server
from models.vae.ae import RegressionAE
import torch, numpy as np
import librosa
import os

# Helper function to parse attribute
def osc_attr(obj, attribute):
    def closure(*args):
        args = args[1:]
        if len(args) == 0:
            return getattr(obj, attribute)
        else:
            return setattr(obj, attribute, *args)
    return closure

class OSCServer(object):
    '''
    Key class for OSCServers linking Python and Max / MSP

    Example :
    >>> server = OSCServer(1234, 1235) # Creating server
    >>> server.run() # Running server

    '''
    # attributes automatically bounded to OSC ports
    osc_attributes = []
    # Initialization method
    def __init__(self, in_port, out_port, ip='127.0.0.1', *args):
        super(OSCServer, self).__init__()
        # OSC library objects
        self.dispatcher = dispatcher.Dispatcher()
        self.client = udp_client.SimpleUDPClient(ip, out_port)
        # Bindings for server
        self.init_bindings(self.osc_attributes)
        self.server = osc_server.BlockingOSCUDPServer((ip, in_port), self.dispatcher)
        # Server properties
        self.debug = False
        self.in_port = in_port
        self.out_port = out_port
        self.ip = ip

    def init_bindings(self, osc_attributes=[]):
        '''Here we define every OSC callbacks'''
        self.dispatcher.map("/ping", self.ping)
        self.dispatcher.map("/stop", self.stopServer)
        for attribute in osc_attributes:
            print(attribute)
            self.dispatcher.map("/%s"%attribute, osc_attr(self, attribute))

    def stopServer(self, *args):
        '''stops the server'''
        self.client.send_message("/terminated", "bang")
        self.server.shutdown()
        self.server.socket.close()

    def run(self):
        '''runs the SoMax server'''
        self.server.serve_forever()
        
    def ping(self, *args):
        '''just to test the server'''
        print("ping", args)
        self.client.send_message("/from_server", "pong")
        
    def send(self, address, content):
        '''global method to send a message'''
        if (self.debug):
            print('Sending following message')
            print(address)
            print(content)
        self.client.send_message(address, content)

    def print(self, *args):
        print(*args)
        self.send('/print', *args)

# OSC decorator
def osc_parse(func):
    '''decorates a python function to automatically transform args and kwargs coming from Max'''
    def func_embedding(address, *args):
        t_args = tuple(); kwargs = {}
        for a in args:
            if issubclass(type(a), str):
                if "=" in a:
                    key, value = a.split("=")
                    kwargs[key] = value
                else:
                    t_args = t_args + (a,)
            else:
                t_args = t_args + (a,)
        return func(*t_args, **kwargs)
    return func_embedding


def max_format(v):
    '''Format some Python native types for Max'''
    if issubclass(type(v), (list, tuple)):
        if len(v) == 0:
            return ' "" '
        return ''.join(['%s '%(i) for i in v])
    else:
        return v

def dict2str(dic):
    '''Convert a python dict to a Max message filling a dict object'''
    str = ''
    for k, v in dic.items():
        str += ', set %s %s'%(k, max_format(v))
    return str[2:]

def extract_max(pitches, magnitudes, shape):
    """ Extract maximum magnitude for pitch extraction """
    new_pitches = []
    for i in range(0, shape[1]):
        index = magnitudes[:, i].argmax()
        new_pitches.append(pitches[index,i])
    return new_pitches

def freq2midi(freq):
    """ Given a frequency in Hz, returns its MIDI pitch number. """
    MIDI_A4 = 69   # MIDI Pitch number
    FREQ_A4 = 440. # Hz
    return int(12 * (np.log2(freq) - np.log2(FREQ_A4)) + MIDI_A4)

def smooth(x, window_len=5, window='hanning'):
    if window_len < 3:
        return x
    s = np.r_[2*x[0]-x[window_len-1::-1],x,2*x[-1]-x[-1:-window_len:-1]]
    w = eval('np.'+window+'(window_len)')
    y = np.convolve(w/w.sum(),s,mode='same')
    return y[window_len:-window_len+1]

class FlowServer(OSCServer):
    '''
    Key class for the Flow synthesizer server.

    Example :
    >>> server = FlowServer(1234, 1235) # Creating server
    >>> server.run() # Running server

    '''
    osc_attributes = ['model', 'projection']
    # Set of descriptors available
    descriptors = ['loudness', 'centroid', 'bandwidth', 'flatness', 'rolloff']
    min_threshold = 0

    def __init__(self, *args, **kwargs):
        self._model = kwargs.get('model')
        self._modelpath = ""
        # Command-line arguments
        self.args = kwargs.get('args')
        # Data parameters
        self.data = kwargs.get('data')
        self.dataset = kwargs.get('dataset')
        self.param_names = kwargs.get('param_names')
        self.param_dict = kwargs.get('param_dict')
        self.analysis = kwargs.get('analysis')
        self.pca = self.analysis['pca']
        print(self.pca)
        # Options flags
        self.freeze_mode = False
        self.pitch_shift = True
        self.pitch_octave = False
        self.prev_z = None
        # Latent paths variables
        self.free_path = []
        self.preset_path_hashes = []
        self.preset_path_use_z = True
        self.preset_path = []
        # Init OSC server
        super(FlowServer, self).__init__(*args)
        self.debug = kwargs.get('debug')
        print('Sending base info.')
        self.get_state()
        self.send_params_nb()
        self.send_ref_params()
        self.send_model_params()
        self.print('Server is ready.')

    def init_bindings(self, osc_attributes=[]):
        """ Set of OSC messages handled """
        super(FlowServer, self).init_bindings(self.osc_attributes)
        # Send basic variables
        self.dispatcher.map('/get_state', osc_parse(self.get_state))
        self.dispatcher.map('/resend_state', osc_parse(self.resend_state))
        self.dispatcher.map('/model_params', osc_parse(self.send_model_params))
        # Change option flags
        self.dispatcher.map('/set_freeze_mode', osc_parse(self.set_freeze_mode))
        self.dispatcher.map('/set_pitch_shift', osc_parse(self.set_pitch_shift))
        self.dispatcher.map('/set_pitch_octave', osc_parse(self.set_pitch_octave))
        self.dispatcher.map('/set_path_use_z', osc_parse(self.set_path_use_z))
        # Changing model and dataset
        self.dispatcher.map('/set_model', osc_parse(self.set_model))
        self.dispatcher.map('/set_dataset', osc_parse(self.set_dataset))
        # Retrieve pre-analyzed properties
        self.dispatcher.map('/preset_space', osc_parse(self.preset_space))
        self.dispatcher.map('/dimension_analysis', osc_parse(self.dimension_analysis))
        # Latent path operations
        self.dispatcher.map('/clear_path', osc_parse(self.clear_path))
        self.dispatcher.map('/add_free_path', osc_parse(self.add_free_path))
        self.dispatcher.map('/add_preset_path', osc_parse(self.add_preset_path))
        self.dispatcher.map('/play_path', osc_parse(self.play_path))
        # Core functionalities (load, decode, encode)
        self.dispatcher.map('/load_preset', osc_parse(self.load_preset))
        self.dispatcher.map('/decode', osc_parse(self.decode))
        self.dispatcher.map('/encode', osc_parse(self.encode))
    
    """
    ###################
    Basic variables and states
    ###################
    """
        
    def resend_state(self):
        """ Sending all basic variables and state """
        print('Sending base info.')
        self.get_state()
        self.send_params_nb()
        self.send_ref_params()
        self.send_model_params()
        self.print('Server is ready.')
        
    def send_ref_params(self):
        """ Send the values of reference preset """
        out_list = []
        # Create dict out of params
        for k, v in self.param_dict.items():
            out_list.append(k)
            out_list.append(float(v))
        # Handle variables
        self.send('/params', out_list)
        
    def send_model_params(self):
        """ Send names of parameters on which the model acts """
        out_list = []
        # Create dict out of params
        for k in self.param_names:
            out_list.append(k)
        # Handle variables
        self.send('/model_params', out_list)
        
    def send_params_nb(self):
        """ Send number of parameters on which the model acts """
        # Infer number of parameters
        n_params = len(self.param_names)
        # Handle variables
        self.send('/params_nb', n_params)
    
    # Return current model state
    def get_state(self):
        """ Send set of properties of the current model """
        if self._model is not None:
            latent_dims = self._model.latent_dims
            regression_dims = self._model.regression_dims
        else:
            latent_dims = self._model.latent_dims
            regression_dims = self._model.regression_dims
        state = {'latent_dims': latent_dims,
                 'regression_dims': regression_dims}
        state_str = dict2str(state)
        self.send('/state', state_str)
        self.print('Server is ready.')
        return state
    
    """
    ###################
    Option flags
    ###################
    """

    def set_freeze_mode(self, v):
        """ Defines the latent freeze mode """
        if (v == 1):
            self.freeze_mode = True
        else:
            self.freeze_mode = False
            self.prev_z = None

    def set_pitch_octave(self, v):
        """ Defines the use of octave-equivalent pitch detect in encode """
        if (v == 1):
            self.pitch_octave = True
        else:
            self.pitch_octave = False
            self.send('/target_pitch', 60)

    def set_pitch_shift(self, v):
        """ Defines the use of pitch detection and shifting in encode """
        if (v == 1):
            self.pitch_shift = True
        else:
            self.pitch_shift = False
            self.send('/target_pitch', 60)

    def set_path_use_z(self, v):
        """ Defines the interpolation of path as Z space or preset space """
        if (v == 1):
            self.preset_path_use_z = True
        else:
            self.preset_path_use_z = False
    
    """
    ###################
    Model and dataset loading
    ###################
    """
        
    # model attributes
    def getmodel(self):
        return self._model
    
    def delmodel(self): 
        del self._model
    
    def setmodel(self, *args):
        """ Load model from a given file path """
        if len(args) == 1:
            if type(args[0]) == str:
                self.print('loading model %s...'%args[0])
                self._model = torch.load(args[0], map_location='cpu')
        elif issubclass(type(args[0]), RegressionAE):
            self._model = args[0]
        self.print('model loaded')
        self.get_state()
    
    def set_model(self, model, data, beta):
        """ Set the model from a pre-defined list in the interface """
        if (model == 'flow'):
            m_name = 'vae_flow'
            regress = 'flow_kl_f_iaf'
        elif (model == 'vae'):
            m_name = 'vae_flow'
            regress = 'mlp_iaf'
        else:
            m_name = 'wae'
            regress = 'mlp'
        m_path = 'results/' + m_name + '_' + data + '_mse_cnn_' + regress + '_' + str(beta) + '.model'
        self.args.model_path = m_path
        self.print('Loading model.')
        self._model = torch.load(m_path, map_location='cpu')
        self.get_state()
    
    def set_dataset(self, model, data, params):
        """ Set the dataset from a pre-defined list """
        dataset = str(params) + 'par'
        self.print('Loading dataset.')
        self.args.dataset = dataset
        self.args.data = data
        ref_split = self.args.path + '/reference_split_' + dataset + "_" + data + '.npz'
        data = np.load(ref_split)['arr_0']
        train_loader, valid_loader, test_loader = data[0], data[1], data[2]
        self.dataset = [train_loader, valid_loader, test_loader]
        m_path = self.args.model_path + self.args.dataset + '/' + self.args.model_name
        self._model = torch.load(m_path, map_location='cpu')
        self.send_params_nb()
        self.get_state()

    model = property(getmodel, setmodel, delmodel, "vae model attached to server")
    
    """
    ###################
    Retrieve pre-analyzed properties
    ###################
    """
        
    def dimension_analysis(self, idx, n_dims):
        """ Retrieve the analysis of dimensions (params and descriptors evolution) """
        real_d = self.analysis['d_idx'][idx]
        cur_params = self.analysis['d_params'][real_d]
        for p in range(n_dims):
            out_list = []
            out_list.append('parameter')
            real_p = int(self.analysis['d_vars'][real_d, p])
            out_list.append(self.param_names[real_p])
            for c in range(cur_params.shape[1]):
                out_list.append(cur_params[real_p, c])
            # Handle variables
            self.send('/dimension_analysis', out_list)
        for d in range(len(self.descriptors)):
            out_list = []
            out_list.append('descriptor')
            out_list.append(self.descriptors[d])
            cur_desc = self.analysis['d_desc'][real_d, d]
            for c in range(len(cur_desc)):
                out_list.append(float(cur_desc[c]))
            # Handle variables
            self.send('/dimension_analysis', out_list)

    def preset_space(self, val):
        """ Retrieve the pre-computed latent space of presets """
        # Take re-ordered dimensions
        space_dir = os.getcwd() + '/' + self.analysis['dataset_path']
        self.send('/presets', space_dir)
    
    """
    ###################
    Latent path operations section
    ###################
    """
    
    def clear_path(self):
        """ Empty all pathes variables """
        print('Clearing paths.')
        self.free_path = []
        self.preset_path_hashes = []
        self.preset_path = []
        self.print('Server is ready.')
        
    def add_free_path(self, x, y, d1, d2):
        """ Add a point inside a free path """
        # Create vector for latent point
        z_point = torch.zeros(self._model.latent_dims)
        if (self.freeze_mode and (self.prev_z is not None)):
            z_point[:] = self.prev_z[0, :]
        z_point[self.analysis['d_idx'][d1]] = x
        z_point[self.analysis['d_idx'][d2]] = y
        self.free_path.append(z_point)
        
    def add_preset_path(self, hash_v):
        """ Add a point inside a preset path """
        # Retrieve correct index
        l_idx = self.analysis['hash_loaders'][hash_v]
        cur_z = self.analysis['final_z'][l_idx[2]]
        self.preset_path_hashes.append(hash_v)
        # Interpolate in audio space
        if (self.preset_path_use_z):
            self.preset_path.append(cur_z)
        # Interpolate in preset space
        else:
            cur_file = self.dataset[l_idx[0]].dataset.data_files[l_idx[1]]
            loaded = np.load(cur_file)
            params = loaded['param'].item()
            params = torch.Tensor([params[p] for p in self.param_names])
            self.preset_path.append(params)
    
    def play_path(self, cur_p):
        print('Path at ratio : %f'%(cur_p))
        """ Retrieve parameters on the path at a given ratio (between 0 and 1) """
        if ((len(self.preset_path) == 0) and (len(self.free_path) == 0)):
            return
        if (len(self.preset_path) > 0):
            cur_path = self.preset_path
        if (len(self.free_path) > 0):
            cur_path = self.free_path
        # First infer positions
        val = cur_p * float(len(cur_path) - 1)
        val_inf = int(np.floor(val))
        val_sup = val_inf + 1
        if (val_sup >= len(cur_path)):
            val_sup = val_inf
        # Then evaluate position in range
        cur_ratio = val - float(val_inf)
        print('Values used : %d - %d (%d) - %f'%(val_inf, val_sup, len(cur_path), cur_ratio))
        z_start = cur_path[val_inf]
        z_end = cur_path[val_sup]
        cur_z = ((1. - cur_ratio) * z_start + cur_ratio * z_end).unsqueeze(0)
        # Perform regression on params
        if (len(self.preset_path) > 0 and (not self.preset_path_use_z)):
            out = cur_z
        else:
            if (self.pca is not None):
                ipca_z = torch.Tensor(self.pca.inverse_transform(cur_z))
                out = self._model.regression_model(ipca_z)  
            else:
                out = self._model.regression_model(cur_z)  
        out_list = []
        # Create dict out of params
        for p in range(out.shape[1]):
            out_list.append(self.param_names[p])
            out_list.append(float(out[0, p]))
        # Handle variables
        self.send('/params', out_list)
        # Resend full z position
        out_list = []
        # Create dict out of params
        for p in range(cur_z.shape[1]):
            out_list.append('x%d'%(p))
            out_list.append(float(cur_z[0][self.analysis['d_idx'][p]]))
        # Handle variables
        self.send('/z_pos', out_list)
    
    """
    ###################
    Core functionalities (load, encode, decode)
    ###################
    """
            
    def load_preset(self, hash_v):
        """ Load a given preset based on its hash string """
        # Retrieve correct index
        l_idx = self.analysis['hash_loaders'][hash_v]
        cur_file = self.dataset[l_idx[0]].dataset.data_files[l_idx[1]]
        loaded = np.load(cur_file)
        params = loaded['param'].item()
        params = torch.Tensor([params[p] for p in self.param_names])
        out_list = []
        # Create dict out of params
        for p in range(params.shape[0]):
            out_list.append(self.param_names[p])
            out_list.append(float(params[p]))
        # Handle variables
        self.send('/params', out_list)
        cur_z = self.analysis['final_z'][l_idx[2]]
        if (self.freeze_mode):
            self.prev_z = torch.Tensor(1, cur_z.shape[0])
            self.prev_z[0] = cur_z
            print(self.prev_z[0])
        # Resend full z position
        out_list = []
        # Create dict out of params
        for p in range(cur_z.shape[0]):
            out_list.append('x%d'%(p))
            out_list.append(float(cur_z[self.analysis['d_idx'][p]]))
        # Handle variables
        self.send('/z_pos', out_list)

    def transform_wave(self, wave):
        """ Helper function for encoding to compute spectral transform """
        data = None
        if (self.data == 'mel'):
            data = librosa.feature.melspectrogram(wave, sr=22050, n_fft=2048, n_mels=64, hop_length=1024, fmin=30, fmax=11000)
            data = data[:64, :80]
        if (self.data == 'mfcc'):
            data = librosa.feature.mfcc(wave, sr=22050, n_mfcc=16, hop_length=256)
            data = data[:16, :320]
            data = data.reshape(64,80)
        # Convert to Pytorch
        data = torch.from_numpy(data)
        # Apply final transform
        data = torch.log(data + 1e-3)
        data = (data - self.dataset[0].dataset.means["mel"]) / self.dataset[0].dataset.vars["mel"]
        data = data.unsqueeze(0).unsqueeze(0).float()
        return data

    def encode(self, path):
        """ Encode a given wavefile to infer the synth parameters """
        path = path.replace('Macintosh HD:', '')
        # Retrieve file to encode
        wave, _ = librosa.core.load(path, sr=22050)
        # Perform pitch tracking
        if (self.pitch_shift):
            # Track pitch
            pitches, magnitudes = librosa.core.piptrack(y=wave, sr=22050, S=None)
            # Window and smooth pitches
            pitches = extract_max(pitches, magnitudes, pitches.shape)
            pitches = smooth(pitches)
            # Transform to MIDI and filter out
            final_pitches = np.array([np.round(librosa.core.hz_to_midi(p)) for p in pitches])
            final_pitches = final_pitches[final_pitches > 0]
            final_pitches = [int(p) for p in final_pitches]
            # Select final pitch
            pitch = max(final_pitches,key=final_pitches.count)
            # Compute number of steps to C4
            n_steps = 60 - pitch
            if (self.pitch_octave):
                n_steps = (np.sign(n_steps) * (np.abs(n_steps) % 12))
            # Perform pitch analysis / shift
            if (n_steps != 0):
                wave = librosa.effects.pitch_shift(wave, 22050, n_steps=n_steps)
            self.send('/target_pitch', int(pitch))
        # Eventual padding
        if (wave.shape[0] < 4 * 22050):
            final_wave = np.zeros(4 * 22050)
            final_wave[:wave.shape[0]] = wave
            wave = final_wave
        elif (wave.shape[0] > 4 * 22050):
            wave = wave[:(4 * 22050)]
        # Perform data transform
        data = self.transform_wave(wave)
        # Auto-encode
        x_tilde, z_tilde, z_loss = self._model.ae_model(data)
        # Perform regression on params
        out = self._model.regression_model(z_tilde)
        out_list = []
        # Create dict out of params
        for p in range(out.shape[1]):
            out_list.append(self.param_names[p])
            out_list.append(float(out[0, p]))
        # Eventually project to PCA space
        if (self.pca is not None):
            z_tilde = torch.Tensor(self.pca.transform(z_tilde.detach()))
        # Handle variables
        self.send('/params', out_list)
        if (self.freeze_mode):
            self.prev_z = torch.Tensor(1, z_tilde.shape[1])
            self.prev_z[0] = z_tilde[0]
        out_list = []
        # Create dict out of params
        for p in range(z_tilde.shape[0]):
            out_list.append('x%d'%(p))
            out_list.append(float(z_tilde[0][self.analysis['d_idx'][p]]))
        # Handle variables
        self.send('/z_pos', out_list)

    def decode(self, x, y, d1, d2):
        """ Decode a given point in audio z space to obtain the synth parameters """
        print('Decoding point at d%d:%f - d%d:%f'%(d1, x, d2, y))
        # Create vector for latent point
        z_point = torch.zeros(1, self._model.latent_dims)
        if (self.freeze_mode and (self.prev_z is not None)):
            z_point = self.prev_z
            print('Reusing point:')
            print(z_point)
        z_point[0, self.analysis['d_idx'][d1]] = x
        z_point[0, self.analysis['d_idx'][d2]] = y
        # Perform regression on params
        if (self.pca is not None):
            ipca_z = torch.Tensor(self.pca.inverse_transform(z_point))
            out = self._model.regression_model(ipca_z)
        else:
            out = self._model.regression_model(z_point)  
        out_list = []
        # Create dict out of params
        for p in range(out.shape[1]):
            out_list.append(self.param_names[p])
            out_list.append(float(out[0, p]))
        # Handle variables
        self.send('/params', out_list)
        if (self.freeze_mode):
            self.prev_z = z_point




