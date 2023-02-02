# GettingAndCleaningDataAssignment
Repository for submitting for assignment Course "Getting and Cleaning Data" in Coursera

## List of files in the respository
| File Name | Description |
| ------------- | ------------- |
| run_analysis.R  | This is a script to cleaning the data into a tidy data as requested  |
| Final_Tidy_Data.txt  | this is a final result of data set obtained from run_analysis.R script |
| CodeBook.md  | codebook file for the final tidy data |
| README.md  | this file. Contains the information about the process and background of the assignment |

## Step by step guide to understand the process of *run_analysis.R* to generate tidy data

1. Import relevant library and set the directory to folder "UCI HAR Dataset" where the file located
```{r}
 # Import relevant library
library(dplyr)

#Set the working directory to folder to the extracted data
setwd("./UCI HAR Dataset")
```

2. In this part we loaded the file into data.frame inside Rstudio environment. <br/>
We load the activities and features as a main reference to rename column and rows later. Note that the train and test data also loaded separated first.
```{r}
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
```
3. Rename the column based on features data.frame
```{r}
 #Rename the header of feature table
colnames(testFeature) <- c(features$V2)
colnames(trainFeature) <- c(features$V2)
```

4. Merge the dataset. First we bind the column of each test and train data set. The append the train and test dataset. Also werename the column names for activity and subject column
```{r}
 #Merge the data for each subset (using cbind) and combine both (using rbind)
#Test
testData <- cbind(testSubject,testActivity,testFeature)
# Train
trainData <- cbind(trainSubject,trainActivity,trainFeature)
# Combine Test and Train Data set
fullData <- rbind(testData,trainData)
colnames(fullData)[1] <- "Subject"
colnames(fullData)[2] <- "Activity"
```

5. Filter the data based on specific criteria. In this case  we only keep variable with `mean` or `std` character inside the string.
We also check the change in the matrix dimension to see if we do the right calculation. 
```{r}
 # Create filter to keep column with mean or std in their name
indexMeanStd <- grep( ".mean.|.std." , names(fullData), ignore.case = TRUE)
filteredData <- fullData[,c(1,2,indexMeanStd)]
# Check the column length before and after filter applied
ncol(fullData)
ncol(filteredData)
```
6. We change the label of activities from numeric to category using factor. This to make sure reader easily understand the context of the data
```{r}
 # Change the label of activity Type
filteredData$Activity <- factor(filteredData$Activity, levels = activities$V1, labels = activities$V2)
```
7. We calculate the mean of each column by subject and activities. Since there is 30 subjects and 6 activities, the final data will have about 180 rows.
```{r}
# Average data by subject and activity
groupData <- filteredData %>%
  group_by(Subject, Activity) %>%
  summarise_all(funs(mean)) %>%
  ungroup()
```

8. Export the data.frame into final tidy data txt file 
```{r}
 # Export data.frame to txt file
write.table(groupData,"../Submitted/Final_Tidy_Data.txt", fileEncoding='UTF-8', row.names = FALSE)
```

## How to load the Tidy Data into your local machine

This assume your current directory contains the tidy data.

```{r}
 data <- read.table("Final_Tidy_Data.txt", header = TRUE)
```

## Purpose of The Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

You should create one R script called run_analysis.R that does the following: 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## About The Dataset

### Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:


- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

### License:

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
