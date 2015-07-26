library(dplyr)

#Download File
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
temp <- tempfile()
download.file(file_url, temp)
con <- unz(temp, "UCI HAR Dataset.zip")
unlink(temp)

setwd("UCI_HAR_Dataset")
act_label <- read.table("./activity_labels.txt")
features <- read.table("./features.txt")

tst_X <- read.table("test/X_test.txt")
tst_y <- read.table("test/y_test.txt")
tst_s <- read.table("test/subject_test.txt")
train_X <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
train_s <- read.table("train/subject_train.txt")


tst <- cbind(tst_X,tst_y,tst_s)
train <- cbind(train_X,train_y,train_s)
final <- rbind(train,tst)

# With Header
final_1 <- 

