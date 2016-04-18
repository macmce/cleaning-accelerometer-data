# CodeBook

This is a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.

## The Data Source

The data is derived form the Human Activity Recognition Using Smartphones Data Set, Version 1.0.
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
The source files we use to create the tidy data set from the extrated data archive are:

* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

## Variables


* `xTrainData`, `yTrainData`, `xTestData`, `yTestData`, `subjectTrainData` and `subjectTestData` hold data from the Data Source
* `trainData`, `testData` and `singleData` dold merged datasets
* `meanAndStdColumns` hold mean and standard devaiation extracts
* `averageData` contains the compouted averages data to write to a tidy output file

The average of each variable for each activity and each subject.
TimeBodyAccMean-X, TimeBodyAccMean-Y, TimeBodyAccMean-Z, TimeBodyAccStDev-X, TimeBodyAccStDev-Y, TimeBodyAccStDev-Z, TimeGravityAccMean-X, TimeGravityAccMean-Y, TimeGravityAccMean-Z, TimeGravityAccStDev-X, TimeGravityAccStDev-Y, TimeGravityAccStDev-Z, TimeBodyAccJerkMean-X, TimeBodyAccJerkMean-Y, TimeBodyAccJerkMean-Z, TimeBodyAccJerkStDev-X, TimeBodyAccJerkStDev-Y, TimeBodyAccJerkStDev-Z, TimeBodyGyroMean-X, TimeBodyGyroMean-Y, TimeBodyGyroMean-Z, TimeBodyGyroStDev-X, TimeBodyGyroStDev-Y, TimeBodyGyroStDev-Z, TimeBodyGyroJerkMean-X, TimeBodyGyroJerkMean-Y, TimeBodyGyroJerkMean-Z, TimeBodyGyroJerkStDev-X, TimeBodyGyroJerkStDev-Y, TimeBodyGyroJerkStDev-Z, TimeBodyAccMagMean, TimeBodyAccMagStDev, TimeGravityAccMagMean, TimeGravityAccMagStDev, TimeBodyAccJerkMagMean, TimeBodyAccJerkMagStDev, TimeBodyGyroMagMean, TimeBodyGyroMagStDev, TimeBodyGyroJerkMagMean, TimeBodyGyroJerkMagStDev, FreqBodyAccMean-X, FreqBodyAccMean-Y, FreqBodyAccMean-Z, FreqBodyAccStDev-X, FreqBodyAccStDev-Y, FreqBodyAccStDev-Z, FreqBodyAccJerkMean-X, FreqBodyAccJerkMean-Y, FreqBodyAccJerkMean-Z, FreqBodyAccJerkStDev-X, FreqBodyAccJerkStDev-Y, FreqBodyAccJerkStDev-Z, FreqBodyGyroMean-X, FreqBodyGyroMean-Y, FreqBodyGyroMean-Z, FreqBodyGyroStDev-X, FreqBodyGyroStDev-Y, FreqBodyGyroStDev-Z, FreqBodyAccMagMean, FreqBodyAccMagStDev, FreqBodyAccJerkMagMean, FreqBodyAccJerkMagStDev, FreqBodyGyroMagMean, FreqBodyGyroMagStDev, FreqBodyGyroJerkMagMean, FreqBodyGyroJerkMagStDev

## Transformations
                                
* Training and test data set rows were merged into a single data set
* Measurements were extracted for mean, standard deviation for each measurement
* Column names were labeled with descriptive, cleaner names
* Results were written to a new tidy data set named `subject_and_activity_averages.txt`
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                