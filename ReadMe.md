# Coursera *Getting and Cleaning Data* course project

The R script run_analysis.R does the following:

1. Download the datataset file if if does not exists. Unzip it and load the data and related info.
2. Merge columns of the training and test dataset. 
3. Create a common datataset.
4. Convert the appropriate columns into factors, i.e. appropriately label the data set with descriptive variable names.
5. Creates a second, independent data set with the average of each variable for each activity and each subject.

The end result is shown in the file tidy_data.txt.