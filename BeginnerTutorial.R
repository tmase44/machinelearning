# Tutorial----
  # https://tensorflow.rstudio.com/tutorials/

# Quickstart----
  # https://tensorflow.rstudio.com/tutorials/beginners/
#load packages
library(tensorflow)
library(keras)

# Demo----
# MNIST dataset
# The values of thee pixels are integers between 0 and 255 
  # and we will convert them to floats between 0 and 1.
mnist <- dataset_mnist()
mnist$train$x <- mnist$train$x/255
mnist$test$x <- mnist$test$x/255

model <- keras_model_sequential() %>% 
  layer_flatten(input_shape = c(28, 28)) %>% 
  layer_dense(units = 128, activation = "relu") %>% 
  layer_dropout(0.2) %>% 
  layer_dense(10, activation = "softmax")
# when using the Sequential API the first layer must specify the 
  # input_shape argument which represents the dimensions of the input. 
    # In our case, images 28x28.
# After definning the model, you can see information about layers, 
  # number of parameters, etc with the summary function:
summary(model)

# The next step after buildinng the model is to compile it. 
  # It’s at compile time that we define what loss will be optimized and what 
  # optimizer will be used. 
    # You can also specify metrics, callbacks and etc that are meant to be 
      #run during the model fitting.

# Compiling is done with the compile function:
model %>% 
  compile(
    loss = "sparse_categorical_crossentropy",
    optimizer = "adam",
    metrics = "accuracy"
  )

# Now let’s fit our model:
model %>% 
  fit(
    x = mnist$train$x, y = mnist$train$y,
    epochs = 5,
    validation_split = 0.3,
    verbose = 2
  )

# we can now make predictions with predict func.
predictions <- predict(model, mnist$test$x)
head(predictions, 2)

# I can access the model performance on a different dataset using the evaluate function
model %>% 
  evaluate(mnist$test$x, mnist$test$y, verbose = 0)
# Our model achieved ~90% accuracy on the test set.

# Unlike models built with the lm function, 
  # to save Keras models for later prediction, 
  # you need to use specialized functions, like save_model_tf:

save_model_tf(object = model, filepath = "model")

# You can then reload the model and make predictions with:

reloaded_model <- load_model_tf("model")
all.equal(predict(model, mnist$test$x), predict(reloaded_model, mnist$test$x))
