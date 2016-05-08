# Getting-and-Cleaning-Data

## OVERVIEW:
The purpose of this project is to clean and tidy the data for analysis. A full description of the data used in this project can be found at The UCI Machine Learning Repository

## Necessary modifications for the script to run
Once you have obtained and unzipped the source files, the script file will contain a setwd() call to set the current working directory path. Please note that all of the code depends on the working directory path and the necessary modifications to  set the file path to point to the location of the files is mandatory. Once the path has been set, the script will execute the respective steps described below in a sequence

## objective 
* The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
* The goal is to prepare tidy data that can be used for later analysis.

### STEP 1: 
Merges the training and the test sets to create one data set.
The first segement of the script extracts the various data from the following files and merges them to together:
* test/y_test.txt
* test/subject_test.txt
* test/X_test.txt
* train/y_train.txt
* train/subject_train.txt
* train/X_train.txt

### STEP 2:
Extracts only the measurements on the mean and standard deviation for each measurement.
The final data set will filter out values that match the text mean and std with grepl 

### STEP 3:
Uses descriptive activity names to name the activities in the data set
THis segment merges the activity data set with the data obtained from step 2 and will us descriptive names for the activities

### STEP 4:
Appropriately labels the data set with descriptive variable names.
In this section all of the merged data colnames will be renamed. A vaild colnames will be provided to each of the columns, The values are obtained from features.txt

### STEP 5:
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The final aggregate data will contain the average for each activity and subject. I have used the 'aggregate' fucntion to achieve this
