# useful troubleshooting link: https://stackoverflow.com/questions/63220597/python-in-r-error-could-not-find-a-python-environment-for-usr-bin-python ----

# WINDOWS install ----
  # load reticulate
library(reticulate) 

  # check Python path in C://
    # if PATH is not going to conda, change it in This Computer - advanced - env.

Sys.which('python')
# = "C:\\Users\\tmaso\\ANACON~1\\envs\\R-RETI~1\\python.exe"


  # check details
py_config() # this might prompt to install MINICONDA = say NO
  # result
#python:         C:/Users/tmaso/anaconda3/envs/r-reticulate/python.exe
#libpython:      C:/Users/tmaso/anaconda3/envs/r-reticulate/python36.dll
#pythonhome:     C:/Users/tmaso/anaconda3/envs/r-reticulate
#version:        3.6.13 (default, Feb 19 2021, 05:17:09) [MSC v.1916 64 bit (AMD64)]
#Architecture:   64bit
#numpy:          C:/Users/tmaso/anaconda3/envs/r-reticulate/Lib/site-packages/numpy
#numpy_version:  1.19.5

#python versions found: 
#  C:/Users/tmaso/anaconda3/envs/r-reticulate/python.exe
#C:/Users/tmaso/anaconda3/python.exe
#C:/Users/tmaso/AppData/Local/Programs/Python/Python39/python.exe


# MAC OSX install ----

library(reticulate)
Sys.which('python')
# "/usr/bin/python" 

py_config()
#python:         /usr/bin/python
#libpython:      /System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config/libpython2.7.dylib
#pythonhome:     /System/Library/Frameworks/Python.framework/Versions/2.7:/System/Library/Frameworks/Python.framework/Versions/2.7
#version:        2.7.16 (default, Jun 18 2021, 03:23:53)  [GCC Apple LLVM 12.0.5 (clang-1205.0.19.59.6) [+internal-os, ptrauth-isa=deploy
#numpy:          /System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python/numpy
#numpy_version:  1.8.0
                                                                                                        
#python versions found: 
#/usr/bin/python3
#/usr/bin/python


# in conda (OSX ONLY)
# conda create -n r-reticulate , then
# /opt/anaconda3/envs/r-reticulate , is the path 

# Tensorflow install----
install.packages("tensorflow")
library(tensorflow)
install_tensorflow(method = 'conda', envname = 'r-reticulate') # version = "gpu" on windows

# then activate conda env ( this was NOT required on Windows)
library(reticulate)
use_condaenv('r-reticulate') # load the env
library(tensorflow) # load tensorflow
tf$constant("Hellow Tensorflow") # check if it works

# check----
library(tensorflow)
tf$constant("Hellow Tensorflow")
# message in red will confirm that cuda packs are readable and GFX card is found + tf.Tensor(b'Hellow Tensorflow', shape=(), dtype=string)

# Keras install----
install.packages("keras")
library(keras)
install_keras()
