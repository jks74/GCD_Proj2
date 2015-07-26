library(dplyr)
library(plyr)
#Download File
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
temp <- tempfile()
download.file(file_url, temp)
con <- unz(temp, "UCI HAR Dataset.zip")
unlink(temp)


act_label <- read.table("./activity_labels.txt")
names(act_label) <- c("label","Activity")
features <- read.table("./features.txt")

#Read Test Data
tst_X <- read.table("test/X_test.txt")
names(tst_X) <- features$V2
tst_y <- read.table("test/y_test.txt")
names(tst_y) <- "label"
tst_s <- read.table("test/subject_test.txt")
names(tst_s) <- "subject"

#Read Training Data
train_X <- read.table("train/X_train.txt")
names(train_X) <- features$V2
train_y <- read.table("train/y_train.txt")
names(train_y) <- "label"

train_s <- read.table("train/subject_train.txt")
names(train_s) <- "subject"

#Merge Different columns from Test and Training Sets
tst <- cbind(tst_X,tst_y,tst_s)
train <- cbind(train_X,train_y,train_s)

#STEP 1: Combine Test/Training Data
tst_train <- rbind(train,tst)
#Remove duplicate column names from the data
final <- tst_train[, unique(colnames(tst_train))]

sm <- select(final,ends_with("std()"),ends_with("mean()"),label,subject)
#Step 4
sm$label <- mapvalues(sm$label, from = c(1,2,3,4,5,6), to = c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
write.table(sm,"tidy_data.txt",row.names=FALSE)

#haven't done step 5.. ran out of time..
