#%%
import argparse
import librenderman as rm
import numpy as np
import json, ast
import librosa
import scipy

def resample(y, orig_sr, target_sr):
    if orig_sr == target_sr:
        return y
    ratio = float(target_sr) / orig_sr
    n_samples = int(np.ceil(y.shape[-1] * ratio))
    y_hat = scipy.signal.resample(y, n_samples, axis=-1) #maybe resampy is better?
    # y_hat = resampy.resample(y, orig_sr, target_sr, filter=res_type, axis=-1)
    return np.ascontiguousarray(y_hat, dtype=y.dtype)

def play_patch(engine, patch_gen, patch=None):
    if patch is None:
        patch = patch_gen.get_random_patch()
    engine.set_patch(patch)
    # Settings to play a note and extract data from the synth.
    midiNote = 60
    midiVelocity = 127#100
    noteLength = 3.0
    renderLength = 4.0
    engine.render_patch(midiNote, midiVelocity, noteLength, renderLength, True)
    engine.render_patch(midiNote, midiVelocity, noteLength, renderLength, True)
    #engine.render_patch(midiNote, midiVelocity, noteLength, renderLength) #render twice to get rid of blip
    audio = engine.get_audio_frames()
    return np.array(audio), patch

def midiname2num(patch, rev_diva_midi_desc): 
    """
    converts param dict {param_name: value,...} to librenderman patch [(param no., value),..]
    """
    return [(rev_diva_midi_desc[k], float(v)) for k,v in patch.items()]

def create_synth(dataset, path='synth/diva.64.so'):
    with open("synth/diva_params.txt") as f:
        diva_midi_desc = ast.literal_eval(f.read())
    rev_idx = {diva_midi_desc[key]: key for key in diva_midi_desc}
    if dataset == "toy":
        with open("synth/param_nomod.json") as f:
            param_defaults = json.load(f)
    else:
        with open("synth/param_default_32.json") as f:
            param_defaults = json.load(f)
    engine = rm.RenderEngine(44100, 512, 512)
    engine.load_plugin(path)
    generator = rm.PatchGenerator(engine)
    return engine, generator, param_defaults, rev_idx

def synthesize_audio(params, engine, generator, params_default):
    # Replace param_defaults with whatever preset to play
    patch = midiname2num(params, params_default)
    audio, patch = play_patch(engine, generator, patch)
    return audio

def synthesize_batch(batch, param_names, engine, generator, params_default, rev_idx, n_outs=2, orig_wave=None, name=None):
    final_audio = [None] * batch.shape[0]
    # Ensure that we reset the synth
    engine.load_preset("synth/osc_reset.fxb")
    for b in range(batch.shape[0]):
        cur_params = batch[b]
        param_dict = params_default
        # Create dict out of params
        for p in range(len(cur_params)):
            param_dict[param_names[p]] = float(cur_params[p])
        final_audio[b] = synthesize_audio(param_dict, engine, generator, rev_idx)
        final_audio[b] = resample(final_audio[b], 44100, 22050)
    if (name is not None):
        n_outs = min(n_outs, len(final_audio))
        # Figure out len of full audio
        orig_size = sum([int(o.shape[0]) for o in orig_wave[:n_outs]]) + (2205 * n_outs)
        final_size = sum([int(f.shape[0]) for f in final_audio[:n_outs]]) + (2205 * n_outs)
        wave_out = np.zeros(int(orig_size + final_size))
        cur_p = 0
        for b in range(n_outs):
            wave_out[cur_p:(cur_p + orig_wave[b].shape[0])] += orig_wave[b].numpy()
            cur_p += orig_wave[b].shape[0] + 2205
            wave_out[cur_p:(cur_p + final_audio[b].shape[0])] += final_audio[b]
            cur_p += final_audio[b].shape[0] + 2205
        librosa.output.write_wav(name + '.wav', wave_out, 22050)
    return final_audio

if __name__ == "__main__":
    """
    Sample program, generates default preset
    """
    # Define arguments
    parser = argparse.ArgumentParser()
    # Data arguments
    parser.add_argument('--path',           type=str,   default='/Users/esling/Datasets/diva_dataset', help='')
    parser.add_argument('--output',         type=str,   default='outputs',      help='')
    parser.add_argument('--dataset',        type=str,   default='toy',          help='')
    parser.add_argument('--data',           type=str,   default='mel',          help='')
    args = parser.parse_args()
    print('[Load the dataset]')
    # Take fixed batch
    loaded = np.load('synth/test_batch.npz')['arr_0'].item()
    fixed_data, fixed_params, fixed_meta, fixed_audio = loaded["fixed_data"], loaded["fixed_params"], loaded["fixed_meta"], loaded["fixed_audio"]
    print('[Create synth rendering]')
    final_params = ['ENV1: Decay', 'VCF1: FilterFM', 'OSC: Vibrato', 'OSC: FM', 
                    'VCF1: Feedback', 'ENV1: Attack', 'ENV1: Sustain', 
                    'OSC: Volume3', 'OSC: Volume2', 'OSC: OscMix', 
                    'VCF1: Resonance', 'VCF1: Frequency', 'OSC: Tune3',
                    'OSC: Tune2', 'OSC: Shape1', 'OSC: Shape2']
    # Create synth rendering system
    engine, generator, param_defaults, rev_idx = create_synth()
    print('[Synthesize batch]')
    # Generate the test batch for comparison
    audio = synthesize_batch(fixed_params[:16], final_params, engine, generator, param_defaults, rev_idx, orig_wave=fixed_audio, name='check')
    
