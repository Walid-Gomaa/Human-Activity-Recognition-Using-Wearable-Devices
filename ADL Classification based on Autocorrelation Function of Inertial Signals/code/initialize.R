# To initialize the activity data.

source('read_data.R');

#####################################################################################

initialize <- function()
{
  # Constructiung the data structures for the activities (their objects) and reading the physical data.
  
  # create and initialize the objects for the activities.
  for(i in 1:NO_OF_ACTIVITIES)
  {
    activities[[i]] <<- new('Activity');
    activities[[i]]@name <<- names(CONFIG)[i];
    fun <- paste0('read_', names(CONFIG)[i]);
    activities[[i]]@data <<- do.call(fun, list());
  }
  
  convert_data_to_time_series();
}

#####################################################################################

convert_data_to_time_series <- function()
{
  # Convert the data into time series objects.
  
  if(length(activities) == 0)
  {
    return();
  }
  
  invisible(lapply(1:NO_OF_ACTIVITIES, FUN = function(i)
    {
      l <- length(activities[[i]]@data); # number of samples in the activity i.
      lapply(1:l, FUN = function(j)
        {
          acc_x <- ts(activities[[i]]@data[[j]]$acc_x, start = 0, frequency = SAMPLING_RATE);
          acc_y <- ts(activities[[i]]@data[[j]]$acc_y, start = 0, frequency = SAMPLING_RATE);
          acc_z <- ts(activities[[i]]@data[[j]]$acc_z, start = 0, frequency = SAMPLING_RATE);
          
          ang_vel_x <- ts(activities[[i]]@data[[j]]$ang_vel_x, start = 0, frequency = SAMPLING_RATE);
          ang_vel_y <- ts(activities[[i]]@data[[j]]$ang_vel_y, start = 0, frequency = SAMPLING_RATE);
          ang_vel_z <- ts(activities[[i]]@data[[j]]$ang_vel_z, start = 0, frequency = SAMPLING_RATE);
          
          # tryCatch(
          #   {
          #     roll <- ts(activities[[i]]@data[[j]]$roll, start = 0, frequency = SAMPLING_RATE);
          #     pitch <- ts(activities[[i]]@data[[j]]$pitch, start = 0, frequency = SAMPLING_RATE);
          #     yaw <- ts(activities[[i]]@data[[j]]$yaw, start = 0, frequency = SAMPLING_RATE);
          #   },
          #   error = function(e){print(paste0('activity: ', as.character(i))); print(paste0('Data sample: ', as.character(j)))},
          #   finally = {}
          # )
                  
          roll <- ts(activities[[i]]@data[[j]]$roll, start = 0, frequency = SAMPLING_RATE);
          pitch <- ts(activities[[i]]@data[[j]]$pitch, start = 0, frequency = SAMPLING_RATE);
          yaw <- ts(activities[[i]]@data[[j]]$yaw, start = 0, frequency = SAMPLING_RATE);
          
          activities[[i]]@data_as_ts[[j]] <<- new('Ts');
          
          activities[[i]]@data_as_ts[[j]]@acc_x <<- acc_x;
          activities[[i]]@data_as_ts[[j]]@acc_y <<- acc_y;
          activities[[i]]@data_as_ts[[j]]@acc_z <<- acc_z;
          
          activities[[i]]@data_as_ts[[j]]@ang_vel_x <<- ang_vel_x;
          activities[[i]]@data_as_ts[[j]]@ang_vel_y <<- ang_vel_y;
          activities[[i]]@data_as_ts[[j]]@ang_vel_z <<- ang_vel_z;
          
          activities[[i]]@data_as_ts[[j]]@roll <<- roll;
          activities[[i]]@data_as_ts[[j]]@pitch <<- pitch;
          activities[[i]]@data_as_ts[[j]]@yaw <<- yaw;
          
          return(NULL);
        })
    }))
}

#####################################################################################