####################################################################################################

#Coursera Getting and Cleaning Data___Course Project
#Adam Winter
#November 22, 2015

## run_analysis.R does the following to the UCI HAR Dataset
# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names. 
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data can be downloaded from :
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####################################################################################################
library(plyr);
setwd("/Users/adamwinter/R_Analytics/data/UCI HAR Dataset")     ## set working directory to the place where UCI HAR Dataset was unzipped
rm(list=ls())  

Stest  <- read.table("./test/subject_test.txt")                 ## subject for exp
Xtest  <- read.table("./test/X_test.txt")                       ## test data
Ytest  <- read.table("./test/y_test.txt")                       ## test labels 1-6 activities
Strain <- read.table("./train/subject_train.txt")               ## tells which subject was tested
Xtrain <- read.table("./train/X_train.txt")                     ## train data
Ytrain <- read.table("./train/y_train.txt")                     ## train labels 1-6 activities


## binds rows together(tall) 
S <- rbind(Strain,Stest)          
X <- rbind(Xtrain,Xtest)
Y <- rbind(Ytrain,Ytest)

## assigning readable names to columns
names(S) <- c("subject")     
names(Y) <- c("activity")

FeatureNames <- read.table("features.txt")                ##features.txt is documentation of column titles
names(X) <- FeatureNames$V2

## combining data columns(wide)
Combo <- cbind(S,Y)
Data <- cbind(X,Combo)

subsetNames <- FeatureNames$V2[grep("mean\\(\\)|std\\(\\)", FeatureNames$V2)]        ## pulls mean and standard dev
namesKeep <- c(as.character(subsetNames), "subject", "activity")                ## vector w/ column names we keep
Data <- subset(Data,select=namesKeep)                                   ## now we only have mean std subject and activity

activityNames <- read.table("activity_labels.txt")
Data$activity <- factor(Data$activity, labels = activityNames$V2)

names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))

FinalData <- aggregate(. ~subject + activity, Data, mean)
FinalData <- FinalData[order(FinalData$subject,FinalData$activity), ] 
write.table(FinalData, file = "tidydata.txt", row.name=FALSE)
TidyData <- read.table("tidydata.txt",header=TRUE)

TidyData






























