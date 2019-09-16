

library(dplyr)
library(data.table)
#Download the UCI HAR Dataset file as mentioned in the description

filename <- "Dataset.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists Unzip the data set into the chosen working directory
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Load test and training datasets into the respective test/training data frames
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
head(subject_test)
feature_test <- read.table("UCI HAR Dataset/test/X_test.txt")
head(x_test)
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
feature_train <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")


#Load the source variable names for test and training data sets
features_names <- read.table("UCI HAR Dataset/features.txt")
head(features_names)

#Load the activity labels
activities_names <- read.table("UCI HAR Dataset/activity_labels.txt")
head(activities_names)

#assign column names
colnames(feature_train) <- c('n','feature')
colnames(activity_train) <-"activity"
colnames(subject_train) <- "subject"

colnames(feature_test) <- c("n","feature")
colnames(activity_test) <-  "activity"
colnames(subject_test) <- "subject"

colnames(activities_names) <- c('activity','activityType')

#Combine the test and training data frames using rbind
feature <- rbind(feature_train, feature_test)
activity <- rbind(activity_train,activity_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, activity, feature)

#Pair down the data frames to include the mean and standard deviation variables
colNames <- colnames(Merged_Data)
mean_and_std <- (grepl("activity" , colNames) | 
                   grepl("subject" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

setForMeanAndStd <- Merged_Data[ , mean_and_std == TRUE]
setWithActivityNames <- merge(setForMeanAndStd, activities_names,
                              by='activity',
                              all.x=TRUE)


## Extracts the target variables to create the target data frame
target_data <- AllData[ , setWithActivityNames]

write.table(target_data, "target_data.txt", row.name=FALSE)
target_data
