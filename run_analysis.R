
# setwd("~/Course 3 Peer Graded Assignment")
# install.packages("plyr")
# install.packages("dplyr")
# install.packages("tidyr")
# install.packages("stringr")

library(plyr)
library(dplyr)
library(tidyr)
library(stringr)


#####   Stage 1 - Merges the training and the test sets to create one data set.   #####

# read the features to a table dataframe (these become the basis for variable names)
td_features <- tbl_df(read.table("~/UCI HAR Dataset/features.txt"))

# read the activity labels to a table dataframe
# (these are the decriptive names of the activities test\training lables )
td_activitylabels <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/activity_labels.txt"))

# read the test labels to a table dataframe (these are the labels of the test subjects)
td_testlabels <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/test/y_test.txt"))

# read the test data to a table dataframe
td_testdata <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/test/x_test.txt"))

# read the test subject data to a table dataframe
td_testsubject <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/test/subject_test.txt"))

# read the training labels to a table dataframe (these are the labels of the training subjects)
td_trainlabels <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/train/y_train.txt"))

# read the training data to a table dataframe
td_traindata <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/train/x_train.txt"))

# read the training subject data to a table dataframe
td_trainsubject <- tbl_df(read.table("~/Peer Graded assignment/UCI HAR Dataset/train/subject_train.txt"))


# tidy up the features data set 
  # take only the 2nd column of the dataset
  td_features <- td_features[, 2]
  
  # set all characters to lower case and transpose into a character vector   
  td_features <- str_to_lower(t(td_features))

# Set the column names of the test\training data to the transposed column of the cleaned up feature names
colnames(td_testdata) <- td_features
colnames(td_traindata) <- td_features
  

# Set the column name of the test\training subject table data frames to be more descriptive
colnames(td_testsubject) <- "subjectid"
colnames(td_trainsubject) <- "subjectid"


# Bind the test\training subject table data frames column to the beginning of the main test\training data
td_testdata <- bind_cols(td_testsubject, td_testdata)
td_traindata <- bind_cols(td_trainsubject, td_traindata)


# Set the column name of the test label table data frame to be more descriptive
colnames(td_testlabels) <- "activityid"
colnames(td_trainlabels) <- "activityid"


# Bind the test\training labels table data frames column to the beginning of the main test\training data 
td_testdata <- bind_cols(td_testlabels, td_testdata)  
td_traindata <- bind_cols(td_trainlabels, td_traindata)  


# Set the column names of the activity labels table data frame to be more descriptive 
# with the id matching that of the td_testlabels so we later do a merge with our main test data set
colnames(td_activitylabels) = c("activityid", "activityname")


# Merge the activity labels to the main test\training data
td_testdata <- merge(x = td_activitylabels, y = td_testdata, by = "activityid", all.y  = TRUE)
td_traindata <- merge(x = td_activitylabels, y = td_traindata, by = "activityid", all.y  = TRUE)


# Append new column to mark data as 'TEST' or 'TRAINING'
td_testdata <- cbind(type = "TEST", td_testdata)
td_traindata <- cbind(type = "TRAINING", td_traindata)


# Create a merged table data frame of the main\training data sets
td_all <- merge(td_testdata, td_traindata, all = TRUE)


# Extract only the measurements on the mean and standard deviation for each measurement to a different data set.
td_mean_sd <- select(td_all, c(type, activityid, activityname, subjectid), matches("\\-std\\(\\)|\\-mean\\(\\)"))


# clean up all objects not now required
rm(list = c("td_features", "td_activitylabels", "td_testdata", "td_testlabels", "td_testsubject", "td_traindata", "td_trainlabels", "td_trainsubject"))


# the final table data frame 'td_all' contains all test and training data combined for all variables
# the final table data frame 'td_mean_sd' contains all test and training data combined for only the mean() and standard deviation() measurements


### END ###




