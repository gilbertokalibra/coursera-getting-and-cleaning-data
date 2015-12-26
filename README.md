# Project: Getting and Cleaning Data
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

#Involved Files
- README.md -- Apresentation this project and assignments.

- CodeBook.md -- Describes the variables, the data, and any transformations performed to clean up the data.

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

3. Uses descriptive activity names to name the activities in the data set
.
4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#How this Project works?

1. First, you have to download a file called run_analysis.R and put it into your  working directory in R Studio. Let me give you a hint (use the getwd() function to get your  actual R working directory.) 
2. Load run_analysis.R into R Studio. For that you need just type source('./run_analysis.R'). That does itself the following.
  2.1. Create a "Project UCI HAR Dataset" folder.
  2.2. Download the data source and put it into "Project UCI HAR Dataset" folder.
  2.3. Unzip the data source and Create a "UCI HAR Dataset" folder, which contain all files for our job.
3. Finnaly, it will generate a new, organized and tidy file called Result.txt into "Project UCI HAR Dataset" folder.
