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

##############################################################################
# Step 1 - Merge the training and the test sets to create one data set
##############################################################################

#put the test data on top of the training data and bind with row bind
featuredatabase<-rbind(feature_test_x,feature_train_x)
activity_vector<-rbind(activity_test_y,activity_train_y)
subject_vector<-rbind(subject_test,subject_train)


#Bind dataframe 

subject_activity_df<-cbind(subject_vector,activity_vector)
total_dataset<-cbind(subject_activity_df,featuredatabase)

##############################################################################
#Step 3 replaces the activityID with the Activity names
#############################################################################


#This replaces the activity names y vector with a longer vector of the total dataset 
activities_names_y <- activities_names_y[total_dataset$activityID, 2]

#then replace the activity id with the activity names in the total dataset

total_dataset$activityID<-activities_names_y

##############################################################################
# Step 2 - Extract only the measurements on the mean and standard deviation
#          for each measurement
##############################################################################

# determine columns of data set to keep based on column name...
columnsToKeep <- grepl("test.subject|activityID|mean|std", colnames(total_dataset))

# ... and keep data in these columns only for the means and std dataset
MeansandSTDdataset <- total_dataset[, columnsToKeep]

###########################################################################
#Step-4
#Change the column names so they are easier to read
##########################################################################
names(MeansandSTDdataset)


# Information from the code book of origional data This is not working for me
# and it returned the MeanandStdDataset at 0 so I am just going to put it as comment


# names(MeanandStdDataset) <- gsub("Acc", "Accelerometer", names(MeanandStdDataset))
# names(MeanandStdDataset) <- gsub("Gyro", "Gyroscope", names(MeanandStdDataset))
# names(MeanandStdDataset) <- gsub("BodyBody", "Body", names(MeanandStdDataset))
# names(MeanandStdDataset) <- gsub("std", "StandardDeviation", names(MeanandStdDataset))
# names(MeanandStdDataset) <- gsub("^f", "frequencyDomain", names(MeanandStdDataset))
# names(MeanandStdDataset) <- gsub("^t", "timeDomain", names(MeanandStdDataset))

#replace the column names with new set
names(MeanandStdDataset)


################################################################################## 
  
  # From the data set in step 4, creates a second, independent tidy data set with the 
  #average of each variable for each activity and each subject.
##################################################################################  
MeanandStdDataset$test.subject <- as.factor(MeanandStdDataset$test.subject)
MeanandStdDataset <- data.table(MeanandStdDataset)  
#dim gets the dimentions of rows and columns which is 81 and we start at 3 to avoid the activityID and test.subject (first 2 columns)
dim(MeansandSTDdataset)

#Aggregate() Function in R Splits the data into subsets, computes summary statistics (mean) for each subsets and returns the result in a group by form.
tidy_data_set <- aggregate(MeansandSTDdataset[,3:81], by = list(activityID = MeansandSTDdataset$activityID, test.subject = MeansandSTDdataset$test.subject),FUN = mean)


  
#Write to a text file
write.table(tidy_data_set, "tidy_data_set.text", row.names = FALSE, quote =FALSE )
