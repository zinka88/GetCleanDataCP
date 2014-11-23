==================================================================
Human Activity Recognition Using Smartphones Dataset
==================================================================
Name: Anna Zink
Class: Getting & Cleaning Data
Date: 11/23/2014
==================================================================

Summary
==================================================================
Using the "Human Activity Recognition Using Smartphones Dataset" data
provided by smatlabs, we found the average of each mean and standard
deviation measurement for each activity and each subject.

Repository Contents
==================================================================

- 'run_analysis.R' The script for processing and summarizing the dataset.

- 'codebook.md' The codebook for the resulting dataset that provides the
   average of each variable for each activity. 

Summary of Analysis in 'run_analysis.R'
======================================

1. Read in the datasets necessary to perform the analysis 
and combine the data into one dataset providing the full list
of measurements and activity for each subject in both the test
and training dataset. 

The following data was used: 

The test data:
- 'test/X_test.txt': Measurements
- 'test/y_test.txt': provided activity 
- 'test/subject_test.txt': Provided subject identifier

The train data:
- 'train/X_train.txt': Measurements
- 'train/y_train.txt': provided activity 
- 'train/subject_train.txt': Provided subject identifier

Other informative files (to be used later in the analysis):
- 'features.txt' : Provided list of measurements in the X* datasets
- 'activity_labels.txt' : Provided labels for activities in the Y datasets

Both the test data and training data for the measurements, activities and subjects was 
column bound together into one dataset. Then the training and test data was then stacked 
together (row bound) to create one dataset. 

Descriptive column names were added to the dataset using the 'features.txt' file which
provided labels for all the measurements in the X* datasets. 

2. Using the desriptive names for the columns, indices of all the relevant measuremnt 
columns providing mean and standard deviation measurements was found and the data subset
to just these measurement columns. 

3. Merge on descriptive names for the activity for each observation. Descriptive labels
were provided in the 'activity_labels.txt' file. 

4. Summarize the data by subject ID and activity and provide the mean for each of the
mean and standard deviation measurements in the final dataset "meanData.txt"
