#%% -*- coding: utf-8 -*-

import os
import glob
import copy
import argparse
import torch
import numpy as np
from torch.utils.data import Dataset, DataLoader
from torchvision import transforms
from utils.transforms import LogTransform, NormalizeTensor, NoiseGaussian
from utils.plot import plot_batch, plot_batch_detailed
import librosa

meta_pairs = [["Bright_Dark", "Clean_Dirty", "Modern_Vintage", "Phat_Thin", 
               "Soft_Aggressive", "Constant_Moving", "Natural_Synthetic", 
               "Wide_Narrow", "Harmonic_Inharmonic", "Dynamic_Static"],
         ["Bright", "Dark", ""], 
         ["Clean", "Dirty", ""], 
         ["Modern", "Vintage", ""],
         ["Phat", "Thin", ""], 
         ["Soft", "Aggressive", ""], 
         ["Constant", "Moving", ""],
         ["Natural", "Synthetic", ""], 
         ["Wide", "Narrow", ""],
         ["Harmonic", "Inharmonic", ""], 
         ["Dynamic", "Static", ""]]

"""
###################

Synthesizer Dataset definition

###################
"""
class SynthesizerDataset(Dataset):
    
    def __init__(self, datadir, transform=None, data='mfcc', splits=[.8, .1, .1], shuffle_files=True, train='train'):
        self.data = data
        # Metadata and raw
        self.data_files = []
        # Spectral transforms
        self.spectral_files = []
        # Retrieve list of files
        tmp_files = sorted(glob.glob(datadir + '/raw/*.npz'))
        trans_files = sorted(glob.glob(datadir + '/' + data + '/*.npy'))
        self.data_files.extend(tmp_files)
        self.spectral_files.extend(trans_files)
        # Analyze dataset
        self.analyze_dataset()
        # Create splits
        self.create_splits(splits, shuffle_files)
        # Compute mean and std of dataset
        self.compute_normalization()
        # Now we can create the rightful transform
        self.transform = transform
        if (transform is None):
            tr = []
            if (self.data != 'mfcc'):
                tr.append(LogTransform(clip=1e-3))
            tr.append(NormalizeTensor(self.mean, self.var))
            tr.append(transforms.RandomApply([NoiseGaussian(factor=1e-2)], p=0.333))
            #tr.append(transforms.RandomApply([OutliersZeroRandom(factor=.1)], p=0.333))
            self.transform = transforms.Compose(tr)
    
    def switch_set(self, name):
        if (name == 'test'):
            self.data_files = self.test_files[0]
            self.spectral_files = self.test_files[1]
            self.metadata = self.test_files[2]
        if (name == 'valid'):
            self.data_files = self.valid_files[0]
            self.spectral_files = self.valid_files[1]
            self.metadata = self.valid_files[2]
        tr = []
        if (self.data != 'mfcc'):
            tr.append(LogTransform(clip=1e-3))
        tr.append(NormalizeTensor(self.mean, self.var))
        self.transform = transforms.Compose(tr)
        self.test_files = None
        self.valid_files = None
        return self
            
    def compute_normalization(self):
        self.mean = 0
        self.var = 0
        tr = LogTransform(clip=1e-3)
        # Parse dataset to compute mean and norm
        for n in range(len(self.spectral_files)):
            data = np.load(self.spectral_files[n], allow_pickle=True)
            data = torch.from_numpy(data).float()
            if (self.data != 'mfcc'):
                data = tr(data)
            # Current file stats
            b_mean = data.mean()
            b_var = (data - self.mean)
            # Running mean and var
            self.mean = self.mean + ((b_mean - self.mean) / (n + 1))
            self.var = self.var + ((data - self.mean) * b_var).mean()
        self.mean = float(self.mean)
        if(len(self.spectral_files) == 0):
            self.var = float(np.sqrt(self.var / 1))
        else: 
            self.var = float(np.sqrt(self.var / len(self.spectral_files)))
    
    def analyze_dataset(self):
        # Fill some properties based on the first file
        loaded = np.load(self.data_files[0], allow_pickle=True)
        self.param_names = sorted(list(loaded['param'].item().keys()))
        # Keep some reference parameter values
        self.param_values = [loaded['param'].item()[v] for v in self.param_names]
        data = np.load(self.spectral_files[0], allow_pickle=True)
        self.input_size = data.shape
        # Metadata indicators (character = 0, features = 1, categories = 2)
        self.metadata = torch.zeros(len(self.data_files), 1)
        # Check parameters
        params_check = []
        # Parse dataset to check parameters
        for n in range(len(self.data_files)):
            file = np.load(self.data_files[n], allow_pickle=True) 
            loaded = file['param'].item()
            params_check.append(torch.Tensor([loaded[p] for p in self.param_names]).unsqueeze(0))
            meta_keys = file['chars']
            self.metadata[n] = (np.sum(meta_keys[:, 2]) == meta_keys.shape[0]) * 1.0
        full_params = torch.cat(params_check, dim=0)
        self.params_std = torch.std(full_params, dim=0)
        self.params_mean = torch.mean(full_params, dim=0)
        self.params_idx = self.params_std.nonzero()
        self.final_params = self.param_names#[self.param_names[i] for i in self.params_idx]
        self.final_std = self.params_std#[self.params_std[i] for i in self.params_idx]
        self.output_size = len(self.final_params)
            
    def create_splits(self, splits, shuffle_files):
            nb_files = len(self.data_files)
            if (shuffle_files):
                idx = np.random.permutation(nb_files).astype('int')
                self.data_files = [self.data_files[i] for i in idx]
                self.spectral_files = [self.spectral_files[i] for i in idx]
            idx = np.linspace(0, nb_files-1, nb_files).astype('int')
            train_idx = idx[:int(splits[0]*nb_files)]
            valid_idx = idx[int(splits[0]*nb_files):int((splits[0]+splits[1])*nb_files)]
            test_idx = idx[int((splits[0]+splits[1])*nb_files):]
            # Validation split
            self.valid_files = (
                    [self.data_files[i] for i in valid_idx], 
                    [self.spectral_files[i] for i in valid_idx],
                    [self.metadata[i, :] for i in valid_idx])
            # Test split
            self.test_files = (
                    [self.data_files[i] for i in test_idx], 
                    [self.spectral_files[i] for i in test_idx],
                    [self.metadata[i, :] for i in test_idx])
            self.data_files = [self.data_files[i] for i in train_idx]
            self.spectral_files = [self.spectral_files[i] for i in train_idx]
            self.metadata = [self.metadata[i, :] for i in train_idx]

    def __getitem__(self, idx):
        loaded = np.load(self.data_files[idx], allow_pickle=True)
        meta = torch.from_numpy(loaded['chars'])
        params = loaded['param'].item()
        params = torch.Tensor([params[p] for p in self.final_params])
        data = np.load(self.spectral_files[idx], allow_pickle=True)
        data = self.transform(torch.from_numpy(data).float())
        audio = torch.from_numpy(loaded['audio']).float()
        return data, params, meta, audio

    def __len__(self):
        return len(self.data_files)

