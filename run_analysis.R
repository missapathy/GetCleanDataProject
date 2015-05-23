## check that the directory exists!
if(!file.exists("./UCI HAR Dataset")){
      return("Please download the dataset!")
}
labels <- scan("UCI HAR Dataset/features.txt", what="list", sep="")
labels <- labels[c(FALSE, TRUE)] ## removes the numbers from the list, leaves the text labels

column_mean_position <- grep("mean()", labels, value=FALSE) ## makes vector of the position of columns of means
column_remove <- grep("meanFreq()", labels, value=FALSE) ## finds position of columns with meanFreq
column_mean_position <- column_mean_position[!column_mean_position %in% column_remove] ## removes position of columns with meanFreq
column_std_position <- grep("std()", labels, value=FALSE) ## makes vector of the position of columns of standard deviations
column_position <- c(column_mean_position, column_std_position) ## combines the vectors
column_mean_name <- grep("mean()", labels, value=TRUE) ## makes vector of labels with "mean()"
column_remove <- grep("meanFreq()", labels, value=TRUE) ## makes vector of labels with "meanFreq()" 
column_mean_name <- column_mean_name[!column_mean_name %in% column_remove] ## removes labels with "meanFreq()"
column_std_name <- grep("std()", labels, value=TRUE) ## makes vector of labels with "std()"
column_names <- c(column_mean_name, column_std_name) ## combines the vectors

## import test data, add column names, and remove unnecessary columns
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
test_data <- setNames(test_data, labels)
test_data <- subset(test_data, select=column_position)

## import train data, add column names, and remove unnecessary columns
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
train_data <- setNames(train_data, labels)
train_data <- subset(train_data, select=column_position)

## add subject column to test data frame
subject_label_test <- scan("UCI HAR Dataset/test/subject_test.txt", what="")
subject_label_test <- as.numeric(subject_label_test)
test_data <- cbind(Subject=subject_label_test, test_data)

## add subject column to train data frame
subject_label_train <- scan("UCI HAR Dataset/train/subject_train.txt", what="")
subject_label_train <- as.numeric(subject_label_train)
train_data <- cbind(Subject=subject_label_train, train_data)

## rename activities to descriptive and add activity column to test frame
activity_label_test <- scan("UCI HAR Dataset/test/y_test.txt", what="")
activity_label_test[activity_label_test =="1"] <- "Walking"
activity_label_test[activity_label_test =="2"] <- "Walking_Upstairs"
activity_label_test[activity_label_test =="3"] <- "Walking_Downstairs"
activity_label_test[activity_label_test =="4"] <- "Sitting"
activity_label_test[activity_label_test =="5"] <- "Standing"
activity_label_test[activity_label_test =="6"] <- "Laying"
test_data <- cbind(Activity=activity_label_test, test_data)

## rename activities to descriptive and add activity column to train frame
activity_label_train <- scan("UCI HAR Dataset/train/y_train.txt", what="")
activity_label_train[activity_label_train =="1"] <- "Walking"
activity_label_train[activity_label_train =="2"] <- "Walking_Upstairs"
activity_label_train[activity_label_train =="3"] <- "Walking_Downstairs"
activity_label_train[activity_label_train =="4"] <- "Sitting"
activity_label_train[activity_label_train =="5"] <- "Standing"
activity_label_train[activity_label_train =="6"] <- "Laying"
train_data <- cbind(Activity=activity_label_train, train_data)

## add dummy column noting if test or train
test_data <- cbind(TestTrain=0, test_data)
train_data <- cbind(TestTrain=1, train_data)

## make new data frame of merged data frames with train data rows appended to test frame
merged_data <- rbind(test_data, train_data)

## make data frame of means by activity
library(plyr)
summary_data <- ddply(merged_data, .(Subject, Activity), colwise(mean))

## change appropriate column names to add "mean_"
summary_names <- c(names(summary_data))
for(i in summary_names[4:69]){
      summary_names[summary_names == i] <- paste("mean", i, sep="_")
}
names(summary_data) <- c(summary_names)

## write table
write.table(summary_data, "UCI HAR tidy means.txt", row.name=FALSE)


