! NOT FINISHED !

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

?read.table
#Load the source variable names for test and training data sets
features_names_x <- read.table("UCI HAR Dataset/features.txt", col.names =c("no","features"))


#Load the activity labels activity column names is already labled column 1 is 
#labeled activityID and column 2 is labeled activityType
activities_names_y <- read.table("UCI HAR Dataset/activity_labels.txt")

#Test dataframe  (This only contains the subject id of 2)

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "test subject")
feature_test_x <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features_names_x$features)
activity_test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names= "activityID")

#Train dataframe

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "test subject")
feature_train_x <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features_names_x$features)
activity_train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names= "activityID")

#put the test data on top of the training data and bind with row bind
featuredatabase<-rbind(feature_test_x,feature_train_x)
activity_vector<-rbind(activity_test_y,activity_train_y)
subject_vector<-rbind(subject_test,subject_train)



#Bind dataframe 

subject_activity_df<-cbind(subject_vector,activity_vector)
total_dataset<-cbind(subject_activity_df,featuredatabase)

#This replaces the activity names y vector with a longer vector of the total dataset 
activities_names_y <- activities_names_y[total_dataset$activityID, 2]

#then replace the activity id with the activity names in the total dataset

total_dataset$activityID<-activities_names_y

#subset the dataset by mean and standard deviation

MeanandStdDataset<-


# From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject.

