 #====================================================================================#
 #  This script is my submission for the course project portion of the Coursera Getting 
 #    and Cleaning Data online course offered by John Hopkins. The below script reads in sensor 
 #     data from: 
 #      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 #       combines the training and test sets then calculates averages for all columns with 
 #        std and mean. The output is Step_Five_Tidy_Data.csv
 #====================================================================================#

 #============================= INSTRUCTIONS: ========================================#
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

 This repo contains the following files:
 -run_analysis.R: this is the R script which performs the cleansing task
 -CodeBook.md: this contains step-by-step instructions on the data transformations
 
 To execute run_analysis.R, first download the requisite .zip file and place in the working directory (specify the directory  in lines 29 and 30 of the script).
 
 Tim Kiely
 10/24/2014
