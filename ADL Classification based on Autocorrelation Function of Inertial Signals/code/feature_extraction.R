# All preprocessing and feature extraction.



##################################################################################

extract_features <- function(lag)
{
  # To extract features for all activities based on the autocorrelation function.
  # lag: the maximum lag for the autocorrelation function.
  
  
  lapply(1:NO_OF_ACTIVITIES, FUN = function(i)
    {
      prepare_data_frame_for_activity(i, lag);
      print(paste0('Extract features for activity: ', names(CONFIG)[i]));
      extract_features_for_activity(i, lag);
      
      return(NULL);
    })
}

##################################################################################


prepare_data_frame_for_activity <- function(a, lag)
{
  # The function constructs the data frame for activity a.
  # a: the activity index.
  # lag: the maximum lag for the autocorrelation function.
  
  cols <- 9 * (lag + 1) + 1; # 9 is the triaxail acceleration directions in addition to the three angular velocities, 
                              # in addition to the three orientations.
                             #lag + 1 is the size of the autocorrelation function where the first element 
                             # is the variance, the last 1 is the activity itself (the ground truth).
  
  
  names_acc_x <- unlist(lapply(0:lag, FUN = function(i)
    {
      return(paste0('acf_x_', as.character(i), '_acc'));
    }));

  names_acc_y <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_y_', as.character(i), '_acc'));
  }));

  names_acc_z <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_z_', as.character(i), '_acc'));
  }));
  
  names_ang_vel_x <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_x_', as.character(i), '_ang_vel'));
  }));
  
  names_ang_vel_y <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_y_', as.character(i), '_ang_vel'));
  }));
  
  names_ang_vel_z <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_z_', as.character(i), '_ang_vel'));
  }));
  
  names_roll <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_x_', as.character(i), '_roll'));
  }));
  
  names_pitch <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_y_', as.character(i), '_pitch'));
  }));
  
  names_yaw <- unlist(lapply(0:lag, FUN = function(i)
  {
    return(paste0('acf_z_', as.character(i), '_yaw'));
  }));
  
  
  
  
  
  names_all <- c(names_acc_x, names_acc_y, names_acc_z, names_ang_vel_x, names_ang_vel_y, names_ang_vel_z, names_roll, names_pitch, names_yaw, 'activity');
  ma <- matrix(ncol = length(names_all));
  colnames(ma) <- names_all;
  activities[[a]]@data_fspace <<- as.data.frame(ma);
}

##################################################################################


extract_features_for_activity <- function(a, lag)
{
  # To extract features for the given activity a.
  # a: the activity index.
  # lag: the maximum lag for the autocorrelation function.
  
  lapply(1:length(activities[[a]]@data_as_ts), FUN = function(j)
  {
    acf_acc_x <- acf(activities[[a]]@data_as_ts[[j]]@acc_x, lag.max = lag, plot = F);
    acf_acc_y <- acf(activities[[a]]@data_as_ts[[j]]@acc_y, lag.max = lag, plot = F);
    acf_acc_z <- acf(activities[[a]]@data_as_ts[[j]]@acc_z, lag.max = lag, plot = F);
    
    acf_ang_vel_x <- acf(activities[[a]]@data_as_ts[[j]]@ang_vel_x, lag.max = lag, plot = F);
    acf_ang_vel_y <- acf(activities[[a]]@data_as_ts[[j]]@ang_vel_y, lag.max = lag, plot = F);
    acf_ang_vel_z <- acf(activities[[a]]@data_as_ts[[j]]@ang_vel_z, lag.max = lag, plot = F);
    
    acf_roll <- acf(activities[[a]]@data_as_ts[[j]]@roll, lag.max = lag, plot = F);
    acf_pitch <- acf(activities[[a]]@data_as_ts[[j]]@pitch, lag.max = lag, plot = F);
    acf_yaw <- acf(activities[[a]]@data_as_ts[[j]]@yaw, lag.max = lag, plot = F);
    
    acf_all <- c(acf_acc_x$acf, acf_acc_y$acf, acf_acc_z$acf, acf_ang_vel_x$acf, acf_ang_vel_y$acf, acf_ang_vel_z$acf, acf_roll$acf, acf_pitch$acf, acf_yaw$acf);
    activities[[a]]@data_fspace[j,-ncol(activities[[a]]@data_fspace)] <<- acf_all;
    activities[[a]]@data_fspace[j,'activity'] <<- names(CONFIG)[a];
    
    return(NULL);
  })
  
}

##################################################################################