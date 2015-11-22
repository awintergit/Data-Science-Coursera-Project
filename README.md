# Data-Science-Coursera-Project
This project is for the "Getting and Cleaning Data" Coursera course. The R script called run_analysis.R, executes the following
changes to the raw data in order to produce a tidy data set for analysis:

1. Download the UCI HAR Dataset from this link: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
and unzip it in the current working directory.
1. Load relevant data files into R as described in CodeBook.md.
1. Merge the test and training sets.
1. Merge the columns that identify the volunteer and activity performed.
1. Rename column names according to features.txt.
1. Replace activity identifier according to activity_labels.txt.
1. Extract the columns that calculate either mean or standard deviation.
1. Produce an independent tidy data set with the average of each variable aggregated by activity and subject.
1. Write this new data table to a file in the current working directory and call it tidydata.txt.
1. Finally print out tidydata.txt to the console.

