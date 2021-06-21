from scipy import signal 
from scipy.io import wavefile 

def wav_to_spectrogram(file): 
    sample_rate, samples = wavefile.read(file) 
    frequencies, times, spectrogram = signal.spectrogram(samples, sample_rate)
    return frequencies, times, spectrogram 