class AudioDataset(Dataset):
    
    def __init__(self, datadir, mean, var, transform=None, data='mfcc', splits=[.8, .1, .1], shuffle_files=True, train='train'):
        self.data = data.split("_") #ex. ["mel", "mfcc"]
        # Metadata and raw
        self.data_files = []
        # Retrieve list of files
        tmp_files = sorted(glob.glob(datadir + '/*.wav'))
        self.data_files.extend(tmp_files)
        # Now we can create the rightful transform
        # self.transform = transform #whatever
        self.transforms = []
        # Save properties
        self.means = mean #dictionary
        self.vars = var
        for d in self.data:
            tr = []
            if (d != 'mfcc'):
                tr.append(LogTransform(clip=1e-3))
            tr.append(NormalizeTensor(self.means[d], self.vars[d]))
            self.transforms.append(transforms.Compose(tr))

    def __getitem__(self, idx):
        wave, _ = librosa.core.load(self.data_files[idx], sr=22050)
        datas = []
        ds = []
        for d in self.data:
            # changed from . to _
            if (os.path.exists(self.data_files[idx] + '_' + d + '.npy')):
                data = np.load(self.data_files[idx] + '_' + d + '.npy', allow_pickle=True)
            else:
                if (d == 'mel'):
                    data = librosa.feature.melspectrogram(wave, sr=22050, n_fft=2048, n_mels=64, hop_length=1024, fmin=30, fmax=11000)
                    data = data[:64, :80]
                if (d == 'mfcc'):
                    data = librosa.feature.mfcc(wave, sr=22050, n_mfcc=16, hop_length=256)
                    data = data[:16, :320]
                    data = data.reshape(64,80)
            datas.append(data)
            np.save(self.data_files[idx] + '_' + d + '.npy', data)
        for i,data in enumerate(datas):
            ds.append(self.transforms[i](torch.from_numpy(data).float()).unsqueeze(0))
        datas = torch.cat(ds)
        return datas, wave

    def __len__(self):
        return len(self.data_files)

