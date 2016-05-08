setwd("C:/Users/Kam/Desktop/DataScientist/Cleaning and tidy data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

# STEP 1: Merges the training and the test sets to create one data set.
# Reading data into table- from file test/y_test, subject_test,X_test 
test.Y <- read.table("test/y_test.txt", col.names="Y")
test.subjects <- read.table("test/subject_test.txt", col.names="subject")
test.X <- read.table("test/X_test.txt")
train.Y <- read.table("train/y_train.txt", col.names="Y")
train.subjects <- read.table("train/subject_train.txt", col.names="subject")
train.X <- read.table("train/X_train.txt")
# Binding all of the data into one set
subject.Y.X <- rbind(cbind(test.subjects,test.Y,test.X), cbind(train.subjects,train.Y,train.X))
#colnames(subject.Y.X)

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Read features
featureNames <- read.table("features.txt", sep="", stringsAsFactors=FALSE)
head(featureNames, 5)
# only retain features of mean and standard deviation
names(featureNames) <- c("f.num", "f.name")
# feature names with mean/std in the name
fmean <- grepl("mean()", featureNames$f.name)  
fstd <- grepl("std()", featureNames$f.name)
fmeanstd <- fmean | fstd
data.mean.std <- subject.Y.X[, fmeanstd]
names(data.mean.std) <- c('subject', 'activity.ID', featureNames$f.name[fmeanstd])
#colnames(data.mean.std)

# STEP 3:
# Read activity
activity <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
names(activity) <- c("activity.ID", "activity.Type")
data.mean.std = merge(data.mean.std, activity, by='activity.ID', all.x=TRUE);
head(data.mean.std, 3)
colnames(data.mean.std)



# STEP 4: Uses descriptive activity names to name the activities in the data set
# renaming each of the variables
colnames(data.mean.std)
names(data.mean.std)<-gsub("Acc", "Accelerometer", names(data.mean.std))
names(data.mean.std)<-gsub("[Gg]yro", "Gyroscope", names(data.mean.std))
names(data.mean.std)<-gsub("BodyBody", "Body", names(data.mean.std))
names(data.mean.std)<-gsub("[Mm]ag", "Magnitude", names(data.mean.std))
names(data.mean.std)<-gsub("^t", "Time", names(data.mean.std))
names(data.mean.std)<-gsub("^f", "Frequency", names(data.mean.std))
names(data.mean.std)<-gsub("tBody", "TimeBody", names(data.mean.std))
names(data.mean.std)<-gsub("-mean()", "Mean", names(data.mean.std), ignore.case = TRUE)
names(data.mean.std)<-gsub("-std()", "STD", names(data.mean.std), ignore.case = TRUE)
names(data.mean.std)<-gsub("-freq()", "Frequency", names(data.mean.std), ignore.case = TRUE)
names(data.mean.std)<-gsub("[Aa]ngle", "Angle", names(data.mean.std))
names(data.mean.std)<-gsub("[Gg]ravity", "Gravity", names(data.mean.std))
# Remove() from column names
names(data.mean.std)<-gsub("()", "", names(data.mean.std))
names(data.mean.std)


#STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Creating an independant tidy data set
final.data <- aggregate(data.mean.std[, 3:ncol(data.mean.std)], by=list(subject = data.mean.std$subject, activity = data.mean.std$activity.ID), mean)
head(final.data, 5)


# Write data to text file
write.table(format(final.data, scientific=T), "tidy2.txt", row.names=F, col.names=F, quote=2)
