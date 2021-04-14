# [Giotto](https://rubd.github.io/Giotto_site/index.html) Tutorial Binder

## Table of contents
1. [What is Binder?](https://github.com/ndelrossi7/giotto-tutorial-binder#what-is-binder): *A brief overview on what Binder is and how it works in this context*

2. [Examples and data used](https://github.com/ndelrossi7/giotto-tutorial-binder#examples-and-data-used): *Links to the tutorials and data available on the website*

3. [Instructions](https://github.com/ndelrossi7/giotto-tutorial-binder#instructions): *Steps for usage*

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
1. Click this button: ![Binder](https://mybinder.org/badge_logo.svg)
2. Wait for your Docker image to be built (if you want to see how this is done, you can click ```Build logs``` to display the running script).
3. Navigate into the ```Notebooks``` folder and run whichever notebook you like!
4. Alternatively, navigate into any of the pre-made scripts for a quick look at how some of these steps come together.
5. If you run into any errors or have any questions about how the functions and scripts work, feel free to raise an [issue](https://github.com/ndelrossi7/giotto-tutorial-binder/issues) with this repository.

-------------------------------

### Directory
