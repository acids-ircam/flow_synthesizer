from scipy import signal 
from scipy.io import wavfile

def wav_to_spectrogram(file): 
    '''
    Returns frequencies, times, and spectrograms for a given files
    '''
    sample_rate, samples = wavfile.read(file) 
    frequencies, times, spectrogram = signal.spectrogram(samples, sample_rate)
    return frequencies, times, spectrogram 

