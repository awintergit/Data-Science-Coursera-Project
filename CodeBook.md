---
title: "Codebook"
author: "Adam Winter"
date: "November 21, 2015"

---

## Project Description
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.  The goal is to prepare a tidy data file that can be used for later analysis.  

##The original data files
The original data files are provided by the UCI Machine Learning Repository.  The original data can be obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  The experiment was carried out using 30 voluneers, each performing 6 activities while wearing a smartphone on the waist.  The original data was partitioned into a training set and testing set.  Each set contains the following files relevant to creating the tidy data file:

  * X_train.txt/X_test.txt - a file including 561 columns of data measurements

  * y_train.txt/y_test.txt - a file including 1 column of the activity identifier

  * subject_train.txt/subject_test.txt - a file including 1 column of the volunteer identifier

  * features.txt - a file containing column labels for X_train.txt/X_test.txt

  * activity_labels.txt - a file containing labels for the identifiers in y_train.txt/y_test.txt


###Guide to creating the tidy data file
After downloading and unzipping files in the working directory, tidy data is created by:

1. Merging the training and the test sets to create one data set.
1. Extracting only the measurements on the mean and standard deviation for each measurement. 
1. Using descriptive activity names to name the activities in the data set
1. Appropriately labeling the data set with descriptive variable names. 
1. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.

## Description of the tidydata.txt file
The tidydata.txt file includes 180 rows and 68 columns.

##Description of the variables in the tidydata.txt file

Each row contains:

  * subject identifier (integer [1-30])

  * activity (text label ['WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING'])

  * mean and standard deviation per measurement (number)


The measurments include a mean and standard deveation of each of the following variables where each measurement is recorded for X,Y, and Z
tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag


##Sources
A template for this codebook was found on the course's github website and is linked to here:
https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41
