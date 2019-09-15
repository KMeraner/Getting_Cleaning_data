This README document describes the course project for the course
*Getting and Cleaning Data* from the John Hopkins University on
Coursera. The aim of this project is – as the course title says – to get
and clean a data set. Here, the Human Activity Recognition Using
Smartphones Dataset from Jorge L. Reyes-Ortiz, Davide Anguita,
Alessandro Ghio and Luca Oneto[1] is used. This README contains two
sections:

-   How to obtain the original data? and

-   What is the content of the project repository?

### How to obtain the original data?

The full dataset (and additional secription) can be obtained from
<a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" class="uri">http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones</a>

However, for the purpose of the course project the data can be
downloaded from
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" class="uri">https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

The data set contains data from a experiment with 30 people ranging
between 19 – 48 years. Each person performed six activities (WALKING,
WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The orginal data set is divided into a training and test data set.

### What is the content of the project repository?

This repository contains three scripts: This README-file, the analysis
script named run\_analysis.R and a codebook. Additionally, a tidied data
set containg averages for each subject and each activity named
AveragedDataset\_Step5.txt.

##### run\_analysis.R

The script includes all necessary steps to perform the analysis required
for the course project. It downloads data, combines training and test
data, extract relevant measurements, renames variables and activities to
descriptive names and writes the tidied dataset
AveragedDataset\_Step5.txt.

##### codebook.Rmd

This file explains each step of run\_analysis.R and how the analysis is
performed. Please read this file along with the run\_analysis.R script.

##### AveragedDataset\_Step5.txt

The data set contains an average of each variable for each subject and
for each activity. It has 180 rows and 68 columns.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
Multiclass Hardware-Friendly Support Vector Machine. International
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
Spain. Dec 2012
