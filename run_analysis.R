library(plyr)

################################################################################
# Download and unzip source data
################################################################################

dataFolder <- "./data"
zipFileFull <- buildPath(dataFolder, "uci_dataset.zip")

if (!file.exists(dataFolder)) {
  dir.create(dataFolder)
}

if (!file.exists(zipFileFull)) {
  sourceData <-
    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(sourceData, destfile = zipFileFull, method = "curl")
}

if (!file.exists(buildPath(dataFolder, "UCI HAR Dataset"))) {
  unzip(zipFileFull, overwrite = TRUE, exdir = dataFolder)
}

################################################################################
# Step 1 - Merge the training and the test sets to create one data set.        #
################################################################################

# Read the test and Train data sets
subjectTrainData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset","train","subject_train.txt"))
subjectTestData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset","test","subject_test.txt"))

xTrainData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset","train","X_train.txt"))
xTestData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset","test","X_test.txt"))

yTrainData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset","train","Y_train.txt"))
yTestData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset","test","Y_test.txt"))

# Merge the test and train data sets
subjectData <- rbind(subjectTrainData,subjectTestData)
xData <- rbind(xTrainData,xTestData)
yData <- rbind(yTrainData,yTestData)






# function to build path to files
################################################################################
buildPath <- function(...) {
  paste(... , sep = .Platform$file.sep)
}
