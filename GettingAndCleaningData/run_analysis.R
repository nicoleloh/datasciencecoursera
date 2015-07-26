# Course Project

library(plyr)

# Read Activity Labels and Features Metadata
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
featuresLabels <- read.table("./UCI HAR Dataset/features.txt")

# Read Training Data set
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Read Test Data set
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
featuresTest <- read.table("./UCI HAR Dataset/test/x_test.txt")

# Merge the Training and the Test data sets to create one data set
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

# Assigning column header to data set
names(subject) <- "Subject"
names(features) <- featuresLabels[, 2]

# Merge all data sets to create one data set
df <- cbind(features, activity, subject)

# Extract only the measurements on the mean and standard deviation for each measurement
meanStdCols <- grepl("mean|std", featuresLabels[, 2], ignore.case=TRUE)
meanStdDf = df[, meanStdCols]

# Use descriptive activity names to name the activities in the data set
completeDf = merge(x=meanStdDf, y=activityLabels, by.x="V1", by.y="V1")

# Labels the data set with descriptive variable names
names(completeDf) <- gsub("angle", "Angle", names(completeDf))
names(completeDf) <- gsub("-mean", "Mean", names(completeDf))
names(completeDf) <- gsub("-std", "Std", names(completeDf))
names(completeDf) <- gsub("^t", "Time", names(completeDf))
names(completeDf) <- gsub("^f", "Frequency", names(completeDf))
names(completeDf) <- gsub("gravity", "Gravity", names(completeDf))
names(completeDf) <- gsub("Mag", "Magnitude", names(completeDf))
names(completeDf) <- gsub("tBody", "TimeBody", names(completeDf))
names(completeDf)[85] <- "AngleGravityMean-X"
names(completeDf)[86] <- "AngleGravityMean-Y"
names(completeDf)[87] <- "AngleGravityMean-Z"
names(completeDf)[89] <- "Activity"

# remove brackets () and commas from data set
names(completeDf) <- gsub("\\(|\\)", "", names(completeDf))
names(completeDf) <- gsub(",", "", names(completeDf))

# Drop unuse columns resulted from the merge
completeDf <- completeDf[, 2:89, drop=TRUE]

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyDf = ddply(completeDf, c("Subject","Activity"), numcolwise(mean))
write.table(tidyDf, file="./UCI HAR Dataset/TidyDataSet.txt", row.name=FALSE)
