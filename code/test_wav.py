# take in a wav file 
# convert it to a spectrogram 
# then use the spectrogram to predict the synth parameters 
# with a pretrained model 
import os
import torch 
from wav_to_spectrogram_converter import wav_to_spectrogram 

def test():
    data_dir = './data/' 
    if os.path.isdir(data_dir):
        print('Data Directory exists')
    else: 
        print('**** Directory not found *****')
    wav_file = './data/file_example.wav'
    _, _, spectrogram = wav_to_spectrogram(wav_file)
    model = torch.load('./results/64par/vae_flow_mse_32_cnn_iaf_mlp_1.model')
    model.eval()
    inference = model(spectrogram) 

if __name__ == '__main__': 
    test()


