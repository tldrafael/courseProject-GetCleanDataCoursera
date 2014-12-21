==================================================================
Course Project - module Getting and Cleaning Data from Coursera
Author: Rafael de Souza Toledo
Date: 12/21/2014
==================================================================

The project goal is create a tidy data with the average of each variable for each activity and each subject of the specific [dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), which is explained at [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


The files contained on the project are:
1. run_analysis.R
    * This script attempts to develop the tidy data with the fowards steps:
	  1. Merges the training and the test sets to create one data set.
          2. Extracts only the measurements on the mean and standard deviation for each measurement. 
          3. Uses descriptive activity names to name the activities in the data set
          4. Appropriately labels the data set with descriptive variable names. 
          5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    * To read the data files, "UCI HAR Dataset" folder must be inside the project folder
    * The code returns a tidyData.txt file with the final dataset
		
2. CodeBook.md
    * This script explains the variables, the data, and any transformation necessary to reach the tidy data from the raw data.


