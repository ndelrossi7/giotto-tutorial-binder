# Giotto Tutorial Binder
--------------------

### What is [Binder](https://mybinder.readthedocs.io/en/latest/)?

Binder utilizes [JupyterHub](https://jupyterhub.readthedocs.io/en/stable/), [repo2docker](https://repo2docker.readthedocs.io/en/latest/), and [BinderHub](https://binderhub.readthedocs.io/en/latest/) to create a docker image built off of a GitHub repository. 

By clicking [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ndelrossi7/r-conda-binder/HEAD), the environment will automatically be created and you’ll be able to run the jupyter notebooks in this repository on Binder’s servers. 

#### Things to note
- The first time you build this Binder, it may take while.
- You will have access to 1-2 GB RAM. If you go over 2 GB of RAM the kernel may be restarted.
  - Because we have set up this repo so that you can import pre-processing scripts, you’ll be able to start with any notebook. If your kernel restarts just launch the Binder again!
- If you are inactive for 10 minutes, the session will shut down. Otherwise, you’ll have up to 6 hours of usage or 1 cpu-hour for more intensive runs. 