class SpecData(Dataset):
    """Single data type"""
    def __init__(self, datadir, spectral_files, transform=None, data_type='mel', stats=None, set_type=None):
        self.data_type = data_type
        # Spectral transforms
        self.spectral_files = np.array(spectral_files, dtype=np.unicode_)
        self.datadir = datadir
        # Retrieve list of files
        # Compute mean and std of dataset
        if stats is None: # entire set        
            self.compute_normalization()
        else: #train, test, valid sets
            self.mean, self.var = stats
        # Now we can create the rightful transform
        self.transform = transform
        if (transform is None):
            tr = []
            if (self.data_type != 'mfcc'):
                tr.append(LogTransform(clip=1e-3))
            tr.append(NormalizeTensor(self.mean, self.var))
            if set_type == "train": # apply noise to train sets
                tr.append(transforms.RandomApply([NoiseGaussian(factor=1e-2)], p=0.333))
            #tr.append(transforms.RandomApply([OutliersZeroRandom(factor=.1)], p=0.333))
            self.transform = transforms.Compose(tr)      

    def compute_normalization(self):
        self.mean = 0
        self.var = 0 # not really var but stdev
        tr = LogTransform(clip=1e-3)
        # Parse dataset to compute mean and norm
        for n in range(len(self.spectral_files)):
            data = np.load(self.datadir + '/' + self.data_type + '/' + self.spectral_files[n], allow_pickle=True)
            data = torch.from_numpy(data).float()
            if (self.data_type != 'mfcc'): # log melspectrogram
                data = tr(data)
            # Current file stats
            b_mean = data.mean()
            b_var = (data - self.mean)
            # Running mean and var
            self.mean = self.mean + ((b_mean - self.mean) / (n + 1))
            self.var = self.var + ((data - self.mean) * b_var).mean()
        self.mean = float(self.mean)
        if(len(self.spectral_files) == 0):
            self.var = float(np.sqrt(self.var / 1))
        else:
            self.var = float(np.sqrt(self.var / len(self.spectral_files)))

    def __getitem__(self, idx):
        data = np.load(self.datadir + '/' + self.data_type + '/' + self.spectral_files[idx], allow_pickle=True)
        data = self.transform(torch.from_numpy(data).float())
        return data

    def __len__(self):
        return len(self.spectral_files)

