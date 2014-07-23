# CodeBook
Description: a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

## Assumptions
It is assumed that the Samsung data is unzipped into the working directory. The data therefore resides in the same folder as `run_analysis.R`

In other words, it should be like this:
```
 ---
  |
  |---run_analysis.R
  |
  |---test/
  |
  |---train/
```

## Reading Data in R

On lines 1 to 12 of run_analysis.R, reading related commands are there

```
colnames(Data) <- gsub('\\(|\\)',"",names(Data), perl = TRUE)
colnames(Data) <- gsub('\\-',"",names(Data), perl = TRUE)
colnames(Data) <- gsub('\\,',"",names(Data), perl = TRUE)
```
These are the lines of code that will format the data

Major steps for subsetting the data
```
meancols <- grep("[Mm]ean", colnames(Data), value=TRUE)
stdcols <- grep("[Ss]td", colnames(Data), value=TRUE)
meanColNum<- grep("[Mm]ean", colnames(Data))
stdColNum<- grep("[Ss]td", colnames(Data))
subData<- Data[, c(meanColNum, stdColNum, 562, 563)]...

```
Details of Features are in the below files:

 - 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


Exporting data into a .txt file:
```
write.table(meanData, "tidyset.txt", sep="\t")

```
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.