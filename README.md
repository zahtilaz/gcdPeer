## Instructions

1. Download the data from 
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip
3. Modify run_analysis.R, so that data_directory points to the location of unziped files, e.g.
   data_directory <- "D:\\RCourse\\gcd-peer\\UCI HAR Dataset"
4. If required: install.packages("reshape2")
5. Execute run_analysis.R 

There are two output (tidy) data files:
- res_data_set.txt - the subset containing only the measurements on the mean and standard deviation
- tidy2.txt - dataset containing the mean for each variable in the data from the source data set,
              for each subject:activity pair.

More detailed instructions are in CodeBook.md.