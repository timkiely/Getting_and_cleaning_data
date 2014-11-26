
#====================================================================================#
#  This script is part of the course project for the Coursera Getting and Cleaning Data
#    online course offered by John Hopkins. The below script reads in sensor data from 
#    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#     combines the training and test sets then calculates averages for all columns with 
#      std and mean. The output is Step_Five_Tidy_Data.csv
#====================================================================================#

#============================= INSTRUCTIONS: =======================================#
#
#  You should create one R script called run_analysis.R that does the following. 
#    1. Merges the training and the test sets to create one data set.
#    2. Extracts only the measurements on the mean and standard deviation 
#       for each measurement. 
#    3. Uses descriptive activity names to name the activities in the data set
#    4. Appropriately labels the data set with descriptive variable names. 
#    5. From the data set in step 4, creates a second, independent tidy data set 
#       with the average of each variable for each activity and each subject.
#====================================================================================#


# INSTALL REQUISITE PACKAGES
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")};library(dplyr)

# SET WD TO .zip FILE LOCATION
file<-"C:/Users/tkiely/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/"
setwd(file)

# READ IN THE FEATURE NAMES
feats<-read.table("C:/Users/tkiely/Documents/Coursera/Getting and Cleaning Data/UCI HAR Dataset/features.txt")

# READ IN TRAIN DATA
# Raw data
train.raw<-read.table("train/x_train.txt",header=F)
names(train.raw)<-feats[,2]

# Activity label numbers
train.y<-read.table("train/y_train.txt",header=F)
names(train.y)<-"Activity_labels_no"

# Subject IDs
train.subject<-read.table("train/subject_train.txt",header=F)
names(train.subject)<-"Subject"

# Combine above 3
train.full<-cbind(train.subject,train.y,train.raw)

# Add a "source". This will be removed later
train.full$Source<-"Train"


# READ IN TEST DATA
# Raw data
test.raw<-read.table("test/X_test.txt",header=F)
names(test.raw)<-feats[,2]

# Activity label numbers
test.y<-read.table("test/y_test.txt",header=F)
names(test.y)<-"Activity_labels_no"

# Subject IDs
test.subject<-read.table("test/subject_test.txt",header=F)
names(test.subject)<-"Subject"

# Combine above 3
test.full<-cbind(test.subject,test.y,test.raw)

# Add a "source". This will be removed later
test.full$Source<-"Train"


# COMBINE TRAIN AND TEST DATA
full<-rbind_list(train.full,test.full)


# READ IN ACTIVITY LABELS
act<-read.table("activity_labels.txt",header=F)
names(act)<-c("Activity_labels_no","Activity_labels")

# MAP ACTIVITY LABELS TO ACTIVITY LABEL NUMBERS IN FULL DATA SET
full.act<-left_join(full,act,by="Activity_labels_no",all.x=T)


# CREATE VECTOR OF MEAN AND STD VARIABLES
mean.vec<-grep(c("mean"),names(full.act))
std.vec<-grep(c("std"),names(full.act))
vec<-c(mean.vec,std.vec)


# SELECT ONLY THE ID VARIABLES AND THE MEAN/STD VECTOR VARIBALES
data.id <- full.act[,c(1,2,480,481)]
data.measure<-full.act %>% select(vec)

# RE-COMBINE INTO FULL DATASET 
data.full<-cbind(data.id,data.measure)


# CREATE FINAL DATASET: MEANS OF ALL NUMERIC COLUMNS
data.tidy<-
  data.full %>% 
  select(-Activity_labels_no) %>%
  select(-Source) %>%
  group_by(Activity_labels,Subject) %>%
  summarise_each(funs(mean))

# WRITE TO FILE
write.table(data.tidy, row.names=F,file="C:/Users/tkiely/Documents/Coursera/Getting and Cleaning Data/Step_Five_Tidy_Data.txt")
