Code Book
The purpose of this is to describe the Data
How it changed to Tidy Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A R script called run_analysis.R is created and does the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.

Explanation of each file
features.txt: Names of the 561 features.

activity_labels.txt: Names and IDs for each of the 6 activities.

X_train.txt: 7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

y_test.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.

Process
1. Download the UCI HAR Dataset file as mentioned in the description
2. Unzip the data set into the chosen working directory
3. Load test and training datasets into the respective test/training data frames
4. Load the source variable names for test and training data sets
5. Load the activity labels
6. Combine the test and training data frames using rbind
7. Pair down the data frames to include the mean and standard deviation variables
8. Replace the activity IDs with the activity labels to render readability
9. Combine the Test and Training data frames to produce one data frame containing the subjects, measurements and activities
10. Arrive at the merged data set text file with the combined data frame as the first expected output
11. Create one more data set using the data.table library of R thereby grouping the tidy data by subject and activity
12. Apply the mean and standard deviation calculations across all the groups
13. Arrive at the final calculated tidy data text file as the final required output to complete the assignment.

You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for 
performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you 
performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.
