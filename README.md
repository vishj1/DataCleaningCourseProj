# DataCleaningCourseProj
Data Cleaning course  project
This explains how the run analysis code works. 
The run_analyssis functionality is orgnanized as the following sections
Reading the input test data:
   Test data is successfully read using read_table.
   Colummn names of x_data_set are set with feature names, as they represent each feature function the executed during test.
Cleaning the test data:
   Test data  activity data set (y_test_data) is formatted with enumerated activity name for each enumerated activity, using factor R-function, showing functiona of each avtivity
   Subjects participated in the test data , are formated as separate data set. 
   After naming subject and activity name sets as expected, cbind function is used to merge x_data_set with activity(ye_data_set) and subject data set.

Similar processing is done for training data as well.
Training  data is successfully read using read_table.
   Colummn names of x_data_set are set with feature names, as they represent each feature function the executed during test.
   Training data  activity data set (y_test_data) is formatted with enumerated activity name for each enumerated activity, using factor R-function, showing functiona of each avtivity
   Subjects participated in the traing  data , are formated as separate data set. 
   After naming subject and activity name sets as expected, cbind function is used to merge x_data_set with activity(ye_data_set) and subject data set.
  
 Mergeing data sets: 
   Both traning and test data sets are then combied using rbind to generate a single tidy data set.
   
Extracting mean or std feature observation
   As required extracting mean,std feature observation from the merged data set capturuing mean and std observation per subject and corresponding activity
   
Summarizing the required data set:
   Using dplyr library to access required funationlaity, Group tidy data set extracted above capturing meadn and std observations per each subject and activity. Then call summarize_each,   to find the mean of each group. As there are 30 subject, with 6 activities, there will be 180 per each measured feature (with a total of 66). That is final tidy data set constitues 180 rows and 66 avarge observation per grouped as subject and activity
   
