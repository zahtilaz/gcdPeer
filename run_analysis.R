library(reshape2)

data_directory <- "D:\\RCourse\\gcd-peer\\UCI HAR Dataset"
        
## Get test set data and labels 

full_path <- paste(data_directory, "\\test\\X_test.txt", sep = "")
test_set <-  read.table(full_path) 
full_path <- paste(data_directory, "\\features.txt", sep = "")
features <-  read.table(full_path) 
test_set_column_labels <- subset(features, select = 2, drop = TRUE)
colnames(test_set) <- test_set_column_labels
        
## Get subject names  

full_path <- paste(data_directory, "\\test\\subject_test.txt", sep = "")
subject <-  read.table(full_path) 
colnames(subject) <- "Subject"

## Get activity  

full_path <- paste(data_directory, "\\test\\y_test.txt", sep = "")
activity <-  read.table(full_path) 
colnames(activity) <- "Activity"

for (i in 1:nrow(activity)) {
        if (activity[i,] == 1) {
                activity[i,] <- "WALKING"
        }
        else if (activity[i,] == 2 ) {
                activity[i,] <- "WALKING_UPSTAIRS"
        }
        else if (activity[i,] == 3) {
                activity[i,] <- "WALKING_DOWNSTAIRS"
        }
        else if (activity[i,] == 4) {
                activity[i,] <- "SITTING"
        }
        else if (activity[i,] == 5) {
                activity[i,] <- "STANDING"
        }
        else if (activity[i,] == 6) {
                activity[i,] <- "LAYING"
        }
        else {
                activity[i,] <- "error"
        }
}


## Merge all test data sets
full_test_set <- cbind(activity, subject, test_set)

########################################################
## Get train set data and labels 
########################################################

full_path <- paste(data_directory, "\\train\\X_train.txt", sep = "")
train_set <-  read.table(full_path) 
full_path <- paste(data_directory, "\\features.txt", sep = "")
features <-  read.table(full_path) 
train_set_column_labels <- subset(features, select = 2, drop = TRUE)
colnames(train_set) <- train_set_column_labels

## Get subject names  

full_path <- paste(data_directory, "\\train\\subject_train.txt", sep = "")
subject <-  read.table(full_path) 
colnames(subject) <- "Subject"

## Get activity  

full_path <- paste(data_directory, "\\train\\y_train.txt", sep = "")
activity <-  read.table(full_path) 
colnames(activity) <- "Activity"

for (i in 1:nrow(activity)) {
        if (activity[i,] == 1) {
                activity[i,] <- "WALKING"
        }
        else if (activity[i,] == 2 ) {
                activity[i,] <- "WALKING_UPSTAIRS"
        }
        else if (activity[i,] == 3) {
                activity[i,] <- "WALKING_DOWNSTAIRS"
        }
        else if (activity[i,] == 4) {
                activity[i,] <- "SITTING"
        }
        else if (activity[i,] == 5) {
                activity[i,] <- "STANDING"
        }
        else if (activity[i,] == 6) {
                activity[i,] <- "LAYING"
        }
        else {
                activity[i,] <- "error"
        }
}


## Merge all train data sets
full_train_set <- cbind(activity, subject, train_set)

##  Merge the training and the test sets to create one data set
##################################################################
full_data_set <- rbind(full_train_set, full_test_set)
##################################################################
full_path <- paste(data_directory, "\\zz\\full_data_set.txt", sep = "")
write.table(full_data_set, full_path)


##  Extract only the measurements on the mean and standard deviation for each measurement
cols <- colnames(full_data_set)
mean_cols <- grep("[Mm]ean", cols)
std_cols <- grep("std", cols)

res_data_set <- subset(full_data_set, select = cols[c(1:2, std_cols, mean_cols)])
full_path <- paste(data_directory, "\\zz\\res_data_set.txt", sep = "")
write.table(res_data_set, full_path)

## Create a second tidy data set with the average of each variable for each activity and each subject 
full_data_set_melt <- melt(full_data_set, id=c("Subject", "Activity"))
tidy2 <- dcast(full_data_set_melt, Subject + Activity ~ variable, mean)
full_path <- paste(data_directory, "\\zz\\tidy2.txt", sep = "")
write.table(tidy2, full_path)



