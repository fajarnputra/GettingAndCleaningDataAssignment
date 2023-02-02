# Codebook for the final Tidy Data (Final_Tidy_Data.txt)

This file will exsplain infromation contain in the tidy data and other relevant information.
First, this data is contain about 88 variables/columns and each column is a unique variable for each observation/row. 

## Description of the variables/columns
Out of 88 variables, 2 of them contain information about subject and activity while the rest is about the featured measurements. 

| No  | Variable/Column | Variable Type | Range | Description |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| 1  | Subject  | Numeric (Double)  | 1:30  | Contain ID of a subject. In this subject there is a 30 subjects involved |
| 2  | Activity  | Factor  | 1:6  | Contain type of activities. Such as: <br/> 1 = WALKING <br/> 2 = WALKING UPSTAIRS <br/> 3 = WALKING DOWNSTAIRS  <br/> 4 = SITTING  <br/> 5 = STANDING  <br/> 6 = LAYING |
| 3  | [t/f][Variable Name]-[mean/std()]-[X/Y/Z]| Integer  | -1:1  | This is a explanation for the rest of the variables: <br/> 1. [t/f] t is a Time domain while f is a Frequency domain <br/> 2. [Variable Name] is a name of feature measured. for complete information check the website manual <br/> 3. [mean/std()] mean means average of feature measurement while std is for the standard deviation <br/> 4. [X/Y/Z] This is the Axis movement  |

Based on the information from the raw data there is many set of variables estimated from the segnal but we only filtered for the `mean()` and `std()` measurement and in the end we average the value based on `Activity` and `Subject` variables to produce tidy data with **180 rows**
## Feature Selection (From the Raw Data)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ <br/>
tGravityAcc-XYZ <br/>
tBodyAccJerk-XYZ <br/>
tBodyGyro-XYZ <br/>
tBodyGyroJerk-XYZ <br/>
tBodyAccMag <br/>
tGravityAccMag <br/>
tBodyAccJerkMag <br/>
tBodyGyroMag <br/>
tBodyGyroJerkMag <br/>
fBodyAcc-XYZ <br/>
fBodyAccJerk-XYZ <br/>
fBodyGyro-XYZ <br/>
fBodyAccMag <br/>
fBodyAccJerkMag <br/>
fBodyGyroMag <br/>
fBodyGyroJerkMag <br/>

The set of variables that were estimated from these signals are: 

mean(): Mean value <br/>
std(): Standard deviation <br/>
mad(): Median absolute deviation  <br/>
max(): Largest value in array <br/>
min(): Smallest value in array <br/>
sma(): Signal magnitude area <br/>
energy(): Energy measure. Sum of the squares divided by the number of values.  <br/>
iqr(): Interquartile range  <br/>
entropy(): Signal entropy <br/>
arCoeff(): Autorregresion coefficients with Burg order equal to 4 <br/>
correlation(): correlation coefficient between two signals <br/>
maxInds(): index of the frequency component with largest magnitude <br/>
meanFreq(): Weighted average of the frequency components to obtain a mean frequency <br/>
skewness(): skewness of the frequency domain signal  <br/>
kurtosis(): kurtosis of the frequency domain signal  <br/>
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. <br/>
angle(): Angle between to vectors. <br/>

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean <br/>
tBodyAccMean <br/>
tBodyAccJerkMean <br/>
tBodyGyroMean <br/>
tBodyGyroJerkMean <br/>


### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
