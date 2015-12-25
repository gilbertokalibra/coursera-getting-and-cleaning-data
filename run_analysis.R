# To create one R script that does the following:
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for each 
#      measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.

# Set up working Directory
# To safe current working Directory
old_wd <- getwd()

# Temporary working directory
prj_wd <- "UCI HAR Dataset"
path_dir <- paste(getwd(), "/", prj_wd, sep = "")

#  If file exists we do not need to download it again.
if(file.exists(prj_wd)) {
    # Set up temporary working Directory
    setwd(path_dir)    
}else {    
    # To create Project directory
    dir.create(path_dir)
    # Set up temporary working Directory
    setwd(path_dir)
    
    # url_data gets url address
    url_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    # download the getdata_projectfiles_UCI_HAR_Dataset.zip file 
    # within work directory current
    download.file(url_data, destfile = "./getdata_projectfiles_UCI_HAR_Dataset.zip")
    
    # To unpack the file specdata.zip with unzip command that will  create 
    # a new directory automaticly called specdata
    unzip(zipfile = "./getdata_projectfiles_UCI_HAR_Dataset.zip")
}

# Load the (test and train) files that contains datas, subjects and labels
    test_labels <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "label")
    test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
    test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
    train_labels <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "label")
    train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names ="subject")
    train_data <- read.table("UCI HAR Dataset/train/X_train.txt")

# Load the features file, witch contains a complete list of variables of each 
# feature.

tb_features <- read.table("UCI HAR Dataset/features.txt")

# 1. Merges the training and the test sets to create one data set.
merge_data <- rbind(cbind(test_subjects, test_labels, test_data),
              cbind(train_subjects, train_labels, train_data))

# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement.

tb_features_MeanStd <- tb_features[grep("mean\\(\\)|std\\(\\)", tb_features$V2), ]

# select only the means and standard deviations from data
# increment by 2 because data has subjects and labels in the beginning
tb_data_MeanStd <- merge_data[, c(1, 2, tb_features_MeanStd$V1+2)]

# 3. Uses descriptive activity names to name the activities in the data set
# read the labels (activities)
tb_ActivLabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors=FALSE)
# replace labels in data with label names
tb_data_MeanStd$label <- tb_ActivLabels[tb_data_MeanStd$label, 2]

# 4. Appropriately labels the data set with descriptive variable names. 
# To make a list of the current column names and feature names
ls_colnames <- c("subject", "label", tb_features_MeanStd$V2)

# To remove every non-alphabetic character and converting to lowercase
ls_colnames <- tolower(gsub("[^[:alpha:]]", "", ls_colnames))

# To use the list as column names for data
colnames(tb_data_MeanStd) <- ls_colnames

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
#    find the mean for each combination of subject and label
aggr_data <- aggregate(tb_data_MeanStd[, 3:ncol(tb_data_MeanStd)],
                       by=list(subject = tb_data_MeanStd$subject, 
                               label = tb_data_MeanStd$label),
                       mean)

# To write the data for Result.txt file.
write.table(format(aggr_data, scientific=T), "Result.txt",
            row.names=FALSE, col.names=F, quote=2)

# Set up old working directory
setwd(old_wd)
