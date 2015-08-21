---
title: Data Science Specialization - Getting and Cleaning Data - Course Project Codebook  
author: kzabril  
date: August 19, 2015  
---

## Project Description
The intention of the project is to use the knowledge obtained throughout the course to collect, analyse, transform, and clean data. The goal is to generate a tidy dataset saved as a text file for later analysis. The resulting dataset is tidy according to the lectures and documentation explored during the course and displays the average of a set of variables. Another goal of the project is learning to create a codebook and a readme file.

##Study design and data processing

###Collection of the raw data
The data was obtained from the Machine Learning Repository of UC Irvine and it contains human activity measurements reported by test subjects wearing a waist-mounted smartphone, especifically a Samsung Galaxy S II, while performing different activities.
The dataset consists of measurements obtained by the accelerometer and gyroscope embedded in the smartphone, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
The test subjects were 30 volunteers, from 19 to 48 years of age. The activities performed were: standing, walking upstairs, walking downstairs, sitting, standing and laying. 
The dataset has been randomly partitioned into 2 sets, where 70% of the subjects were selected for the training data and 30% for the test data. For this project, both test and train datasets were merged into one for manipulation and cleaning.

For each record it is provided:

*   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
*   Triaxial Angular velocity from the gyroscope. 
*   A 561-feature vector with time and frequency domain variables. 
*   Its activity label. 
*   An identifier of the subject who carried out the experiment.

For this project, the following variables were subsetted and used in the creation of the tidy data set. These variable names were obtained from file features.txt:

        tBodyAcc-mean()-X
        tBodyAcc-mean()-Y
        tBodyAcc-mean()-Z
        tBodyAcc-std()-X
        tBodyAcc-std()-Y
        tBodyAcc-std()-Z
        tGravityAcc-mean()-X
        tGravityAcc-mean()-Y
        tGravityAcc-mean()-Z
        tGravityAcc-std()-X
        tGravityAcc-std()-Y
        tGravityAcc-std()-Z
        tBodyAccJerk-mean()-X
        tBodyAccJerk-mean()-Y
        tBodyAccJerk-mean()-Z
        tBodyAccJerk-std()-X
        tBodyAccJerk-std()-Y
        tBodyAccJerk-std()-Z
        tBodyGyro-mean()-X
        tBodyGyro-mean()-Y
        tBodyGyro-mean()-Z
        tBodyGyro-std()-X
        tBodyGyro-std()-Y
        tBodyGyro-std()-Z
        tBodyGyroJerk-mean()-X
        tBodyGyroJerk-mean()-Y
        tBodyGyroJerk-mean()-Z
        tBodyGyroJerk-std()-X
        tBodyGyroJerk-std()-Y
        tBodyGyroJerk-std()-Z
        tBodyAccMag-mean()
        tBodyAccMag-std()
        tGravityAccMag-mean()
        tGravityAccMag-std()
        tBodyAccJerkMag-mean()
        tBodyAccJerkMag-std()
        tBodyGyroMag-mean()
        tBodyGyroMag-std()
        tBodyGyroJerkMag-mean()
        tBodyGyroJerkMag-std()
        fBodyAcc-mean()-X
        fBodyAcc-mean()-Y
        fBodyAcc-mean()-Z
        fBodyAcc-std()-X
        fBodyAcc-std()-Y
        fBodyAcc-std()-Z
        fBodyAccJerk-mean()-X
        fBodyAccJerk-mean()-Y
        fBodyAccJerk-mean()-Z
        fBodyAccJerk-std()-X
        fBodyAccJerk-std()-Y
        fBodyAccJerk-std()-Z
        fBodyGyro-mean()-X
        fBodyGyro-mean()-Y
        fBodyGyro-mean()-Z
        fBodyGyro-std()-X
        fBodyGyro-std()-Y
        fBodyGyro-std()-Z
        fBodyAccMag-mean()
        fBodyAccMag-std()
        fBodyBodyAccJerkMag-mean()
        fBodyBodyAccJerkMag-std()
        fBodyBodyGyroMag-mean()
        fBodyBodyGyroMag-std()
        fBodyBodyGyroJerkMag-mean()
        fBodyBodyGyroJerkMag-std()

