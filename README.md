# [Giotto](https://rubd.github.io/Giotto_site/index.html) Tutorial Binder

## Table of contents
1. [What is Binder?](https://github.com/ndelrossi7/giotto-tutorial-binder#what-is-binder): *A brief overview on what Binder is and how it works in this context*

2. [Examples and data used](https://github.com/ndelrossi7/giotto-tutorial-binder#examples-and-data-used): *Links to the tutorials and data available on the website*

3. [Instructions](https://github.com/ndelrossi7/giotto-tutorial-binder#instructions): *Steps for usage*

4. [Directory](https://github.com/ndelrossi7/giotto-tutorial-binder#directory): *Easy navigation to the files in this repository*

----------------------------

### What is [Binder](https://mybinder.readthedocs.io/en/latest/)?

Binder utilizes [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/), [repo2docker](https://repo2docker.readthedocs.io/en/latest/), and [BinderHub](https://binderhub.readthedocs.io/en/latest/) to create a docker image built off of a GitHub repository. 

By clicking [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ndelrossi7/r-conda-binder/HEAD), the environment will automatically be created and you’ll be able to run the jupyter notebooks in this repository on Binder’s servers. 

##### *Things to note*
- The first time you build this Binder, it may take while.
- You will have access to 1-2 GB RAM. If you go over 2 GB of RAM the kernel may be restarted.
  - Because we have set up this repo so that you can import pre-processing scripts, you’ll be able to start with any notebook. If your kernel restarts just launch the Binder again!
- If you are inactive for 10 minutes, the session will shut down. Otherwise, you’ll have up to 6 hours of usage or 1 cpu-hour for more intensive runs. 

---------------------------

### Examples and data used

This binder is modeled after the code tutorials in the [HOWTO](https://rubd.github.io/Giotto_site/articles/getting_started.html#howtos) section of the Giotto website. The goal was to go through the Giotto pipelines with both RNA expression and image (visium) data. This binder should provide a good overview for using Giotto to its fullest potential. 

#### *Data*
If you want to do some more exploration with the data we used, you can find more information here:
- [mini seqFISH](https://rubd.github.io/Giotto_site/articles/mini_seqfish.html)
- [mini Visium](https://rubd.github.io/Giotto_site/articles/mini_visium.html)

---------------------------

### Instructions
1. Click this button: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ndelrossi7/r-conda-binder/HEAD)
2. Wait for your Docker image to be built (if you want to see how this is done, you can click ```Build logs``` to display the running script).
3. Navigate into the ```Notebooks``` folder and run whichever notebook you like!
4. Alternatively, navigate into any of the pre-made scripts for a quick look at how some of these steps come together.
5. If you run into any errors or have any questions about how the functions and scripts work, feel free to raise an [issue](https://github.com/ndelrossi7/giotto-tutorial-binder/issues) with this repository.

-------------------------------

### Directory

- [**Notebooks**](https://github.com/ndelrossi7/giotto-tutorial-binder/tree/main/notebooks) Directory of notebooks and scripts detailing the tutorials in this binder

  - [**Scripts**](https://github.com/ndelrossi7/giotto-tutorial-binder/tree/main/notebooks/scripts) Pre-processing scripts for reference and importing in the more advanced tutorial notebooks
    - [*Creating a Giotto Object*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/scripts/my_giotto_object.R)
  
    - [*Pre-processing steps*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/scripts/preprocess.R)
  
    - [*Clustered Giotto Object*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/scripts/clustered_obj.R)
  
    - [*Spatial Pre-processed Object*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/scripts/spatial_pre_process.R)
  
    - [*Visium Pre-Processed Object*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/scripts/visium_obj.R)

  - [*Creating a Giotto Object*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/a-Creating-a-Giotto-Object.ipynb)

  - [*Processing and filtering a Giotto Object*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/b-Processing-and-Filtering-Giotto-Object.ipynb)

  - [*Dimensionality Reduction*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/c-Dimensionality-Reduction.ipynb)

  - [*Clustering*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/d-Clustering.ipynb)

  - [*Differentially Expressed Genes*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/e-Differentially-Expressed-Genes.ipynb)

  - [*Annnotation Tools*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/f-Annotation-Tools.ipynb)

  - [*Spatial Enrichment*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/g-Spot-Enrichment-Tools.ipynb)

  - [*Spatial Grid & Network*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/h-Spatial-Grid-or-Network.ipynb)

  - [*Spatial Gene Detection*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/i-Spatial-Gene-Detection.ipynb)

  - [*Spatial Gene Coexpression*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/j-Spatial-Gene-Coexpression.ipynb)

  - [*Hidden Markov Random Field (HMRF)*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/k-Hidden-Markov-Random-Field.ipynb)

  - [*Cell-Cell Interaction*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/l-Cell-Cell-Interaction-Enrichment.ipynb)

  - [*Interaction Changed Genes*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/m-Interaction-Changed-Genes.ipynb)

  - [*Ligand-Receptor Interactions*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/n-Ligand-receptor-interactions.ipynb)

  - [*Visium Pre-processing*](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/notebooks/o-Visium-Preprocessing.ipynb)

- [**Environment file**](https://github.com/ndelrossi7/giotto-tutorial-binder/blob/main/environment.yml) Anaconda environment file with information on the version of R used and the various packages and dependencies necessary for running Giotto
