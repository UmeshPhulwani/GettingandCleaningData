library(data.table)
# Load all the data files
## Test datafiles
test <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_label <- read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## Train datafiles
train <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_label <- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## Activity and Features datafiles
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

## ----------------------------------------------------------- ##

## 1.Merges the training and the test sets to create one data set.

merge_data <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

mean_merge_data<-sapply(merge_data,mean,na.rm=TRUE)

sd_merge_data<-sapply(merge_data,sd,na.rm=TRUE)

## 3.Uses descriptive activity names to name the activities in the data set

test_label$V1 <- factor(test_label$V1,levels=activity$V1,labels=activity$V2)
train_label$V1 <- factor(train_label$V1,levels=activity$V1,labels=activity$V2)

## 4.Appropriately labels the data set with descriptive activity names.

colnames(test)<-features$V2
colnames(train)<-features$V2
colnames(test_label)<-c("Activity")
colnames(train_label)<-c("Activity")
colnames(test_subject)<-c("Subject")
colnames(train_subject)<-c("Subject")

## 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

test<-cbind(test,test_label)
test<-cbind(test,test_subject)
train<-cbind(train,train_label)
train<-cbind(train,train_subject)
merge_data<-rbind(test,train)

new_table <- data.table(merge_data)
tidy_data<-new_table[,lapply(.SD,mean),by="Activity,Subject"]

write.table(tidy_data, "tidy_dataset.txt")