class CompSynthesizerDataset(Dataset):
    """
    Works the same way as Synthesizer dataset but can use multiple transforms (mel, mfcc)
    
    """
    def __init__(self, datadir, use_params, transform=None, data='mel_mfcc', splits=[.8, .1, .1], shuffle_files=True):
        self.data = np.array(data.split("_"), dtype=np.unicode_) #["mel", "mfcc"] or ["mel"]
        # Metadata and raw
        self.data_files = []
        # Transform files
        self.spectral_files = {}
        # Transform datasets
        self.trans_datasets = {}
        # Force list of parameters
        self.use_params = use_params
        # Retrieve list of files
        tmp_files = sorted(glob.glob(datadir + '/raw/*.npz'))
        self.datadir = datadir
        for t in range(len(tmp_files)):
            tmp_files[t] = os.path.basename(tmp_files[t])
        self.data_files = np.array(tmp_files, dtype=np.unicode_)
        self.means = {}
        self.vars = {}
        for dtype in self.data:
            self.spectral_files[dtype] = np.array(sorted(glob.glob(datadir + '/' + dtype + '/*.npy')), dtype=np.unicode_)
            for t in range(len(self.spectral_files[dtype])):
                self.spectral_files[dtype][t] = os.path.basename(self.spectral_files[dtype][t])
            self.trans_datasets[dtype] = SpecData(datadir, self.spectral_files[dtype], data_type=dtype, transform=transform)
            self.means[dtype] = self.trans_datasets[dtype].mean
            self.vars[dtype] = self.trans_datasets[dtype].var
        # Analyze dataset
        self.analyze_dataset()
        # Create splits
        self.create_splits(splits, shuffle_files)

    def analyze_dataset(self):
        # Fill some properties based on the first file
        loaded = np.load(self.datadir + '/raw/' + self.data_files[0], allow_pickle=True)
        self.param_names = np.array(sorted(list(self.use_params)), dtype=np.unicode_)
        # Keep some reference parameter values
        self.param_values = [loaded['param'].item()[v] for v in self.param_names]
        #spec = np.load(self.spectral_files[self.data[0]][0])
        self.input_size = [len(self.data), 64, 80] #TODO FIX
        #Metadata indicators (character = 0, features = 1, categories = 2)
        self.metadata = torch.zeros(len(self.data_files))
        # Check parameters
        params_check = []
        # Parse dataset to check parameters
        for n in range(len(self.data_files)):
            file = np.load(self.datadir + '/raw/' + self.data_files[n], allow_pickle=True) 
            loaded = file['param'].item()
            params_check.append(torch.Tensor([loaded[p] for p in self.param_names]).unsqueeze(0))
            meta_keys = file['chars']
            self.metadata[n] = (np.sum(meta_keys[:, 2]) == meta_keys.shape[0]) * 1.0
        full_params = torch.cat(params_check, dim=0)
        self.params_std = torch.std(full_params, dim=0)
        self.params_mean = torch.mean(full_params, dim=0)
        self.params_idx = self.params_std.nonzero()
        self.final_params = self.param_names#[self.param_names[i] for i in self.params_idx]
        self.final_std = self.params_std#[self.params_std[i] for i in self.params_idx]
        self.output_size = len(self.final_params)
    
    def switch_set(self, name): # spectral_files no longer switch
        if (name == 'test'):
            self.data_files = self.test_files[0]
            self.trans_datasets = self.test_trans
            self.metadata = self.test_files[1]
        if (name == 'valid'):
            self.data_files = self.valid_files[0]
            self.trans_datasets = self.valid_trans
            self.metadata = self.valid_files[1]
        self.test_files = None
        self.valid_files = None
        self.test_trans = None
        self.valid_trans = None
        return self

    def create_splits(self, splits, shuffle_files):
        nb_files = len(self.data_files)
        if (shuffle_files):
            idx = np.random.permutation(nb_files).astype('int')
            self.data_files = [self.data_files[i] for i in idx]
            for dtype in self.data:
                self.spectral_files[dtype] = [self.spectral_files[dtype][i] for i in idx]
        idx = np.linspace(0, nb_files-1, nb_files).astype('int')
        train_idx = idx[:int(splits[0]*nb_files)]
        valid_idx = idx[int(splits[0]*nb_files):int((splits[0]+splits[1])*nb_files)]
        test_idx = idx[int((splits[0]+splits[1])*nb_files):]
        # Validation split
        self.valid_files = (
                np.array([self.data_files[i] for i in valid_idx], dtype=np.unicode_),
                torch.Tensor([self.metadata[i] for i in valid_idx]))
        # Test split
        self.test_files = (
                np.array([self.data_files[i] for i in test_idx], dtype=np.unicode_), 
                torch.Tensor([self.metadata[i] for i in test_idx]))
        self.valid_trans = {}
        self.test_trans = {}
        for dtype in self.data:
            self.valid_trans[dtype] = SpecData(self.datadir, [self.spectral_files[dtype][i] for i in valid_idx], data_type=dtype, stats=[self.means[dtype],self.vars[dtype]], set_type="valid")
            self.test_trans[dtype] = SpecData(self.datadir, [self.spectral_files[dtype][i] for i in test_idx], data_type=dtype, stats=[self.means[dtype],self.vars[dtype]], set_type="test")
            self.trans_datasets[dtype] = SpecData(self.datadir, [self.spectral_files[dtype][i] for i in train_idx], data_type=dtype, stats=[self.means[dtype],self.vars[dtype]], set_type="train")
            self.spectral_files[dtype] = None
        self.data_files = np.array([self.data_files[i] for i in train_idx], dtype=np.unicode_)
        self.metadata = torch.Tensor([self.metadata[i] for i in train_idx])
        self.spectral_files = None

    def fix_size(self, data, dtype):
        if dtype=="mfcc":
            data = data[:, :320]
            data = data.reshape(-1, 80)
        if dtype=="mel":
            data = data[:, :80]            
        return data

    def __getitem__(self, idx):        
        #data = [self.fix_size(self.trans_datasets[dtype][idx], dtype).unsqueeze(0) for dtype in self.data]
        #data = torch.cat(data)
        data = self.fix_size(self.trans_datasets[self.data[0]][idx], self.data[0]).unsqueeze(0)
        loaded = np.load(self.datadir + '/raw/' + self.data_files[idx], allow_pickle=True)
        meta = torch.from_numpy(loaded['chars'])
        params_v = loaded['param'].item()
        params = torch.Tensor(len(self.final_params))
        for p in range(len(self.final_params)):
            params[p] = params_v[self.final_params[p]]
        audio = torch.from_numpy(loaded['audio']).float()
        return data, params, meta, audio

    def __len__(self):
        return len(self.data_files)
