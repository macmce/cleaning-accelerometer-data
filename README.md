## Getting and Cleaning Data Project

Course project repo for Johns Hopkins "Getting and Cleaning Data course"

### Overview

The data used in this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project can be found at the following location:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Files

`Codebook.md` describes the variables, the data, and any transformations or work performed to clean up the data 

`run_analysis.R` perform alaysis accordog to the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`subject_and_activity_averages.txt` is the file resulting from Step 5.

