library(plyr)
library(stringr)
library(reshape2)

if (file.exists("./UCI HAR Dataset")){
    #Mean and standard variation columns
    colsVector <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)
    myCols <- c(rep("NULL", 561))
    myCols[colsVector] <- "numeric"
    #Loading datasets:
    #ds_features - variable names
    #ds_train - training data set
    #ds_test - test data set
    #ds_subjects_train - subjects who performed the actions in training data set
    #ds_activities_train - list of activities performed by subjects in training data set
    #ds_subjects_test - subjects who performed the actions in test data set
    #ds_activities_test - list of activities performed by subjects in test data set
    #ds_activity_labels - ids and descriptive variable names for both sets
    
    ds_features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE, header=FALSE)
    column_names <-gsub("[(),-]","",ds_features[,2])
   
    ds_train <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors=FALSE, header=FALSE, sep="", numerals ="no.loss", colClasses=myCols, col.names = column_names)
    ds_test <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors=FALSE, header=FALSE, sep="", numerals ="no.loss", colClasses=myCols, col.names = column_names)
    rm(myCols)
    rm(colsVector)
    rm(ds_features)
    
    ds_subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors=FALSE, header=FALSE, sep="")
    ds_subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors=FALSE, header=FALSE, sep="")
    
    ds_activity_labels<- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE, header=FALSE, sep="", col.names=c("id", "activitytype"))
    ds_activity_labels[,2] <- tolower(ds_activity_labels[,2])
    ds_activities_train <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors=FALSE, header=FALSE, sep="", col.names=c("id"))
    ds_activities_test <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors=FALSE, header=FALSE, sep="", col.names=c("id"))
    
    #Adding activities and subjects to train/test data set. 
    ds_train$id <- ds_activities_train$id
    ds_train$subjectid <- ds_subjects_train[,1]
    ds_test$id <- ds_activities_test$id
    ds_test$subjectid <- ds_subjects_test[,1]
    
    #Joining list of activities to main datasets by id to replace with descriptive name, new column is named activitytype
    ds_train <- join(ds_train, ds_activity_labels, by="id", match="all")
    ds_train$id <- NULL
    ds_test <- join(ds_test, ds_activity_labels, by="id", match="all")
    ds_test$id <- NULL
    
    #Removing objects no longer needed
    rm(ds_activity_labels)
    rm(ds_activities_train)
    rm(ds_subjects_train)
    rm(ds_activities_test)
    rm(ds_subjects_test)
    
    #Creates main dataframe with train and test data
    ds_main <- rbind(ds_train, ds_test)
    
    #Removing objects no longer needed
    rm(ds_train)
    rm(ds_test)
    
    #Giving variables descriptive names
    names(ds_main) <- tolower(names(ds_main))
    names(ds_main) <- sub("^t", "time", names(ds_main))
    names(ds_main) <- sub("^f", "frequency", names(ds_main))
    names(ds_main) <- str_replace(names(ds_main),"acc", "accelerometer")
    names(ds_main) <- str_replace(names(ds_main),"gyro", "gyroscope")
    names(ds_main) <- str_replace(names(ds_main),"mag", "magnitude")
    
    #Melting ds_main by subjectid and activitytype, creating variables: signalmeasurement and value
    ds_inter <- melt(ds_main, id = c("subjectid", "activitytype"))
    names(ds_inter)[3] <- "signalmeasurement"
    names(ds_inter)[4] <- "averagevalue"
    ds_inter <- arrange(ds_inter, subjectid, activitytype, signalmeasurement)
    #rm(ds_main)
    
    library(dplyr)
    ds_final <- ddply(ds_inter, .(subjectid, activitytype, signalmeasurement), summarize, mean = mean(averagevalue))
    rm(ds_inter)
    filedirectory <- "Course Project Results"
    if(!(file.exists(filedirectory))){
        dir.create(file.path(getwd(), filedirectory))
    }
    old_wd <- getwd()
    setwd(file.path(getwd(),filedirectory))
    write.table(ds_final, file="DSS_Getdata031_Final_DataSet_Project.txt" , sep="\t", eol = "\n", row.names = FALSE, col.names = TRUE, quote = FALSE)
    setwd(old_wd)
    rm(ds_final)
    
}