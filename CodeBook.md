CodeBook.md

First unzip the data zip files https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
in the working directory. A folder  "UCI HAR Dataset" will be created in the working directory.

Now load all the required data sets in data frame.
DataSet			DataFrame
--------		----------
X_test.txt		test
y_test.txt		test_label
subject_test.txt	test_subject

X_train.txt		train
y_train.txt		train_label
subject_train.txt	train_subject

activity_labels.txt	activity
features.txt		features

## ----------------------------------------------------------- ##

Cleaning the data assignments

## 1.Merges the training and the test sets to create one data set.

Using rbind merge the two datasets train and test to form merge_data

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

Take out mean of each measurement of merge_data into mean_merge_data and 
also take out standard deviation of each measurement of merge_data into sd_merge_data

## 3 and 4 Uses descriptive activity names to name the activities in the data set ,
Appropriately labels the data set with descriptive activity names

Apply labels to activities for both train and test datasets. Change the column names as well.



## 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Merge lable data set to test data and also merge train label data to train data so that we can get the activity and subject.
Now make the super set of all these merged data into merged_data.

Average of each variable is taken by activity and subject and the new tidy dataset is written on disc as tidy_dataset.txt