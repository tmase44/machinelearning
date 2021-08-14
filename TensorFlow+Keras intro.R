# installation ----
# create env and make asure it is python----
#
library(reticulate)
#
Sys.which('python')
# should be "C:\\Users\\tmaso\\ANACON~1\\envs\\R-RETI~1\\python.exe"----

py_config()
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

# tensorflow keras install
install.packages("tensorflow")
library(tensorflow)
install_tensorflow(version = "gpu") # 

# check----
library(tensorflow)
tf$constant("Hellow Tensorflow")
# message in red will confirm that cuda packs are readable and GFX card is found + tf.Tensor(b'Hellow Tensorflow', shape=(), dtype=string)
# Keras----
install.packages("keras")

