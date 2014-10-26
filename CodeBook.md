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

[1] "Activity_labels" - char                
[2] "Subject" - char                       
[3]-[81] All other measure variables included in the output are numeric variables.

The numeric variables are a subsetof the raw dataset, retaining only those variables which measure the mean or standard deviation of a measurement (steps 11-13 in Section I, above). Givent hat there are 180 unique Activity/Subect combinations, the resultant dataset has 180 rows, each containing the average of the stated measurements for that subset.



