source('feature_extraction.R');
source('read_data.R');
source('initialize.R');
source('train.R');

########################################################################################


library(gridExtra);
library(grid);

########################################################################################

c <- readline('Initialize (y/n)? '); # to read the raw data and pre-process it including converting into real g-force values.
c <- as.character(c);
if(c == 'y')
{ # activities has not yet been initialized.
  activities <- list();
  initialize();
}

c <- readline('Do you want to transform data into feature space (y/n)? ');
c <- as.character(c)
if(c == 'y')
{
  lag <- readline('Enter the lag for computing the autocorrelation function: ');
  lag <- as.integer(lag);
  extract_features(lag);
}

########################################################################################

c <- readline('Do you want to perform train&test (y/n)? ');
c <- as.character(c);
if(c == 'y')
{
  training_data <- prepare_training_data();
  L <- train_and_test(training_data);
  
  # Saving the model.
  saveRDS(L@model, file = 'results/model.rds');
  sink('results/model.txt');
  print(L@model);
  sink();
  
  # Saving the confusion matrix.
  pdf("results/confusion_matrix_testing.pdf", height=11, width=20)
  grid.table(L@conf_matrix_testing$table);
  dev.off();
  
  # Saving the performance indices.
  sink('results/metrics.txt');
  print(L@conf_matrix_testing);
  sink();
}

########################################################################################