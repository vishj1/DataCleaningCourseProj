The run_analyssis function uses the following data set variable and  functionality

feature_name_data :
   Contain list of feature Activity names. Each feature is undertaken by the subject while performing a specific activity in activity_details_data. feature_name_data is extracted reading from "features.txt" using read_table function. There are 561 features present.
activity_details_data:
   Contain list of activities that the subject performs while feature observation is taken. This is extracted reading from "activity_labels.txt" using read_table function. There are 6 activities present.
x_test_data:
   Contain test subject feature obsertvation value for activities enumerated in y_test_data. This is extracted reading from "test/X_test.txt" using read_table function.
y_test_data :
  Contain test subject activities (enumerated), for test subjects listed in subject_test_data. This is extracted reading from "test/Y_test.txt" using read_table function
  
subject_test_data:
  Contain list of subject on whome feature observation, listed in x_test_data, is taken place while performing activities listed in y_test_data. This is extracted reading from "test/subject_test.txt" using read_table function.
  
x_train_data:
   Contain train subject feature obsertvation value for activities enumerated in y_test_data. This is extracted reading from "train/X_train.txt" using read_table function.
y_train_data :
  Contain train subject activities (enumerated), for train subjects listed in subject_train_data. his is extracted reading from "test/Y_train.txt" using read_table function
  
subject_train_data:
  Contain list of subject on whome feature observation, listed in x_train_data, is taken place while performing activities listed in y_train_data.This is extracted reading from "train/subject_train.txt" using read_table function.


Colummn names of x_data_set are set with feature names, as they represent each feature function the executed during test. 

Cleaning the test data: 
labled_y_test_data:
   Test data activity data set (y_test_data) is formatted with enumerated activity name for each enumerated activity, using factor R-function, showing labeled functions of each activity Subjects participated in the test data , are formated as separate data set. 
After naming subject and activity name sets as expected, cbind function is used to merge x_data_set with activity(ye_data_set) and subject data set.

Similar processing is done for training data as well. Colummn names of x_data_set are set with feature names, as they represent each feature function the executed during test. 

labled_y_train_data:
    Training data activity data set (y_train_data) is formatted with enumerated activity name for each enumerated activity, using factor R-function, showing labeled function of each avtivity Subjects participated in the traing data , are formated as separate data set. After naming subject and activity name sets as expected, cbind function is used to merge x_data_set with activity(ye_data_set) and subject data set.

merged_data:
Merging data sets: Both traning and test data sets are then combied using rbind to generate a single tidy data set.

colnameinmrgddata:
Column names from merged data set, for further processing

meanstdArray:
With colnameinmrgddata  mean or std feature observation are extracted,  from the merged data set capturuing mean and std observation per subject and corresponding activity

meanstdArray1:
Array that lists list mean or std feature columns , with 1st 2 colums incorporating subject and activity row numbers

meanstdmrgddata:
Data set that includes desired mean or std feature observation for each subjecta nd corresponding labeled activity 

tidy_ds_aveVarVal:
Required tidy data set after summarizing. Using dplyr library to access required funationlaity, Group tidy data set extracted above capturing mean or std observations per each subject and activity. Then call summarize_each, to find the mean of each group. As there are 30 subject, with 6 activities, there will be 180 per each measured feature (with a total of 66). That is final tidy data set constitues 180 rows and 66 avarge observation per grouped as subject and activity

