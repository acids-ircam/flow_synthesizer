import os
import glob
import numpy as np
import librosa
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--path', type=str, default='/Users/naotake/Datasets/diva_audio/32par', help='')
args = parser.parse_args()

mel_dir = os.path.join(args.path, 'mel/')
mfcc_dir = os.path.join(args.path, 'mfcc/')

if os.path.exists(mel_dir):
    print("transform already exists")
    exit()
os.mkdir(mel_dir)
os.mkdir(mfcc_dir)
param_files = sorted(glob.glob(os.path.join(args.path, 'raw/*.npz')))

for p in param_files:
    print(p)
    audio = np.load(p)['audio']
    f_name, _ = os.path.splitext(os.path.basename(p))
    print(f_name)
    # Compute mel
    mel_file = os.path.join(mel_dir, f_name + '.npy')
    b_mel = librosa.feature.melspectrogram(audio, sr=22050, n_fft=2048, n_mels=64, hop_length=1024, fmin=30, fmax=11000) #(64,87)
    b_mel = b_mel[:64,:80]
    np.save(mel_file, b_mel)
    mfcc_file = os.path.join(mfcc_dir, f_name + '.npy')
    b_mfcc = librosa.feature.mfcc(audio, sr=22050, n_mfcc=16, hop_length=256) #(16,346)
    b_mfcc = b_mfcc[:16,:320]
    np.save(mfcc_file, b_mfcc)