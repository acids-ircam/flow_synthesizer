# Universal audio synthesizer control with normalizing flows

This repository hosts code and additional results for the paper "Universal audio synthesizer control with normalizing flows".

## Installing the flow synthesizer plugin

In order to try out the _Flow synthesizer_ plugin, you must 
1. Have an installed version of the [Diva VST](https://u-he.com/products/diva/) (The system works with the free tryout version but will produce noise every now and then) 
2. Have an updated version of `Python 3.7`
3. Install the Python dependencies by running the following line at the root of this folder
```bash
$ pip install -r requirements.txt
```
4. Put the `flow_synth.amxd` device inside a MIDI track in `Ableton Live`
5. If you want to ensure (and debug) what is going on from the server side run
```bash
$ cd code && python osc_launch.py
```

Note that the plugin has only been tested on MacOS X High Sierra (10.13.6)

## Supporting webpage

For a better viewing experience, please **visit the corresponding [supporting website](https://acids-ircam.github.io/flow_synthesizer/ "Flow synthesizer")**.

It embeds the following:
  * Supplementary figures
  * Audio examples
	* Reconstruction
	* Macro-control learning
	* Neighborhood exploration
	* Interpolation
	* Vocal sketching
  * Real-time implementation in Ableton Live
  
You can also directly parse through the different sub-directories of the main [`docs`](docs) directory.

## Dataset

The dataset can be downloaded here:


## Code

### Dependencies

#### Python

Code has been developed with `Python 3.7`. It should work with other versions of `Python 3`, but has not been tested. Moreover, we rely on several third-party libraries, listed in [`requirements.txt`](requirements.txt). They can be installed with

```bash
$ pip install -r requirements.txt
```

As our experiments are coded in PyTorch, no additional library is required to run them on GPU (provided you already have CUDA installed).


#### RenderMan

### Usage

The code is mostly divided into two scripts `train.py` and `evaluate.py`. The first script `train.py` allows to train a model from scratch as described in the paper. The second script `evaluate.py` allows to generate the figures of the papers, and also all the supporting additional materials visible on the [supporting page](https://acids-ircam.github.io/flow_synthesizer)) of this repository.

#### train.py arguments
```

```

### Models details

As discussed in the paper, the very large amount of baseline models implemented did not allow to provide all the parameters for reference models (which are defined in the source code). However, we provide these details inside the documentation page in the [models details section](https://acids-ircam.github.io/flow_synthesizer/#models-details)
