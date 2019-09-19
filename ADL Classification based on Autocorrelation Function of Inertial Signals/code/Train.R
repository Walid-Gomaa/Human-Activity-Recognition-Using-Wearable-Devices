# The training phase.

# Libraries for different machine learning predictive models.
library(e1071);
library(caret);         # The main library for machine learning models. 
library(dplyr);         # Used by caret.
library(pROC);          # For ROC curve (Receiver Operating Charaterisitic).       

# A traick to overcome a warning about class definition of 'train' and confusionMatrix is found in
#  http://stackoverflow.com/questions/12636056/why-sometimes-i-cant-set-a-class-definition-as-slot-in-a-s4-class
setOldClass('train');
setOldClass('confusionMatrix');

# Defining a learning class to hold all the necessary description of a model and testing output.
Learn <- setClass('Learn', 
                  slots = c(trainingset = 'data.frame',
                            testset = 'data.frame',
                            model = 'train', # to hold the predictive model developed by the process of learning.
                            pred_training = 'factor',
                            pred_test = 'factor',
                            eval_training = 'table', # the cofusion matrix for evaluating the model on the training data.
                            eval_test = 'table', # the confusion matrix for evaluating the model on a test data.
                            precision_training = 'vector',
                            precision_test = 'vector',
                            conf_matrix_training = 'confusionMatrix', # confusion matrix for predictive power over the training set.
                            conf_matrix_testing = 'confusionMatrix' # confusion matrix for predictive power over the testing set.
                            ));

######################################################################################


prepare_training_data <- function()
{
  # The function returns a data frame containing all the training data.
  
  training_data <- data.frame();
  
  invisible(lapply(1:NO_OF_ACTIVITIES, FUN = function(i)
    {
      if(CONFIG[[i]])
      {
        training_data <<- rbind(training_data, activities[[i]]@data_fspace); 
      }
      return(NULL);
    }))
  
  training_data <- training_data[sample(nrow(training_data), replace = FALSE),]; # randomly permute the training data.
  
  return(training_data);
}

######################################################################################


train_and_test <- function(data, ratio_of_test = 0.35)
{
  # This is the basic function for training and testing.
  # data: the available data both for training and testing. It is a 'data.frame'.
  # ration_of_test: the ratio  of the data to be excluded in training for afterwards testing purposes.
  # The function would return a 'Learn' object that contains all the necessary information relating to the learning model,
  # training and evaluation results.

  L <- new('Learn'); # construct the learning object.
  cl <- unique(data$activity); # Getting the unique activity labels.
  K <- length(cl); # the number of classes.
  sizes <- vector(length = K); # the sizes of individual categories.
  test_index <- list();
  testset <- data.frame();
  
  lapply(1:K, FUN = function(i)
    { # extract testing samples for each activity i.
      sizes[i] <<- sum(data$activity == cl[i]); # Number of training samples for each class.
      test_index[[i]] <<- sample(which(data$activity == cl[i]), trunc(ratio_of_test * sizes[i]), replace = FALSE); # randomaly select the indices of the samples for the test set.
      testset <<- rbind(testset, data[test_index[[i]],]); # retrieve the corresponding test samples.
      
      return(NULL);
    })
  
  # Final steps to construct the test set.
  test_index_total <- unlist(test_index);
  testset <- testset[sample(1:nrow(testset)),] # random permutation of the test set.
  
  # Construct the training set.
  trainingset <- data[-test_index_total,]; # the complement of the test indices.
  trainingset <- trainingset[sample(nrow(trainingset)),] # random permutation of the training set.
  
  # The training process.
  set.seed(as.numeric(Sys.time())); # setting the random seed.
  # Setting the configuration for the training process.
  ctrl <- trainControl(method="repeatedcv",   # repeated cross validation.
                       number = 5,            # do 5-fold cross validation.
                       repeats = 5,		    # do 5 repititions of cross validation.
                       summaryFunction = defaultSummary,	# for computing metrics accross resamples.
                       classProbs = TRUE,      # compute class probabilities in addition to predicted values.
                       allowParallel = TRUE);      # Use parallel processing if available.
  # Now perform the training process itself.
  model <- train(x = trainingset[,-ncol(trainingset)], # the features/predictors.
                    y = trainingset$activity,  # the response value.
                    method = "rf",  # using random forest.
                    tuneLength = 9,					# 9 values of the cost function
                    #preProcess = c("center","scale"),  # Center and scale data for preprocessing.
                    trControl = ctrl);   # specifying how the training is controlled.
  pred_training <- predict(model, trainingset[,-ncol(trainingset)]); # Test the learnined model on the training set.
  pred_test <- predict(model, testset[,-ncol(testset)]); # Test the learned model on the test test.
  
  # Setting the field of the Learn object.
  L@trainingset <- trainingset;
  L@testset <- testset;
  L@model <- model;
  L@pred_training <- pred_training;
  L@pred_test <- pred_test;
  L@eval_training <- table(pred = pred_training, true = trainingset[,ncol(trainingset)]); # Evaluation on the predictive capability on the training set.
  L@eval_test <- table(pred = pred_test, true = testset[,ncol(testset)]); # Evaluation on the predictive capability on the test set.
  
  # The following is to handle the case of missing categories in the predicted classes.
  # From: http://stackoverflow.com/questions/19871043/r-package-caret-confusionmatrix-with-missing-categories
  u <- union(pred_test, testset[,ncol(testset)]);
  t = table(factor(pred_test, u), factor(testset[,ncol(testset)], u));
  L@conf_matrix_training <- confusionMatrix(L@eval_training); # derive the confusion matrix for testing over the training set.
  L@conf_matrix_testing <- confusionMatrix(t);
  
  # The next piece of code is just to change the order of labels in the confusion matrix.
  # activity.names <- c('brush_teeth', 'climb_stairs', 'comb_hair', 'drink_glass', 'getup_bed', 'sitdown_chair', 'use_telephone', 'pour_water', 'eat_meat', 'walk', 'liedown_bed', 'standup_chair', 'descend_stairs');
  # mm <- matrix(nrow = length(activity.names), ncol = length(activity.names));
  # rownames(mm) <- activity.names;
  # colnames(mm) <- activity.names;
  # tt <- as.table(mm);
  # for(i in 1:length(activity.names))
  # {
  #   for(j in 1:length(activity.names))
  #   {
  #     tt[activity.names[i],activity.names[j]] <- t[activity.names[i],activity.names[j]];
  #   }
  # }
  # t <- tt;
  # 
  # L@conf_matrix <- confusionMatrix(t);

  
  return(L);
}

#################################################################################################################


