title: run_analysis.R
author: kzabril
date: August 20, 2015

##Project Description
The script generates a tidy dataset starting from a database generated from the recordings of 30 subjects performing different activities while carrying a waist-mounted Samsung Galaxy S II. The raw data consists of different datasets in txt format that needed to be loaded and transformed using R language to accomplish the following tasks:  

1.  Merge different datasets to create one data set.
2.  Extract only the measurements on the mean and standard deviation for each measurement. 
3.  Use descriptive activity names to name the activities in the dataset.
4.  Appropriately labels the dataset with descriptive variable names. 
5.  From the dataset in step 4, create a second, independent tidy dataset with the average of each variable for each activity and each subject.
6.  The resulting tidy dataset is saved as a text file.  

Refer to the project's [codebook]() document for complete details on the raw data and variables used in the project.

##Downloading
The run\_analysis.R script can be found on the following GitHub repository: [kzabril](https://github.com/kzabril/GettingCleaningData\_CourseProject).

##Documentation
The documentation available for this project is included in markdown (md) format in the following GitHub repository:[kzabril](https://github.com/kzabril/GettingCleaningData\_CourseProject).

##Description of the code
The run_analysis.R script verifies if the folder *UCI HAR Dataset* containing the datasets exists in the working directory. If false, then execution stops.

        if (file.exists("./UCI HAR Dataset")){
        
A vector that holds the index of the subsetted variables to include in the analysis is created:  

        colsVector <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,
        202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,
        516,517,529,530,542,543)  

The X\_train.txt, X\_test.txt, y\_train.txt, y\_test.txt, subject\_train.txt, subject\_test.txt, activity\_labels.txt, features.txt datasets are loaded into R and the generated objects are disposed with rm function as soon as they are no longer needed.
The following objects are created:

        #ds_features - dataset with variable names
        #ds_train - dataset with training data
        #ds_test - dataset with test data
        #ds_subjects_train - dataset with subjects who performed the actions in training dataset
        #ds_activities_train - dataset with list of activities performed by subjects in training dataset
        #ds_subjects_test - dataset of subjects who performed the actions in test dataset
        #ds_activities_test - dataset with list of activities performed by subjects in test dataset
        #ds_activity_labels - dataset with ids and descriptive variable names for both train and test sets  
        
        ds_features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE, header=FALSE)
        ds_train <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE, header=FALSE, sep="", 
         numerals ="no.loss", colClasses=myCols, col.names = column_names)
        ds_test <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE, header=FALSE, sep="", numerals ="no.loss", 
         colClasses=myCols, col.names = column_names)
        ds_subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE, header=FALSE, sep="")
        ds_subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE, header=FALSE, sep="")
        ds_activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE, header=FALSE, sep="", 
         col.names=c("id", "activitytype"))
        ds_activities\_train<- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors=FALSE, header=FALSE, sep="", col.names=c("id"))
        ds_activities\_test <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors=FALSE, header=FALSE, sep="", col.names=c("id"))  

Performed activities and subjects are merged into ds\_train and ds\_test datasets by creating 2 additional columns: id to denote the activity performed and subjectid to indicate which subject performed the activity.

        ds_train$id <- ds_activities_train$id
        ds_train$subjectid <- ds_subjects_train[,1]
        ds_test$id <- ds_activities_test$id
        ds_test$subjectid <- ds_subjects_test[,1]  

The list of activities are joined to the main datasets by id to replace with descriptive name, new column is named activitytype. Id columns are dropped.  
 
        ds_train <- join(ds_train, ds_activity_labels, by="id", match="all")
        ds_train$id <- NULL
        ds_test <- join(ds_test, ds_activity_labels, by="id", match="all")
        ds_test$id <- NULL  

Datasets ds\_test and ds\_train are merged into ds_main: 

        ds_main <- rbind(ds_train, ds_test)  
        
Next, variable names are cleaned up and replaced by more descriptive names: text is converted to lower case, prefix "t"" is replaced with "time", prefix "f" is replaced with "frequency", "acc" is replaced with "accelerometer", "gyro" is replaced with "gyroscope", "mag" is replaced with magnitude.  

        names(ds_main) <- tolower(names(ds_main))  
        names(ds_main) <- sub("^t", "time", names(ds_main))  
        names(ds_main) <- sub("^f", "frequency", names(ds_main))  
        names(ds_main) <- str_replace(names(ds_main),"acc", "accelerometer")  
        names(ds_main) <- str_replace(names(ds_main),"gyro", "gyroscope")  
        names(ds_main) <- str_replace(names(ds_main),"mag", "magnitude")  
        
Melting ds_main by subjectid and activitytype, creates new variables: signalmeasurement and averagevalue. 

        ds_inter <- melt(ds_main, id = c("subjectid", "activitytype"))  
        
The final tidy dataset is generated and the average of each measurement for each activity and each subject is calculated.  

        ds_final <- ddply(ds_inter, .(subjectid, activitytype, measurement), summarize, mean = mean(value))  
        
The dataset is saved to the file directory as DSS\_Getdata031\_Final\_DataSet\_Project.txt into folder "Course Project Results":  

        write.table(ds_final, file="DSS_Getdata031_Final_DataSet_Project.txt" , sep="\t", eol = "\n", row.names = FALSE, col.names = TRUE, quote = FALSE)  
        
##Requirements
The following requirements need to be met for the script to successfuly generate the tidy dataset file:

*   The compressed file with the raw data must be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
*   The compressed file must be decompressed into the current working directory and the directory structure of the downloaded files needs to be maintained. Example: *UCI HAR Dataset/train*, *UCI HAR Dataset/test*.
*   Packages dplyr, stringr, reshape2 are installed.
*   The script must be downladed from the [Github respository]((https://github.com/kzabril/GettingCleaningData\_CourseProject).
*   The script must be executed by a user with enough permissions to write to the file system.

##Execution
Execute script run_analysis.R in R.

##Help and Troubleshooting
If the file is not being generated, review the directory structure and permissions. Refer to section Requirements on this document.


