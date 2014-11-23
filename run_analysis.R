# Title: run_analysis.R
# Author: Anna Zink
# Class: Getting & Cleaning Data
# Date: 11/22/2014
#
# Purpose: Process data & output tidy dataset providing means of mean & std
#          measurements. 

# Download data from source
dloc<-"./UCI HAR Dataset/"

# Read in data
x_test<-read.table(paste(dloc,"test/X_test.txt",sep=""))
y_test<-read.table(paste(dloc,"test/Y_test.txt",sep=""),col.names="Activity")
id_test<-read.table(paste(dloc,"test/subject_test.txt",sep=""),col.names="ID")

x_train<-read.table(paste(dloc,"train/X_train.txt",sep=""))
y_train<-read.table(paste(dloc,"train/Y_train.txt",sep=""),col.names="Activity")
id_train<-read.table(paste(dloc,"train/subject_train.txt",sep=""),col.names="ID")

features<-read.table(paste(dloc,"features.txt",sep=""),stringsAsFactors=F)
activity_labels<-read.table(paste(dloc,"activity_labels.txt",sep=""))

# Column bind test & train data together so you  have vector/activity/label in 1 dataset

test<-cbind(x_test,id_test, y_test)
train<-cbind(x_train, id_train, y_train)

# Row bind test & train data together -- V1:V561, ID, Activity

alldata<-rbind(test,train)
names<-c(features$V2,"ID","Activity")
colnames(alldata)<-names

# Subset to only measurements on mean & standard deviations for each measurement

# Get index of mean & std variables from features.txt

indexMean<-features[grep("mean[(]",features$V2),]
indexStd<-features[grep("std",features$V2),]

# The last two columns contain the Activity & ID info
keepCols<-c(indexStd$V1, indexMean$V1, 562, 563)

# Keep only mean/std information
meanstd.data<-alldata[,keepCols]

# Name activities in the data set using descriptive activity names (stored in activity_label.txt)
meanstd.data<-merge(meanstd.data, activity_labels, by.x="Activity", by.y="V1")
names(meanstd.data)[names(meanstd.data)=="V2"]<-"Activity_Label"

# Create another independent tidy dataset with the average of each activity & each subject

library(plyr)
dataset2<-ddply(meanstd.data, .(ID,Activity_Label), colwise(mean,na.rm=TRUE))
write.table(dataset2,"meanData.txt",row.names=FALSE)




