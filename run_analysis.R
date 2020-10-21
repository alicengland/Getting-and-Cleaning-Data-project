## Script for Getting and Cleaning Data final project:
library(dplyr)
library(readr)
library(stringr)

## 1) to merge the training and test sets to create one data set
## 2) to extract only the measurements on the mean and standard
## deviation for each measurement
## 3) uses descriptive activity names to name the activities in the data set
## 4) appropriately labels the data set with descriptive variable names

## The following script accomplishes goals 1-4 above
## first load feature (column) labels and convert to vector for column names,
colnames <- read_delim("UCI HAR Dataset/features.txt", delim = " ", 
                       col_names = FALSE) %>%
    pull(var = -1)

## load TRAINING subject labels, load activity labels and update activity labels
## from numbers to descriptive labels
train_subs <- read_table("UCI HAR Dataset/train/subject_train.txt", 
                             col_names = "subject")
train_acts <- read_table("UCI HAR Dataset/train/Y_train.txt", 
                           col_names = "activity", 
                           col_types = cols(.default = col_character())) %>%
    mutate_at("activity", str_replace_all, "1", "walking") %>%
    mutate_at("activity", str_replace_all, "2", "walkingupstairs") %>%
    mutate_at("activity", str_replace_all, "3", "walkingdownstairs") %>%
    mutate_at("activity", str_replace_all, "4", "sitting") %>%
    mutate_at("activity", str_replace_all, "5", "standing") %>%
    mutate_at("activity", str_replace_all, "6", "laying")

## load training data set, select only mean() and std() columns, then
## add columns for activity and subject labels   
trainraw <- read_table("UCI HAR Dataset/train/X_train.txt",
                    col_names = colnames, col_types = cols(.default = 
                    col_double())) %>%
    select(contains("mean()"), contains("std()"))
train <- bind_cols(train_subs, train_acts, trainraw)

## load TEST subject labels, load activity labels and update activity labels
## from numbers to descriptive labels
test_subs <- read_table("UCI HAR Dataset/test/subject_test.txt", 
                        col_names = "subject") 
test_acts <- read_table("UCI HAR Dataset/test/Y_test.txt", 
                        col_names = "activity", 
                        col_types = cols(.default = col_character())) %>%
    mutate_at("activity", str_replace_all, "1", "walking") %>%
    mutate_at("activity", str_replace_all, "2", "walkingupstairs") %>%
    mutate_at("activity", str_replace_all, "3", "walkingdownstairs") %>%
    mutate_at("activity", str_replace_all, "4", "sitting") %>%
    mutate_at("activity", str_replace_all, "5", "standing") %>%
    mutate_at("activity", str_replace_all, "6", "laying")

## load test data set, select only mean() and std() columns, then
## add columns for activity and subject labels
testraw <- read_table("UCI HAR Dataset/test/X_test.txt",
                   col_names = colnames, col_types = cols(.default = 
                   col_double())) %>%
    select(contains("mean()"), contains("std()"))
test <- bind_cols(test_subs, test_acts, testraw)

## merge the training and test sets to create one data set
testtrain <- bind_rows(train, test)


## 5) From the data set in step 4, create a second, independent tidy data set
## with the average of each variable for each activity and each subject
## first group subject and activity, then summarize the mean for each combo
tidy <- group_by(testtrain, subject, activity) %>%
    summarise_each(mean)
