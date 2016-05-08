# Project Description

This file contains additional information about the variables, data and transformations used in the course project for Getting and Cleaning data is described in this section.

Source Data

A full description of the data used in this project can be found at The UCI Machine Learning Repository

The source data for this project can be found here.

## Data information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


## Attribute Information

For each record in the dataset it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.

## STEP 1:

Merges the training and the test sets to create one data set. The first segement of the script extracts the various data from the following files and merges them to together:

* test/y_test.txt
* test/subject_test.txt
* test/X_test.txt
* train/y_train.txt
* train/subject_train.txt
* train/X_train.txt


### Additionally:
features.txt will contain the column names for the merged dataset. Activities.txt will also be used to merge the values into the final dataset

## STEP 2:

Extracts only the measurements on the mean and standard deviation for each measurement. The final data set will filter out values that match the text mean and std with grepl

## STEP 3:

Uses descriptive activity names to name the activities in the data set THis segment merges the activity data set with the data obtained from step 2 and will us descriptive names for the activities

## STEP 4:

Appropriately labels the data set with descriptive variable names. In this section all of the merged data colnames will be renamed. A vaild colnames will be provided to each of the columns, The values are obtained from features.txt

## STEP 5:

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The final aggregate data will contain the average for each activity and subject. I have used the 'aggregate' fucntion to achieve this
