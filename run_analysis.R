library(plyr)

# Prepare tidy data that can be used for later analysis

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
featuresData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset", "features.txt"))

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


# Add names to the columns of each data set

colnames(subjectTrainData) = "subjectId";
colnames(subjectTestData) = "subjectId";

colnames(xTrainData) = featuresData[,2];
colnames(xTestData) = featuresData[,2];

colnames(yTrainData) = "activityId";
colnames(yTestData) = "activityId";

# Merge the test and train data sets

trainData = cbind(subjectTrainData,yTrainData,xTrainData);
testData = cbind(subjectTestData,yTestData,xTestData);

singleData <- rbind(trainData, testData)


################################################################################
# Step 2 - Extracts only the measurements on the mean and standard deviation   #
# for each measurement.                                                        #
################################################################################

# find columns having "activityId","subjectId", mean()" or "std()" in the column
# name
columnNames <- colnames(singleData)
meanAndStdColumns <-
  grep("-(mean|std)\\(\\)|activityId|subjectId", columnNames)

singleData <- singleData[, meanAndStdColumns]

################################################################################
# Step 3 - Use descriptive activity names for the activities in the data set   #
################################################################################

activityLabelData <-
  read.table(buildPath(dataFolder, "UCI HAR Dataset", "activity_labels.txt"))

colnames(activityLabelData)  = c('activityId','activityName');

singleData = merge(activityLabelData,singleData,by = 'activityId',all.x = TRUE);

################################################################################
# Step 4 - Appropriately labels the data set with descriptive variable names.  #
################################################################################

columnNames <-
  colnames(singleData) #refresh the list of column names

colnames(singleData) = columnNames

# make the column names easier to read
for (i in 1:length(columnNames)) {
  columnNames[i] = gsub("-mean\\(\\)", "Mean",columnNames[i])
  columnNames[i] = gsub("-std\\(\\)", "StDev",columnNames[i])
  columnNames[i] = gsub("Mag-", "Magnitude",columnNames[i])
  columnNames[i] = gsub("^(t)","Time",columnNames[i])
  columnNames[i] = gsub("^(f)","Freq",columnNames[i])
  columnNames[i] = gsub("^(subject)","Subject",columnNames[i])
  columnNames[i] = gsub("^(activity)","Activity",columnNames[i])
  columnNames[i] = gsub("(BodyBody)","Body",columnNames[i])
}

colnames(singleData) = columnNames;

################################################################################
# Step 5 - From the data set in step 4, creates a second, independent tidy     #
# data set with the average of each variable for each activity and subject     #
################################################################################


averageData <-
  ddply(singleData, .(SubjectId, ActivityName), function(x)
    colMeans(x[, 3:69]))

write.table(
  averageData, buildPath(".", "subject_and_activity_averages.txt"), 
    row.name = FALSE, append = FALSE
)


# function to build path to files from a list of folders and a file name
################################################################################
buildPath <- function(...) {
  paste(... , sep = .Platform$file.sep)
}
