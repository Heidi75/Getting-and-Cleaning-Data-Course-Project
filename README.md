# Getting-and-Cleaning-Data-Course-Project
 This repo explains how all of the scripts work and how they are connected.
 1.  There is this README
 2.  A CodeBook MD with link to data and the codebook and description of the data used and process
 3.  The script run_analysis.R
 4.  The Tidydata
 
 This is from the Getting and Cleaning Data Course Project
 The instructions are 
 Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Read Me about the Data set from this website: http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions
Data Set Information:

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs). The experiment also included postural transitions that occurred between the static postures. These are: stand-to-sit, sit-to-stand, sit-to-lie, lie-to-sit, stand-to-lie, and lie-to-stand. All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device. The experiments were video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of 561 features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

This dataset is an updated version of the UCI Human Activity Recognition Using smartphones Dataset that can be found at: [Web Link]
This version provides the original raw inertial signals from the smartphone sensors, instead of the ones pre-processed into windows which were provided in version 1. This change was done in order to be able to make online tests with the raw data. Moreover, the activity labels were updated in order to include postural transitions that were not part of the previous version of the dataset.


Attribute Information:

The dataset is then divided in two parts and they can be used separately.

1. Inertial sensor data
- Raw triaxial signals from the accelerometer and gyroscope of all the trials with with participants.
- The labels of all the performed activities.

2. Records of activity windows. Each one composed of:
- A 561-feature vector with time and frequency domain variables.
- Its associated activity label.
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- '[Web Link]': The raw triaxial acceleration signal for the experiment number XX and associated to the user number YY. Every row is one acceleration sample (three axis) captured at a frequency of 50Hz.

- '[Web Link]': The raw triaxial angular speed signal for the experiment number XX and associated to the user number YY. Every row is one angular velocity sample (three axis) captured at a frequency of 50Hz.

- '[Web Link]': include all the activity labels available for the dataset (1 per row).
Column 1: experiment number ID,
Column 2: user number ID,
Column 3: activity number ID
Column 4: Label start point (in number of signal log samples (recorded at 50Hz))
Column 5: Label end point (in number of signal log samples)

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the activity ID with their activity name.

- '[Web Link]': Training set.

- '[Web Link]': Training labels.

- '[Web Link]': Test set.

- '[Web Link]': Test labels.

- '[Web Link]': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- '[Web Link]': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Notes:
======

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the 'X' and 'y' files.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.
- A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link]
