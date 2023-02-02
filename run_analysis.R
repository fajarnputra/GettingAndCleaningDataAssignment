# Script to obtain tidy data set with the average of each variable 
# for each activity and each subject.
# Please refer to this document for the complete detailed explanation
# Readme.md   : Complete information about the repository
# CodeBook.md : Summary about the final tidy data set and other relevant information

# Import relevant library
library(dplyr)

#Set the working directory to folder to the extracted data
setwd("./UCI HAR Dataset")


# Load the data set into R environment
features <- read.table("features.txt", header = FALSE)
activities <- read.table("activity_labels.txt", header = FALSE)
# y_test explain about the type of activities
# x_test explain about the value of each measures of featured 

# Test Data
testSubject <- read.table("test/subject_test.txt", header = FALSE)
testActivity <- read.table("test/y_test.txt", header = FALSE)
testFeature <- read.table("test/x_test.txt", header = FALSE)
# Training Data
trainSubject <- read.table("train/subject_train.txt", header = FALSE)
trainActivity <- read.table("train/y_train.txt", header = FALSE)
trainFeature <- read.table("train/x_train.txt", header = FALSE)


#Rename the header of feature table
colnames(testFeature) <- c(features$V2)
colnames(trainFeature) <- c(features$V2)

#Merge the data for each subset (using cbind) and combine both (using rbind)
#Test
testData <- cbind(testSubject,testActivity,testFeature)
# Train
trainData <- cbind(trainSubject,trainActivity,trainFeature)
# Combine Test and Train Data set
fullData <- rbind(testData,trainData)
colnames(fullData)[1] <- "Subject"
colnames(fullData)[2] <- "Activity"

# Create filter to keep column with mean or std in their name
indexMeanStd <- grep( ".mean.|.std." , names(fullData), ignore.case = TRUE)
filteredData <- fullData[,c(1,2,indexMeanStd)]
# Check the column length before and after filter applied
ncol(fullData)
ncol(filteredData)

# Change the label of activity Type
filteredData$Activity <- factor(filteredData$Activity, levels = activities$V1, labels = activities$V2)

# Average data by subject and activity
groupData <- filteredData %>%
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean)) %>%
  ungroup()

# Export data.frame to txt file
write.table(groupData,"../Submitted/Final_Tidy_Data.txt", fileEncoding='UTF-8', row.names = FALSE)

