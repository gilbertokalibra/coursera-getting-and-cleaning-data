# Project: Getting and Cleaning Data
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#Involved Files
- README.md -- Apresentation this project and assignments.

- CodeBook.md -- a code book that describes the variables, the data, and any transformations performed to clean up the data.

- run_analysis.R -- Script R code

#Source of Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Assignments

We should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. 4Uses descriptive activity names to name the activities in the data set
.
4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#How this Project works?

1. Download the data source and put into a folder on your local drive. You'll have a "UCI HAR Dataset" folder.
2. Put run_analysis.R in the parent folder of "UCI HAR Dataset", then set it as your working directory using setwd() function in RStudio.
3. Run source("run_analysis.R"), then it will generate a new file Result.txt in your working directory.

Dependencies:
- Packages reshape2 and data.table.
