==================================================================
Getting & Cleaning Data Course Project: Working with the 
Human Activity Recognition Using Smartphones Dataset
==================================================================
Course Project: Getting & Cleaning Data
Author: Anna Zink
Created on: 11/23/2014
==================================================================

Summary
==================================================================
Use the "Human Activity Recognition Using Smartphones Dataset" data
provided by smartlabs, to find the average of each mean and standard
deviation measurement for each activity and each subject.

Directory Contents
==================================================================

- 'run_analysis.R' 

This script reads in and combines the smartlabs data in order and provides
summary information for each subject and activity in the output file "meanData.txt".

- 'CodeBook.md' 

The codebook for the resulting dataset "meanData.txt"

Summary of Analysis in 'run_analysis.R'
======================================

1. Read in the datasets necessary to perform the analysis. 
The following data was used: 

Test data:
- **'test/X_test.txt'**: Measurements
- **'test/Y_test.txt'**: Activity
- **'test/subject_test.txt'**: Subject identifier

Train data:
- **'train/X_train.txt'**: Measurements
- **'train/Y_train.txt'**: Activity 
- **'train/subject_train.txt'**: Subject identifier

Additional files:
- **'features.txt'** : List of measurements in the X* datasets
- **'activity_labels.txt'** : Provided labels for activities in the Y datasets

2. Combine the data into 1 dataset providing measurements for all activities 
for each subject in both the testand training datasets. 

-First, the test data and training data for the measurements, activities and subjects was 
column bound together into one dataset. 

-Then the training and test data was stacked together (row bound) to create one dataset. 
Descriptive column names were added to the dataset using the 'features.txt' file which
provided labels for all the measurements in the X* datasets. 

3. Using the desriptive names for the columns, indices for the mean and standard
deviation measurement columns were found and the data subset to just these columns.

4. Descriptive names for the activity were merged on using the labels
provided in the 'activity_labels.txt' file. 

5. This data set was then summarize by subject ID and activity and the mean for each of the
mean and standard deviation measurements recorded in the final dataset "meanData.txt"
