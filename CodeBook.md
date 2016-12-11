==================================================================
Getting and Cleaning Data Peer Review Project 
Version: 1.0
==================================================================
Author: Paul Loh
Date:	11th December 2016
==================================================================
The purpose of the accompanying script, 'run_analysis.R', is to meet the following objectives set in the Coursera - Getting and Cleaning Data Peer Review Project:
{
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

	You should create one R script called run_analysis.R that does the following. 

	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation for each measurement. 
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names. 
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each 		subject.
}
==================================================================
Description of script 'run_analysis.R':

1. 1st loads required packages: 
 plyr
 dplyr
 tidyr
 stringr

2. Loads requires files temporarily into table data frames:

 td_features stores 'features.txt'
 td_activitylabels stores 'activity_labels.txt'
 td_testlabels stores 'y_test.txt'
 td_testdata 'x_test.txt'
 td_testsubject stores 'subject_test.txt'
 td_trainlabels stores 'y_train.txt'
 td_traindata stores 'x_train.txt'
 td_trainsubject stores 'subject_train.txt'

3. td_features is used as the basis for column headers of the datasets td_testdata and td_traindata. Firstly it is cleaned up by setting all characters to lower case.

4. td_testsubject and td_trainsubject are both given the descriptive column name 'subjectid' and bound as the first columns to td_testdata and td_traindata respectively. 

5. td_testlabels and td_trainlabels are both given the descriptive column name 'activityid' and bound as the first columns to td_testdata and td_traindata respectively. 

6. td_activitylabels is given the descriptive column names 'activityid' and 'activityname' and then merged with td_testdata and td_traindata matching on the column 'activityid' to identify the activiy label of each observation.

7. A new column is added to both td_testdata and td_traindata called 'type' and with populated with the values 'TEST' and 'TRAINING' respectively in order to identify the original source when both these datasets are merged together.

8. td_testdata and td_traindata are both then merged together into a full dataset called td_all 

9. Finally a second data set called td_mean_sd is created that takes only the mean and standard deviation measurements from td_all together with the columns type, activityid, activityname and subjectid.

