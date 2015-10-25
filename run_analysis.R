run_analysis<-function()
{
  
    # Read common data files
    feature_name_data <- read.table("features.txt")
    colnames(feature_name_data)<-c("featureActivityNum","featureActName")
    activity_details_data<-read.table("activity_labels.txt")
    
    # Read test data
    x_test_data <- read.table("test/X_test.txt")
    y_test_data <- read.table("test/Y_test.txt")
    subject_test_data <- read.table("test/subject_test.txt")
    
    # Set col names for test data "x" as feature names 
    colnames(x_test_data)<-feature_name_data[,2]
    colnames(y_test_data)<-"activity_id"
    colnames(subject_test_data)<-"subject_id"
    #Format enumerated activity test data(y_test_data) labeling with actual activity 
    labled_y_test_data<-factor(y_test_data[,1], levels=activity_details_data[,1], labels = activity_details_data[,2])
    labled_y1_testdata=as.data.frame(labled_y_test_data)
    #name column in  labled_y1_testdata as activity id
    colnames(labled_y1_testdata)<-"Activity_Id"
    
    #now merge subject data , formatted activity column, and observation data, forming a tidy set with
    #unique variable per each observation 
    merged_test_data <-cbind(subject_test_data, labled_y1_testdata,x_test_data)


    #Read training data
    x_train_data <- read.table("train/X_train.txt")
    y_train_data <- read.table("train/Y_train.txt")
    subject_train_data <- read.table("train/subject_train.txt")
    
    # Set col names for training data "x" as feature names 
    colnames(x_train_data)<-feature_name_data[,2]
    colnames(y_train_data)<-"activity_id"
    colnames(subject_train_data)<-"subject_id"
    
    #Format enumerated activity test data(y_test_data) labeling with actual activity 
    labled_y_train_data<-factor(y_train_data[,1], levels=activity_details_data[,1], labels = activity_details_data[,2])
    labled_y1_traindata=as.data.frame(labled_y_train_data)
    #name column in  labled_y1_traindata as activity id
    colnames(labled_y1_traindata)<-"Activity_Id"
    #now merge subject data , formatted activity column, and observation data, forming a tidy set with
    #unique variable per each observation 
    merged_train_data <-cbind(subject_train_data, labled_y1_traindata,x_train_data)
    
    #Merge both test and training data set to format a single data set that captures all observation 
    merged_data <- rbind(merged_test_data, merged_train_data)
    
    #As required, generate a tidy data set capturuing mean and std observation per subject
    #and corresponding activity
    colnameinmrgddata<-colnames(merged_data)
    meanstdArray<-grep("\\bmean()\\b|\\bstd()\\b", colnameinmrgddata)
    meanstdArray1<-c(1,2,meanstdArray)
    meanstdmrgddata<-merged_data[,meanstdArray1]
    
    #invoke dplyr library to access required funationlaity 
    library(dplyr)
    #Group tidy data set extracted above capturing meadn and std observations per each subject and activity
    #Then call summarize_each,   to find the mean of each group. As there are 30 subject, with 6 activities, 
    # there will be 180 per each measured feature (with a total of 66). That is final tidy data set constitues
    # 180 rows and 66 avarge observation per grouped as subject and activity
    tidy_ds_aveVarVal<-summarize_each(group_by(meanstdmrgddata, subject_id,Activity_Id), funs(mean))
   
    tidy_ds_aveVarVal
    #write the generated tidy set as a file
    write.table(tidy_ds_aveVarVal, file = "vjtidyset_cleaningDataCourseProj.txt", row.name=FALSE)
    
}
