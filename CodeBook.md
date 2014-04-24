## Study Design

The raw data for the course project is from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This archive also contains code book for the data. 

## Code Book 

The raw data was then processed using run_analysis.R script which performs the following:
        
1. Gets test set data and variable labels. 
2. Labels the columns in the test set data   
3. Gets subject names  
4. Gets activities and replaces them with descriptive activity names   
5. Merges activities, subjects and test set. 
   Now we have a data frame, where measurements are indexed by activity and subject.
6. Repeats steps 1-5 for train data
7. Merges the train and the test sets to create one data set
8. Extracts only the measurements on the mean and standard deviation for each observation
9. Stores the new (tidy) data set in the file res_data_set.txt
10. Creates a second tidy data set with the average of each variable for each activity and each subject 
11. Stores the new (tidy) data set in the file tidy2.txt


## res_data_set.txt
The data in this data set is the subset of the data from the raw data set, 
containing only the measurements on the mean and standard deviation. 
The variable names are the same as in the raw data set, and are listed in the header of the file.
Description of variables is available in 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## tidy2.txt
The data in this data set is the mean for each variable in the data from the raw data set.
It is indexed by subject and activity, i.e. there are 180 observations, 6 activities for each of 30 subjects.
The variable names are the same as in the raw data set, and are listed in the header of the file.
Description of variables is available in 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Inertial Signals 
I have initially included the Inertial data in the data frame at the start (sample code below). 
However, I could not run melt(full_data_set, id=c("Subject", "Activity")) on this dataset,
due to the memory limits imposed by R running on 32-bit Windows.


full_path <- paste(data_directory, "\\test\\Inertial Signals\\body_acc_x_test.txt", sep = "")
body_acc_x_test <-  read.table(full_path) 
column_labels <- vector(mode = "character", length = 128)
for (i in 1:128) {
        column_labels[i] <- paste("body_acc_x_", i, sep = "")                
}
colnames(body_acc_x_test) <- column_labels


