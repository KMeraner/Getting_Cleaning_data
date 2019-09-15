# Course project 'Getting and cleaning data' from John Hopkins university on Coursera
# Date: 15.09.2019

# ---------------------------------------------------------------------------------------------
## Step 0
# Preprocessing: Loading libraries and downloading data
library(rapportools)  # This comes with the nice function tocamel (helpful for naming variables)
library(dplyr)        # This comes handy for Step 5
# Download data (if they not already exist)
ifile <- 'human_active_recognition.zip'
if (!(file.exists(ifile))){
    url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(url,destfile=ifile,method='curl')
    unzip(ifile)
}
# ---------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------
## Step 1
# a) Reading the test and training data sets as well as the activity and features labels.
# b) Combining them to one big data set

# 1a: Read additional data like activity labels and feature labels.
activity_labels<- read.table('./UCI HAR Dataset/activity_labels.txt')
feature_labels <- read.table('./UCI HAR Dataset/features.txt')

# 1a: Load the training  and test data
features_train <- read.table('./UCI HAR Dataset/train/X_train.txt')
activities_train <- read.table('./UCI HAR Dataset/train/Y_train.txt')
subject_train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
features_test <- read.table('./UCI HAR Dataset/test/X_test.txt')
activities_test <- read.table('./UCI HAR Dataset/test/Y_test.txt')
subject_test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# 1b: Combining features, activities and subject for test and training set separately
data_test  <-cbind(subject_test,activities_test,features_test)
data_train <-cbind(subject_train,activities_train,features_train)
# 1b: Now combining test and training set (and deleting unnecessary data)
data_TestAndTraining <- rbind(data_train,data_test)
rm(features_train,features_test,subject_train,subject_test,activities_test,activities_train,data_test,data_train)
# ---------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------
## Step 2:
# Extracting only measurements, which represent mean or standard deviation of a measurement.
# Renaming columns
names(data_TestAndTraining) <- append(c('Subject','Activity'),as.character(feature_labels$V2))
# Extracting only mean and standard deviations (and Subject and Activity columns)
index <- grep('-(mean|std)\\(\\)',names(data_TestAndTraining))
MeanStd_TestAndTraining <- data_TestAndTraining[,c(1,2,index)]
rm(data_TestAndTraining,index)
# ---------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------
## Step 3
# Rename the activities to descriptive names
MeanStd_TestAndTraining$Activity<-factor(MeanStd_TestAndTraining$Activity,labels=activity_labels$V2)
# ---------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------
## Step 4:
# Rename variables (i.e., columns) with descriptive variable names
# I choose to set the variables name to CamelCase and expand a leading t to Time 
# and a leading f to Frequency
cnames <- names(MeanStd_TestAndTraining)
cnames <- tocamel(cnames)
cnames <- gsub('^t','Time',cnames)
cnames <- gsub('^f','Frequency',cnames)
names(MeanStd_TestAndTraining) <- cnames
# ---------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------
## Step 5
# Write the average for each subject and each activity to a file
Averaged_Dataset <- MeanStd_TestAndTraining %>% group_by(Subject,Activity) %>% summarize_each(mean)
write.table(ungroup(Averaged_Dataset),file='./AveragedDataset_Step5.txt')


