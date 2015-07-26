---
title: "README.md"
output: word_document
---

# Getting and Cleaning Data Course Project 

## Introduction
This README.md explains how the script works


## run_analysis.R
Create one R script called **run_analysis.R** that does the following:

1.	Merge the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Here is the data set for the project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)



## Preparation Steps
1.  Download the data (.zip data) by clicking on the above hyperlink and save it into the computer's local drive. Unzip the file into this folder, **UCI HAR Dataset**
2.    Set your working directory in RStudio to the parent working directory of UCI HAR Dataset.
3.    Create the R script called **run_analysis.R** by following the instructions below. The R script will then create a tidy data set call **TidyDataSet.txt** in the UCI HAR Dataset directory.

Refer to the **CodeBook.md** file for the contents of the .zip file