For each signal and signals resulting from the transformations stated above, the mean and standard deviation were estimated. Other measurements like meanFreq(): weighted average; and measurements on angles(): angles between vectors; were not included in the subset.
The variables were selected to fulfil one of the requirements of the project: "Extracts only the measurements on the mean and standard deviation for each measurement". Based on the features_info.txt file, variables related to the mean and standar deviation are indicated by the suffixes mean() and std().

Other variables included:
The id of the subject performing the activity - from subject\_<test|train>.txt
The id of the activity performed - from file y\_test.txt
The label of the activity performed - from file activity_labels.txt

[Machine Learning Repository of UC Irvine](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Notes on the original (raw) data 
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

##Creating the tidy datafile

###Guide to create the tidy data file
1.  Download dataset from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2.  Decompress the file into the working directory, maintaining the supplied directory structure.
3.  The resulting directory UCI HAR Dataset has 2 subdirectories: test and train.
4.  Each subdirectory has 3 text files: subject\_<train|test>.txt, X\_<test|train>.txt, and y\_<train|test>.txt.
5.  Directory UCI HAR Dataset contains the following files: activity\_labels.txt and features.txt.
6.  Download the run\_analysis.R script from the [Github repository](https://github.com/kzabril/GettingCleaningData_CourseProject) to your working directory.
7.  Run the run\_analysis.R script.
8.  The resulting tidy datafile is stored in the following path in the working directory: "Course Project Results/DSS\_Getdata031\_Final\_DataSet\_Project.txt"

###Cleaning of the data
The cleaning script assumes the following:

*   The compressed file with the data has been downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
*   The compressed file has been decompressed into the working directory and the directory structure has been maintained: UCI HAR Dataset/train, UCI HAR Dataset/test.
*   The script is ran by a user with enough permissions to write to the file system.
*   The required packages have been installed. [Refer to readme document for details.]()

The script loads the required datasets from the file system:

*   ds_features - dataset with variable names.
*   ds_train - training dataset, script loads only the 66 selected variables for analysis.
*   ds_test - test dataset, script loads only the 66 selected variables for analysis.
*   ds\_subjects_train - subjects who performed the actions in training dataset.
*   ds\_activities_train - list of activities performed by subjects in training dataset.
*   ds\_subjects_test - subjects who performed the actions in test dataset.
*   ds\_activities_test - list of activities performed by subjects in test dataset.
*   ds\_activity_labels - ids and descriptive activity names for both sets.

Then it continues by merging each train and test dataset with its corresponding activities and subjects, creating variables subjectid, activitytype and id, where subjectid is the id of the subject performing the activity, activitytype is the activity name and id is the activity id. This last variable gets dropped and it's not part of the final dataset.
The script then merges both complete datasets into one where variable names are transformed to descriptive language according to recommendations from [Lecture "Editing Text Variables"](https://d396qusza40orc.cloudfront.net/getdata/lecture_slides/04_01_editingTextVariables.pdf). Variable names are converted to lower case, parenthesis, underscores and periods are removed, "f" is replaced with "frequency", "t" with "time", "Acc" with "accelerometer", "Gyro" with "gyroscope", and "Mag" with "magnitude". Activity labels are converted to lower case for consistency.
**Example: tBodyAcc-mean()-X -> timebodyaccelerometermeanx.** 
Dataset is melted by subjectid and activitytype to create variables signalmeasurement - the measurement name and averagevalue - value of the mean or standard deviation for that measurement. Finally, the script obtains the mean value for each measurement/activity/subject combination. The script creates directory "Course Project Results" inside the working directory where the resulting dataset is saved as a text file "DSS\_Getdata031\_Final\_DataSet\_Project.txt" using the write.table command.

[For greater detail of the script code and components, refer to readme document]().

##Description of the variables in the DSS\_Getdata031\_Final\_DataSet\_Project.txt file
The file containing the tidy dataset is 759.3 KB in size. The dataset contains 4 variables: **subjectid**, **activitytype**, **signalmeasurement**, and **averagevalue**. The dataset shows the average of each signal measurement, for each activity and each subject.  

###Variable subjectid
*   subjectid - id of the person performing the activity. Possible values are: 1-30.

###Variable activitytype
*   activitytype - descriptive name of the activity. Possible values are: standing, walking upstairs, walking downstairs, sitting, laying and walking.

###Variable signalmeasurement
*   signalmeasurement - type of signal and estimated variable. Possible values:

        timebodyaccelerometermeanx - mean of time domain body acceleration signal in x direction in standard gravity units.
        timebodyaccelerometermeany - mean of time domain body acceleration signal in y direction in standard gravity units.??
        timebodyaccelerometermeanz - mean of time domain body acceleration signal in z direction in standard gravity units.
        timebodyaccelerometerstdx - standard deviation of time domain body acceleration signal in x direction in standard gravity units.
        timebodyaccelerometerstdy - standard deviation of time domain body acceleration signal in y direction in standard gravity units.
        timebodyaccelerometerstdz - standard deviation of time domain body acceleration signal in z direction in standard gravity units.
        timegravityaccelerometermeanx - mean of time domain gravity accelerationsignal in x direction in standard gravity units.
        timegravityaccelerometermeany - mean of time domain gravity acceleration signal in y direction in standard gravity units.
        timegravityaccelerometermeanz - mean of time domain gravity acceleration signal in z direction in standard gravity units.
        timegravityaccelerometerstdx - standard deviation of time domain gravity acceleration signal in x direction in standard gravity units.
        timegravityaccelerometerstdy - standard deviation of time domain gravity acceleration signal in y direction in standard gravity units.
        timegravityaccelerometerstdz - standard deviation of time domain gravity acceleration signal in  z direction in standard gravity units.
        timebodyaccelerometerjerkmeanx - mean of time domain Jerk signal in x direction in standard gravity units.
        timebodyaccelerometerjerkmeany - mean of time domain Jerk signal in y direction in standard gravity units.
        timebodyaccelerometerjerkmeanz - mean of time domain Jerk signal in z direction in standard gravity units.
        timebodyaccelerometerjerkstdx - standard deviation of time domain Jerk signal in x direction in standard gravity units.
        timebodyaccelerometerjerkstdy - standard deviation of time domain Jerk signal in y direction in standard gravity units.
        timebodyaccelerometerjerkstdz - standard deviation of time domain Jerk signal in z direction in standard gravity units.
        timebodygyroscopemeanx - mean of time domain body gyroscope signal in x direction in radians/second.
        timebodygyroscopemeany - mean of time domain body gyroscope signal in y direction in radians/second.
        timebodygyroscopemeanz - mean of time domain body gyroscope signal in z direction in radians/second.
        timebodygyroscopestdx - standard deviation of time domain body gyroscope signal in x direction in radians/second.
        timebodygyroscopestdy - standard deviation of time domain body gyroscope signal in y direction in radians/second.
        timebodygyroscopestdz - standard deviation of time domain body gyroscope signal in z direction in radians/second.
        timebodygyroscopejerkmeanx - mean of time domain body gyroscope Jerk signal in x direction in radians/second.
        timebodygyroscopejerkmeany - mean of time domain body gyroscope Jerk signal in y direction in radians/second.
        timebodygyroscopejerkmeanz - mean of time domain body gyroscope Jerk signal in z direction in radians/second.
        timebodygyroscopejerkstdx - standard deviation of time domain body gyroscope Jerk signal in x direction in radians/second.
        timebodygyroscopejerkstdy - standard deviation of time domain body gyroscope Jerk signal in y direction in radians/second.
        timebodygyroscopejerkstdz - standard deviation of time domain body gyroscope Jerk signal in z direction in radians/second.
        timebodyaccelerometermagnitudemean - mean of magnitude of time domain body acceleration signal in units.!
        timebodyaccelerometermagnitudestd - mean of magnitude of time domain body acceleration signal in units.
        timegravityaccelerometermagnitudemean - mean of magnitude of time domain acceleration signal in units.
        timegravityaccelerometermagnitudestd - standard deviation of magnitude of time domain acceleration signal in units.
        timebodyaccelerometerjerkmagnitudemean - mean of magnitude of time domain body acceleration Jerk signal in units.
        timebodyaccelerometerjerkmagnitudestd - standard deviation of magnitude of time domain body acceleration Jerk signal in units.
        timebodygyroscopemagnitudemean - mean of magnitude of time domain gyroscope signal in units.
        timebodygyroscopemagnitudestd - standard deviation of magnitude of time domain gyroscope signal in units.
        timebodygyroscopejerkmagnitudemean - mean of magnitude of time domain gyroscope Jerk signal in units.
        timebodygyroscopejerkmagnitudestd - standard deviation of magnitude of time domain gyroscope Jerk signal in units.
        frequencybodyaccelerometermeanx - mean of frequency domain body acceleration signal in x direction in standard gravity units.
        frequencybodyaccelerometermeany - mean of frequency domain body acceleration signal in y direction in standard gravity units.
        frequencybodyaccelerometermeanz - mean of frequency domain body acceleration signal in z direction in standard gravity units.
        frequencybodyaccelerometerstdx - standard deviation of frequency domain body acceleration signal in x direction in standard gravity units.
        frequencybodyaccelerometerstdy - standard deviation of frequency domain body acceleration signal in y direction in standard gravity units.
        frequencybodyaccelerometerstdz - standard deviation of frequency domain body acceleration signal in z direction in standard gravity units.
        frequencybodyaccelerometerjerkmeanx - mean of frequency domain Jerk signal in x direction in standard gravity units.
        frequencybodyaccelerometerjerkmeany - mean of frequency domain Jerk signal in y direction in standard gravity units.
        frequencybodyaccelerometerjerkmeanz - mean of frequency domain Jerk signal in z direction in standard gravity units.
        frequencybodyaccelerometerjerkstdx - standard deviation of frequency domain Jerk signal in x direction in standard gravity units.
        frequencybodyaccelerometerjerkstdy - standard deviation of frequency domain Jerk signal in y direction in standard gravity units.
        frequencybodyaccelerometerjerkstdz - standard deviation of frequency domain Jerk signal in z direction in standard gravity units.
        frequencybodygyroscopemeanx - mean of frequency domain body gyroscope signal in x direction in radians/second.
        frequencybodygyroscopemeany - mean of frequency domain body gyroscope signal in y direction in radians/second.
        frequencybodygyroscopemeanz - mean of frequency domain body gyroscope signal in z direction in radians/second.
        frequencybodygyroscopestdx - standard deviation of frequency domain body gyroscope signal in x direction in radians/second.
        frequencybodygyroscopestdy - standard deviation of frequency domain body gyroscope signal in y direction in radians/second.
        frequencybodygyroscopestdz - standard deviation of frequency domain body gyroscope signal in z direction in radians/second.
        frequencybodyaccelerometermagnitudemean - mean of magnitude of frequency domain body acceleration signal in units.!
        frequencybodyaccelerometermagnitudestd - standard deviation of frequency domain body acceleration signal in units.!
        frequencybodybodyaccelerometerjerkmagnitudemean - mean of magnitude of frequency domain body acceleration Jerk signal in units.
        frequencybodybodyaccelerometerjerkmagnitudestd - standard deviation of frequency domain body acceleration Jerk signal in units.
        frequencybodybodygyroscopemagnitudemean -mean of magnitude of frequency domain gyroscope signal in units.
        frequencybodybodygyroscopemagnitudestd - standard deviation of magnitude of frequency domain gyroscope signal in units.
        frequencybodybodygyroscopejerkmagnitudemean - mean of magnitude of frequency domain gyroscope Jerk signal in units.
        frequencybodybodygyroscopejerkmagnitudestd - standard deviation of magnitude of frequency domain gyroscope Jerk signal in units.

###Variable averagevalue
*   averagevalue - calculated mean for each measurement type. See possible values of signalmeasurement variable for unit information.
