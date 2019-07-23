import asyncio
from pythonosc import udp_client
from pythonosc import dispatcher
from pythonosc import osc_server
from models.vae.ae import RegressionAE
import torch, numpy as np
import librosa

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
        
        self.init_bindings(self.osc_attributes)
        self.server = osc_server.BlockingOSCUDPServer((ip, in_port), self.dispatcher)
        
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

class FlowServer(OSCServer):
    '''
    Key class for the Flow synthesizer server.

    Example :
    >>> server = OSCServer(1234, 1235) # Creating server
    >>> server.run() # Running server

    '''
    osc_attributes = ['model', 'projection']
    min_threshold = 0

    def __init__(self, *args, **kwargs):
        self._model = kwargs.get('model')
        self._modelpath = ""
        self._projections = {}
        self.current_projection = None
        self.dataset = kwargs.get('dataset')
        self.param_names = kwargs.get('param_names')
        self.param_dict = kwargs.get('param_dict')
        self.data = kwargs.get('data')
        super(FlowServer, self).__init__(*args)
        self.get_state()
        self.send_ref_params()

    def init_bindings(self, osc_attributes=[]):
        super(FlowServer, self).init_bindings(self.osc_attributes)
        self.dispatcher.map('/set_model', osc_parse(self.set_model))
        self.dispatcher.map('/decode', osc_parse(self.decode))
        self.dispatcher.map('/get_spectrogram', osc_parse(self.get_spectrogram))
        self.dispatcher.map('/add_projection', osc_parse(self.add_projection))
        self.dispatcher.map('/save_projections', osc_parse(self.save_projections))
        self.dispatcher.map('/load_projections', osc_parse(self.load_projections))
        self.dispatcher.map('/get_projections', osc_parse(self.get_projections))
        self.dispatcher.map('/get_state', osc_parse(self.get_state))
        
    def send_ref_params(self):
        out_list = []
        # Create dict out of params
        for k, v in self.param_dict.items():
            out_list.append(k)
            out_list.append(float(v))
        # Handle variables
        self.send('/params', out_list)
        
    # model attributes
    def getmodel(self):
        return self._model
    
    def delmodel(self): 
        del self._model
    
    def setmodel(self, *args):
       if len(args) == 1:
           if type(args[0]) == str:
               self.print('loading model %s...'%args[0])
               self._model = torch.load(args[0], map_location='cpu')
       elif issubclass(type(args[0]), RegressionAE):
           self._model = args[0]
       self.print('model loaded')
       self.get_state()
    
    def set_model(self, model, data, beta):
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
        self.print('loading model %s...'%m_path)
        self._model = torch.load(m_path, map_location='cpu')
        self.get_state()

    model = property(getmodel, setmodel, delmodel, "vae model attached to server")

    # projection attributes
    def getprojection(self):
        return self._projections.get(self.current_projection)
    
    def delprojection(self):
        if self.current_projection is None:
            raise Exception('[error] tried to delete current projection but is actually empty')
        del self._projections[self.current_projection]
        self.current_projection = None
    
    def setprojection(self, *args):
        if args[0] == "none":
            self.current_projection = None
            return
        assert type(args[0]) == str and args[0] in self._projections.keys(), "projection %s not found"%args[0]
        self.current_projection = args[0]
        self.print('projection set to %s'%self.current_projection)
        self.get_state()

    projection = property(getprojection, setprojection, delprojection)

    # Return current model state
    def get_state(self):
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
        return state

    def transform_wave(self, wave):
        data = None
        if (self.data == 'mel'):
            data = librosa.feature.melspectrogram(wave, sr=22050, n_fft=2048, n_mels=64, hop_length=1024, fmin=30, fmax=11000)
            data = data[:64, :80]
        if (self.data == 'mfcc'):
            data = librosa.feature.mfcc(wave, sr=22050, n_mfcc=16, hop_length=256)
            data = data[:16, :320]
            data = data.reshape(64,80)
        # Apply final transform
        self.dataset.transform(data)
        return data

    def encode(self, path):
        # Retrieve file to encode
        wave, _ = librosa.core.load(path, sr=22050)
        # Perform data transform
        data = self.transform_wave(wave)
        # Auto-encode
        x_tilde, z_tilde, z_loss = self._model.ae_model(data)
        #if (args.semantic_dim > -1):
        #    z_tilde, _ = self._model.disentangling(z_tilde)
        # Perform regression on params
        out = self._model.regression_model(z_tilde)
        out_list = []
        # Create dict out of params
        for p in range(out.shape[1]):
            out_list.append(self.param_names[p])
            out_list.append(float(out[0, p]))
        # Handle variables
        self.send('/params', out_list)

    def decode(self, x, y, d1, d2):
        # Create vector for latent point
        z_point = torch.zeros(1, self._model.latent_dims)
        z_point[0, d1] = x
        z_point[0, d2] = y
        # Perform regression on params
        out = self._model.regression_model(z_point)  
        out_list = []
        # Create dict out of params
        for p in range(out.shape[1]):
            out_list.append(self.param_names[p])
            out_list.append(float(out[0, p]))
        # Handle variables
        self.send('/params', out_list)

    def get_spectrogram(self, *args, projection=None, filter=True):
        if self._model is None:
           print('[Error] spectrogram requested by not any model loaded')
           self.send('/vae_error', '[Error] spectrogram requested by not any model loaded')
           return

        if projection is None:
            projection = self.projection

        z_input = np.array(list(args))[np.newaxis, :]
        input_dim = self._model.platent[-1]['dim'] if projection is None else projection.dim

        if z_input.shape[1] > input_dim:
            z_input = z_input[:, :input_dim]
        elif z_input.shape[1] < input_dim:
            z_input = np.concatenate([z_input, np.zeros((z_input.shape[0], input_dim - z_input.shape[1]))], axis=1)

        if projection is not None:
            z_input = projection.invert(z_input)

        with torch.no_grad():
            self._model.eval()
            vae_out = self._model.decode(self._model.format_input_data(z_input))

        spec_out = vae_out[0]['out_params'].mean.squeeze().numpy()
        if self.preprocessing:
            spec_out = self.preprocessing.invert(spec_out)
        if self.dataset:
            spec_out[spec_out > np.abs(audioSet.data)]
        phase_out = self.phase_callback(spec_out)

        if filter:
            spec_out[spec_out < self.min_threshold] = 0.
        spec_out = spec_out[1:].tolist()
        phase_out = phase_out[1:].tolist()

        self.send('/current_z', z_input.squeeze().tolist())
        self.send('/spectrogram_mag_out', spec_out)
        self.send('/spectrogram_phase_out', phase_out)


    def add_projection(self, proj_name, dimred, z_select=None, n_points=None, **kwargs):
        if proj_name == "none":
            self.print('projection cannot be named none')
        if proj_name in self._projections.keys():
            del self._projections[proj_name]

        proj_ids = None
        if self.dataset:
            if z_select is None:
                if n_points:
                    proj_ids = selector_n(self.dataset, n_points)
                else:
                    proj_ids = selector_all(self.dataset)
            elif issubclass(type(z_select), str):
                proj_ids = self.z_select_hash[z_select](self.dataset)
            else:
                proj_ids = self.z_select(self.dataset)

        if issubclass(type(dimred), str):
            dimred = getattr(dr, dimred)

        self.print('computing projection %s...'%proj_name)
        projection = dimred(**kwargs)
        manifold = dr.LatentManifold(projection, self.model, self.dataset, ids=proj_ids, preprocessing=self.preprocessing)
        self._projections[proj_name] = manifold
        self.print('projection %s created : %s'%(proj_name, manifold))
        self.get_state()

    def get_projections(self):
        self.send('/projections', list(self._projections.keys()))

    def save_projections(self, path):
        with open(path+'.aego', 'wb') as f:
            dill.dump(self._projections, f)
        self.print('projections saved at %s.aego'%path)

    def load_projections(self, path):
        with open(path, 'rb') as f:
            loaded_projections = dill.load(f)
        for k, v in loaded_projections.items():
            if k in self._projections.keys():
                self.print('[Warning] projection %s replaced'%k)
            self._projections[k] = v
        self.print('projections loaded from %s'%path)
        self.get_state()




