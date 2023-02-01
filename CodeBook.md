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




## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy.
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws
