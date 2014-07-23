#Reading Data into R:
subjtst <- read.table("test/subject_test.txt")
subjtrn<- read.table("train/subject_train.txt")

Xtst<- read.table("test/X_test.txt")
Xtrn<- read.table("train/X_train.txt")

Ytst<- read.table("test/y_test.txt")
Ytrn<- read.table("train/y_train.txt")

act<- read.table("activity_labels.txt")
feats <- read.table("features.txt")  

#Using descriptive activity names to name the activities:
Ytst$V1[which(Ytst$V1==1)]<- "WALKING"
Ytst$V1[which(Ytst$V1==2)]<- "WALKING_UPSTAIRS"
Ytst$V1[which(Ytst$V1==3)]<- "WALKING_DOWNSTAIRS"
Ytst$V1[which(Ytst$V1==4)]<- " SITTING"
Ytst$V1[which(Ytst$V1==5)]<- "STANDING"
Ytst$V1[which(Ytst$V1==6)]<- "LAYING"
head(Ytst)
Ytrn$V1[which(Ytrn$V1==1)]<- "WALKING"
Ytrn$V1[which(Ytrn$V1==2)]<- "WALKING_UPSTAIRS"
Ytrn$V1[which(Ytrn$V1==3)]<- "WALKING_DOWNSTAIRS"
Ytrn$V1[which(Ytrn$V1==4)]<- " SITTING"
Ytrn$V1[which(Ytrn$V1==5)]<- "STANDING"
Ytrn$V1[which(Ytrn$V1==6)]<- "LAYING"
table(Ytrn)

#Creating full data set}
Xdata<- rbind(Xtst, Xtrn)
names(Xdata)<- feats$V2
Activity<- rbind(Ytst, Ytrn)
Subject<- rbind(subjtst, subjtrn)
Data<- cbind(Xdata, Activity, Subject)
names(Data)[562]<- paste("Activity")
names(Data)[563]<- paste("Subject")

#duplicated col. names:
which(duplicated(names(Data)))
length(which(duplicated(names(Data))))

#adding X, Y, Z to duplicated cols:
for (n in 303:316) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "X", sep="")
}
for (n in 317:330) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "Y", sep="")
}
for (n in 331:344) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "Z", sep="")
}
for (n in 382:395) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "X",  sep="")
}
for (n in 396:409) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "Y", sep="")
}
for (n in 410:423) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "Z", sep="")
}
for (n in 461:474) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "X",  sep="")
}
for (n in 475:488) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "Y", sep="")
}
for (n in 489:502) {
  colnames(Data)[n] <- paste(colnames(Data)[n], "Z", sep="")
}

#making the names of the variables legal
colnames(Data) <- gsub('\\(|\\)',"",names(Data), perl = TRUE)
colnames(Data) <- gsub('\\-',"",names(Data), perl = TRUE)
colnames(Data) <- gsub('\\,',"",names(Data), perl = TRUE)

#Subsetting the full Data to obtain only the measurements on the mean and standard deviation for each measurement:
meancols <- grep("[Mm]ean", colnames(Data), value=TRUE)
stdcols <- grep("[Ss]td", colnames(Data), value=TRUE)
meanColNum<- grep("[Mm]ean", colnames(Data))
stdColNum<- grep("[Ss]td", colnames(Data))
subData<- Data[, c(meanColNum, stdColNum, 562, 563)]

#Obtaining the average of each variable for each subject and each activity:
library(data.table)
dt<- data.table(subData)
meanData<- dt[, lapply(.SD, mean), by=c("Subject", "Activity")]
meanData<- meanData[order(meanData$Subject),]

#Exporting data into a .txt file:
write.table(meanData, "tidyset.txt", sep="\t")