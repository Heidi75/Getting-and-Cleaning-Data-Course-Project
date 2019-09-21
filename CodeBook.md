Code Book
The purpose of this is to describe the Data
How it changed to Tidy Data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A R script called run_analysis.R is created and does the following:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.

You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for 
performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you 
performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
This repo explains how all of the scripts work and how they are connected.

Subject_test is a Vector with one column named "V1" and 2947 rows numbered accordingly
Feature_test is a is a table with 561 Columns named "V1"- "V561"  and 2947 rows numbered accordingly
activity_test is a Vector with one column named "V1" and 2947 rows numbered accordingly

Subject_train is a Vector with one column named "V1" and 7352 rows numbered accordingly
Feature_train is a is a table with 561 Columns named "V1"- "V561"  and 7352 rows numbered accordingly
activity_train is a Vector with one column named "V1" and 7352 rows numbered accordingly

Activity_Names are
1.  Walking
2.  Walking_upstairs
3.  Walking_downstairs
4.  Sitting
5.  Standing
6.  Laying

Feature names (561 of them )
