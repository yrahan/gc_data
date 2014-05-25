# run_analysis


# Get Data
zipfile <- "UCI_HAR_Dataset.zip"
# avoid unecessary downloads
if (!file.exists(zipfile)){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "UCI_HAR_Dataset.zip", method = "curl")
    
}
unzip("UCI_HAR_Dataset.zip")
# create directory to store results
if(!file.exists("./output")){dir.create("./output")}

# read training data
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# read test data
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# combine training and test rows
mergedSet <- rbind(trainingSet, testSet)
mergedLabels <- rbind(trainingLabels, testLabels)
mergedSubjects <- rbind(trainingSubjects, testSubjects)

# 3.Uses descriptive activity names to name the activities in the data set
names(mergedSubjects) <- "subject"
names(mergedLabels) <- "activity"
# get features name
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("id", "feature")
# name columns
names(mergedSet) <- features$feature

# 4. Appropriately labels the data set with descriptive activity names. 
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
mergedLabels$activity <- factor(mergedLabels$activity,levels=activities$V1,labels=activities$V2)

# 1. Merges the training and the test sets to create one data set.
oneDataSet <- cbind(mergedSubjects, mergedLabels, mergedSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features[("Mean" %in% features$feature),]
onlyMeanStd <- features[ with(features,  grepl("mean\\(\\)|std\\(\\)", feature)) , ]
onlyMeanStdData <- oneDataSet[c("subject", "activity", as.character(onlyMeanStd$feature))] 

# 5. Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 

aggregate(oneDataSet[,3])
str(oneDataSet[,3])
str(oneDataSet)

means <- aggregate(oneDataSet[,3] ~ oneDataSet$subject + oneDataSet$activity, 
                   data = oneDataSet, FUN = mean)

for (i in 4:ncol(oneDataSet)){
    means[,i] <- aggregate( oneDataSet[,i] ~ oneDataSet$subject + oneDataSet$activity, 
                            data = oneDataSet, FUN = mean )[,3]
}

colnames(means) <- column_headers

unique(oneDataSet$activity       )
6*24
