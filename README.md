# Universal audio synthesizer control with normalizing flows

This repository hosts code and additional results for the paper "Universal audio synthesizer control with normalizing flows".

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

Code has been developed with `Python 3.7`. It should work with other versions of `Python 3`, but has not been tested. Moreover, we rely on several third-party libraries, listed in [`requirements.txt`](requirements.txt). They can be installed with `pip install -r requirements.txt`. We rely on several libraries for different aspects of the code. The complete list is `numpy`, `scipy`, `pytorch`, `matplotlib`, `scikit-learn`, `nsgt`, `scikit-image`

Here is an helper list of pip3 install commands to facilitate your install

```
pip3 install numpy
pip3 install scipy
pip3 install pytorch
pip3 install matplotlib
pip3 install scikit-learn
pip3 install scikit-image
pip3 install pyro
```

The code can also work on GPUs, in which case you need to add the following dependencies (based on the premises that you have a working GPU with CUDA installed)

#### RenderMan

### Usage

The code is mostly divided into two scripts `train.py` and `evaluate.py`. The first script `train.py` allows to train a model from scratch as described in the paper. The second script `evaluate.py` allows to generate the figures of the papers, and also all the supporting additional materials visible on the [supporting page](https://acids-ircam.github.io/flow_synthesizer)) of this repository.

#### train.py arguments
```

```

