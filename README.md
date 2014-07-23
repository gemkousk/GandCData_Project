# Description

The requirements are:
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive activity names. 
 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 


#Creating full data set

`rbind(Xtst, Xtrn) which brings all X related data from test and train 

`rbind(Ytst, Ytrn) which brings all Y related data from test and train 


### merging data in/using data.table

 To merge all the data from the various text files into a single giant data table. No subset or extractions performed on the data set once merged.
 

### write_tidy_set

To write the updated data set in the .txt file tidyset.txt
 
