# To define the main constants. 
#To read the data files of the activities.

NO_OF_ACTIVITIES <- 14;
DATA_PATH <- '../active data';
SAMPLING_RATE <- 50; # the sampling rate of the collected time signals.

CONFIG <- list();

CONFIG[['brush_teeth']] <- TRUE;
CONFIG[['climb_stairs']] <- TRUE;
CONFIG[['comb_hair']] <- TRUE;
CONFIG[['descend_stairs']] <- TRUE;
CONFIG[['drink_from_glass']] <- TRUE;
CONFIG[['eat_with_fork_and_knife']] <- TRUE;
CONFIG[['eat_with_spoon']] <- TRUE;
CONFIG[['getup_from_bed']] <- TRUE;
CONFIG[['liedown_on_bed']] <- TRUE;
CONFIG[['pour_water_into_glass']] <- TRUE;
CONFIG[['sitdown_on_chair']] <- TRUE;
CONFIG[['standup_from_chair']] <- TRUE;
CONFIG[['use_telephone']] <- TRUE;
CONFIG[['walk']] <- TRUE;


##################################################################################################

Ts <- setClass('Ts', # Class definition of for the time series for the triaxial acceleration.
               slots = c(
                 acc_x = 'ts', # time series for the x-direction.
                 acc_y = 'ts', # time series for the y-direction.
                 acc_z = 'ts', # time series for the z-direction.
                 ang_vel_x = 'ts', # time series for the angular velocity in the x-direction.
                 ang_vel_y = 'ts', # time series for the angular velocity in the y-direction.
                 ang_vel_z = 'ts', # time series for the angular velocity in the z-direction.
                 roll = 'ts', # time series for the roll.
                 pitch = 'ts', # time series for the pitch.
                 yaw = 'ts' # time series for the yaw.
               ))

Activity <- setClass('Activity', 
                     slots = c(
                       name = 'character', # the name of the underlying activity.
                       data = 'list', # the raw data collected for this activity; each element is a time series of triaxial 
                                      # acceleration data represented by a data frame.
                       data_as_ts = 'list', # data as a list of time series objects.
                       data_fspace = 'data.frame' # the feature space.
                     ));


# activities <- list(); # A global variable to hold the activities objects.


#####################################################################################

read_brush_teeth <- function()
{
  # To read the activity of 'brush_teeth'
  # The function returns a list of time series of the activity 'brush_teeth', each time series is represented by a data frame.

  path_acc <- paste0(DATA_PATH, '/', 'brush_teeth/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'brush_teeth/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'brush_teeth/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: brush teeth');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])),  read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}
#####################################################################################

read_climb_stairs <- function()
{
  # To read the activity of 'climb_stairs'
  # The function returns a list of time series of the activity 'climb_stairs', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'climb_stairs/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'climb_stairs/angular_velocity');
  files_avel <- list.files(path_avel);

  path_rot <- paste0(DATA_PATH, '/', 'climb_stairs/rotation');
  files_rot <- list.files(path_rot);
    
  data <- list();
  
  print('Reading activity: climb stairs');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
  
}

#####################################################################################

read_comb_hair <- function()
{
  # To read the activity of 'comb_hair'
  # The function returns a list of time series of the activity 'comb_hair', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'comb_hair/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'comb_hair/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'comb_hair/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: comb hair');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_descend_stairs <- function()
{
  # To read the activity of 'descend_stairs'
  # The function returns a list of time series of the activity 'descend_stairs', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'descend_stairs/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'descend_stairs/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'descend_stairs/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: descend stairs');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}


#####################################################################################

read_drink_from_glass <- function()
{
  # To read the activity of 'drink_from_glass'
  # The function returns a list of time series of the activity 'drink_from_glass', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'drink_from_glass/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'drink_from_glass/angular_velocity');
  files_avel <- list.files(path_avel);

  path_rot <- paste0(DATA_PATH, '/', 'drink_from_glass/rotation');
  files_rot <- list.files(path_rot);
  
    
  data <- list();
  
  print('Reading activity: drink from glass');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_eat_with_fork_and_knife <- function()
{
  # To read the activity of 'eat_with_fork_and_knife'
  # The function returns a list of time series of the activity 'eat_with_fork_and_knife', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'eat_with_fork_and_knife/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'eat_with_fork_and_knife/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'eat_with_fork_and_knife/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: eat with fork and knife');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}


#####################################################################################

read_eat_with_spoon <- function()
{
  # To read the activity of 'eat_with_spoon'
  # The function returns a list of time series of the activity 'eat_with_spoon', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'eat_with_spoon/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'eat_with_spoon/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'eat_with_spoon/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: eat with spoon');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}


#####################################################################################

read_getup_from_bed <- function()
{
  # To read the activity of 'getup_from_bed'
  # The function returns a list of time series of the activity 'getup_from_bed', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'getup_from_bed/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'getup_from_bed/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'getup_from_bed/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: getup from bed');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_liedown_on_bed <- function()
{
  # To read the activity of 'liedown_on_bed'
  # The function returns a list of time series of the activity 'liedown_on_bed', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'liedown_on_bed/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'liedown_on_bed/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'liedown_on_bed/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: liedown on bed');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_pour_water_into_glass <- function()
{
  # To read the activity of 'pour_water_into_glass'
  # The function returns a list of time series of the activity 'pour_water_into_glass', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'pour_water_into_glass/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'pour_water_into_glass/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'pour_water_into_glass/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: pour water into glass');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_sitdown_on_chair <- function()
{
  # To read the activity of 'sitdown_on_chair'
  # The function returns a list of time series of the activity 'sitdown_on_chair', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'sitdown_on_chair/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'sitdown_on_chair/angular_velocity');
  files_avel <- list.files(path_avel);

  path_rot <- paste0(DATA_PATH, '/', 'sitdown_on_chair/rotation');
  files_rot <- list.files(path_rot);
    
  data <- list();
  
  print('Reading activity: sitdown on chair');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);}

#####################################################################################

read_standup_from_chair <- function()
{
  # To read the activity of 'standup_from_chair'
  # The function returns a list of time series of the activity 'standup_from_chair', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'standup_from_chair/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'standup_from_chair/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'standup_from_chair/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: standup from chair');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_use_telephone <- function()
{
  # To read the activity of 'use_telephone'
  # The function returns a list of time series of the activity 'use_telephone', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'use_telephone/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'use_telephone/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'use_telephone/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: use telephone');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################

read_walk <- function()
{
  # To read the activity of 'walk'
  # The function returns a list of time series of the activity 'walk', each time series is represented by a data frame.
  
  path_acc <- paste0(DATA_PATH, '/', 'walk/acceleration');
  files_acc <- list.files(path_acc);
  N <- length(files_acc);
  
  path_avel <- paste0(DATA_PATH, '/', 'walk/angular_velocity');
  files_avel <- list.files(path_avel);
  
  path_rot <- paste0(DATA_PATH, '/', 'walk/rotation');
  files_rot <- list.files(path_rot);
  
  data <- list();
  
  print('Reading activity: walk');
  for(i in seq(1,N))
  {
    data[[i]] <- cbind(read.csv(paste0(path_acc, '/', files_acc[i])), read.csv(paste0(path_avel, '/', files_avel[i])), read.csv(paste0(path_rot, '/', files_rot[i])));
  }
  
  return(data);
}

#####################################################################################
