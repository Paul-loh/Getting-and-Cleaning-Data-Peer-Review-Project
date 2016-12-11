# Getting-and-Cleaning-Data-Peer-Review-Project
Getting and Cleaning Data Peer Review Project Repository

## Purpose
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

## How scipt 'run_analysis.R' Works
You need to copy the zip file above into your R working directory and extract the contents there.
From R studio \ R Console use the code 'source("~run_analysis.R')' to run the script. THe script will produce the 2 tidy data sets as required for the project (see 'Purpose' above) and store them in two table data frames called 'td_all' and 'td_mean_sd'.

