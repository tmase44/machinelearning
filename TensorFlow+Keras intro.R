# installation ----
# create env in Anaconda navigator to be safe
install.packages("tensorflow")
library(tensorflow)
install_tensorflow("auto") # this will prompt miniconda installation
                            # new env can be seen in Anaconda Navigator
# check----
library(tensorflow)
tf$constant("Hellow Tensorflow")
# message in red + tf.Tensor(b'Hellow Tensorflow', shape=(), dtype=string)
# Keras----
install.packages("keras")

