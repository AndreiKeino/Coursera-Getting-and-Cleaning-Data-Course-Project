#https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project
folder <- 'H:\\Coursera\\Data Science\\03 -Getting And Cleaning Data\\Course Project'
setwd(folder)
rm(list=ls())
zipfile <- 'UciHarData.zip'

# download zip file containing data if it hasn't already been downloaded

if(!file.exists(zipfile))
{
    message('zip file does not exists, downloading...')
    zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(zipUrl, destfile = zipfile)
}

# unzip the data
datafolder <- paste0(getwd(), '/', 'UCI HAR Dataset')

if(!dir.exists(datafolder))
{
    message('archive folder does not exists, unzipping...')
    unzip(paste0(getwd(), '/', zipfile))    
}

setwd(datafolder)

# read the train data 
train_values <- read.table('train/X_train.txt')
train_activity <- read.table('train/y_train.txt')
train_subject <- read.table('train/subject_train.txt')

# read the test data
test_values <- read.table('test/X_test.txt')
test_activity <- read.table('test/y_test.txt')
test_subject <- read.table('test/subject_test.txt')

# merge the train data
train_data <- cbind(test_subject, test_activity, test_values)

# merge the test data
test_data <- cbind(train_subject, train_activity, train_values)

# merge the test and train data
activity <- rbind(train_data, test_data)

# read the features
features <- read.table('features.txt', stringsAsFactors = F)

# set the column names
colnames(activity) <- c('subject', 'activity', features[, 2])

#View(head(activity, 2))

# extract columns with names like 'mean' and 'std'
filtered <- grepl('subject|activity|mean|std', colnames(activity))

# filter the table column by the column names 
activityF <- activity[, filtered]

# read activity labels
activities <- read.table('activity_labels.txt')

# convert the activity column to factor
activityF$activity <- factor(activityF$activity, levels = activities[[1]], 
                             labels = activities[[2]])

# Appropriately labels the data set with descriptive variable names

colnames <- names(activityF)

colnames <- gsub('^t', 'timeDomain-', colnames)
colnames <- gsub('^f', 'frequencyDomain-', colnames)
colnames <- gsub('Gyro', 'Gyroscope', colnames)
colnames <- gsub('Acc', 'Acceleration', colnames)
colnames <- gsub('Mag', 'Magnitude', colnames)
colnames <- gsub('Freq', 'Frequency', colnames)
colnames <- gsub('mean', 'Mean', colnames)
colnames <- gsub('std', 'StandardDeviation', colnames)

colnames <- gsub('[-()]', '', colnames)


names(activityF) <- colnames

# create a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
library(dplyr)

activityM <- activityF %>% group_by(subject, activity) %>% 
    summarise_all(funs(mean))

write.table(activityM, "tidy_data.txt", row.names = FALSE, quote = FALSE)