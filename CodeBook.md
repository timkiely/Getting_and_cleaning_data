This code book describes the data used in and created by the run_analysis.R script.

SECTION I: STUDY DESIGN

Raw Data:
The raw data is obtained from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The files in the .zip file relevant for this transformation are:
~/UCI HAR Dataset/features.txt
~/UCI HAR Dataset/activity_labels.txt
~/UCI HAR Dataset/train/X_train.txt
~/UCI HAR Dataset/train/subject_train.txt
~/UCI HAR Dataset/train/y_train.txt
~/UCI HAR Dataset/test/X_test.txt
~/UCI HAR Dataset/test/subject_test.txt
~/UCI HAR Dataset/test/y_test.txt

The following are the transformation steps used in run_analysis.R:
1) Download .zip file into a working directory, point R session to working directory
2) Read in feature.txt as variable "feats"
3a) Read in  the raw training data as variable "train.raw"
3b) Name the variables in train.raw using the second column of "feats" (i.e., names(train.raw<-feats[,2])
4a) Read in the activity label numbers from activity_labels.txt as variable "train.y"
4b) Attach column name "Activity_labels_no" to vector "train.y"
5a) Read in the  subject unique IDs from train/subject_train.txt as variable "train.subject"
5b) Rename train.subject as "Subject"
6) column-bind train.subject, train.y and train.raw into new variable "train.full"
7) Repeat steps 3-6 for the test data to create final variable "test.full"
8) Row-bind train.full and test.full to create dataframe "full"
9a) Read in the activity labels from "Activity_labels.txt" as variable "act"
9b) Rename the columns in "act" to "Activity_labels_no","Activity_labels"
10) Map activity labels in "act" to activity label numbers in "full" by using a left join to creat full.act
11) grep search the variable names of full.act for the phrases "mean" and "std", create a vector of variable names which contain either of those called "vec"
12) Select on the "id" variable out of full.act by sub setting for columns 1,2,480,481
13) Create a mean/std only subset of full.act by selecting columns which correspond to "vec", call this "data.measure"
14) Create "data.full" by column-binding the id variables back to the measure variables
15) The final transformation groups "data.full" by Activity_label and Subject, and provides a mean of each column via the "summairse_each" function from R::dplyr
16) write the final dataframe, "data.tidy", to a text file


SECTION II: CODE BOOK

Variables in the output data file Step_Five_Tidy_Data.txt:

Features	|	Type	|	Units
----------|-------|-----------
Activity_labels	|	Character	|	Categorical
Subject	|	Character	|	Categorical
tBodyAcc-mean()-X	|	Numeric	|	HZ/2.56 seconds
tBodyAcc-mean()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyAcc-mean()-Z	|	Numeric	|	HZ/2.56 seconds
tGravityAcc-mean()-X	|	Numeric	|	HZ/2.56 seconds
tGravityAcc-mean()-Y	|	Numeric	|	HZ/2.56 seconds
tGravityAcc-mean()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerk-mean()-X	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerk-mean()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerk-mean()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyGyro-mean()-X	|	Numeric	|	HZ/2.56 seconds
tBodyGyro-mean()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyGyro-mean()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerk-mean()-X	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerk-mean()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerk-mean()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyAccMag-mean()	|	Numeric	|	HZ/2.56 seconds
tGravityAccMag-mean()	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerkMag-mean()	|	Numeric	|	HZ/2.56 seconds
tBodyGyroMag-mean()	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerkMag-mean()	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-mean()-X	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-mean()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-mean()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-meanFreq()-X	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-meanFreq()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-meanFreq()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-mean()-X	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-mean()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-mean()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-meanFreq()-X	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-meanFreq()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-meanFreq()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-mean()-X	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-mean()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-mean()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-meanFreq()-X	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-meanFreq()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-meanFreq()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyAccMag-mean()	|	Numeric	|	HZ/2.56 seconds
fBodyAccMag-meanFreq()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyAccJerkMag-mean()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyAccJerkMag-meanFreq()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyGyroMag-mean()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyGyroMag-meanFreq()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyGyroJerkMag-mean()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyGyroJerkMag-meanFreq()	|	Numeric	|	HZ/2.56 seconds
tBodyAcc-std()-X	|	Numeric	|	HZ/2.56 seconds
tBodyAcc-std()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyAcc-std()-Z	|	Numeric	|	HZ/2.56 seconds
tGravityAcc-std()-X	|	Numeric	|	HZ/2.56 seconds
tGravityAcc-std()-Y	|	Numeric	|	HZ/2.56 seconds
tGravityAcc-std()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerk-std()-X	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerk-std()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerk-std()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyGyro-std()-X	|	Numeric	|	HZ/2.56 seconds
tBodyGyro-std()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyGyro-std()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerk-std()-X	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerk-std()-Y	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerk-std()-Z	|	Numeric	|	HZ/2.56 seconds
tBodyAccMag-std()	|	Numeric	|	HZ/2.56 seconds
tGravityAccMag-std()	|	Numeric	|	HZ/2.56 seconds
tBodyAccJerkMag-std()	|	Numeric	|	HZ/2.56 seconds
tBodyGyroMag-std()	|	Numeric	|	HZ/2.56 seconds
tBodyGyroJerkMag-std()	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-std()-X	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-std()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyAcc-std()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-std()-X	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-std()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyAccJerk-std()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-std()-X	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-std()-Y	|	Numeric	|	HZ/2.56 seconds
fBodyGyro-std()-Z	|	Numeric	|	HZ/2.56 seconds
fBodyAccMag-std()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyAccJerkMag-std()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyGyroMag-std()	|	Numeric	|	HZ/2.56 seconds
fBodyBodyGyroJerkMag-std()	|	Numeric	|	HZ/2.56 seconds



The numeric variables are a subsetof the raw dataset, retaining only those variables which measure the mean or standard deviation of a measurement (steps 11-13 in Section I, above). Givent hat there are 180 unique Activity/Subect combinations, the resultant dataset has 180 rows, each containing the average of the stated measurements for that subset. Units are an average of the raw measurement data, which were recorded time domain signals (prefix 't' to denote time) that were captured at a constant rate of 50 Hz and calculated in 2.56 second time interval windows (hench, Hz/2.56 seconds).