"""
###################

Load any given dataset and return DataLoaders

###################
"""
def load_dataset(args, **kwargs): 
    if (args.dataset in ['toy'], ["32par"], ["64par"], ["64par_aug"], ["128par"]):
        params = {'32par':'32contparams.txt', '64par':'64contparams.txt', '64par_aug':'64contparams.txt', '128par':'128contparams.txt'}
        with open('synth/params/' + params[args.dataset]) as f: # load list of parameters to not fix
            use_params = [line.strip() for line in f]
        dset_train = CompSynthesizerDataset(args.path + '/' + args.dataset, use_params, data=args.data, **kwargs)
        dset_valid = copy.deepcopy(dset_train).switch_set('valid')
        dset_test = copy.deepcopy(dset_train).switch_set('test')
        dset_train = dset_train.switch_set('train')
    else:
        raise Exception('Wrong name of the dataset!')
    args.input_size = dset_train.input_size
    args.output_size = dset_train.output_size
    train_loader = DataLoader(dset_train, batch_size=args.batch_size, shuffle=True, num_workers=args.nbworkers, pin_memory=False, **kwargs)
    valid_loader = DataLoader(dset_valid, batch_size=args.batch_size, shuffle=(args.train_type == 'random'), num_workers=args.nbworkers, pin_memory=False, **kwargs)
    test_loader = DataLoader(dset_test, batch_size=args.batch_size, shuffle=(args.train_type == 'random'), num_workers=args.nbworkers, pin_memory=False, **kwargs)
    return train_loader, valid_loader, test_loader, args

def get_external_sounds(path, ref_loader, args, **kwargs):
    dset = AudioDataset(path, data=args.data, mean=ref_loader.means, var=ref_loader.vars, **kwargs)
    loader = DataLoader(dset, batch_size=args.batch_size, shuffle=False, num_workers=args.nbworkers, pin_memory=True, **kwargs)
    dset.final_params = ref_loader.final_params
    return loader

if __name__ == '__main__':
    # Define arguments
    parser = argparse.ArgumentParser()
    # Data arguments
    parser.add_argument('--path', type=str, default='/Users/esling/Datasets/diva_dataset', help='')
    parser.add_argument('--dataset', type=str, default='toy', help='')
    parser.add_argument('--data', type=str, default='mel', help='')
    parser.add_argument('--batch_size', type=int, default=64, help='')
    parser.add_argument('--epochs', type=int, default=100, help='')
    args = parser.parse_args()
    train_loader, valid_loader, test_loader, args = load_dataset(args)
    # Take fixed batch (train)
    data, params, meta, audio = next(iter(train_loader))
    plot_batch(data[:16].unsqueeze(1))
    plot_batch_detailed(data[:5], params[:5])
    # Take fixed batch (train)
    data, params, meta = next(iter(test_loader))
    plot_batch(data[:16].unsqueeze(1))
    plot_batch_detailed(data[:5], params[:5])