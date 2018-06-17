# Code Book
2018/06/17
## Human Activity Recognition Using Smartphones Data Set

## Project Description
The purpose of this project is to demonstrate the collection, manipulation,
and cleaning of a data set. The goal is to prepare tidy data that can be used for later analysis.

## The Data Set Information
The data used for yhis project was obtained from the Human Activity Recognition Using Smartphones Data Set,
The data collection was as follows:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities
>- WALKING
>- WALKING_UPSTAIRS
>- WALKING_DOWNSTAIRS
>- SITTING
>- STANDING
>- LAYING

>wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets,
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Data Files Used

- **README.txt** : Data set description
- **features_info.txt**: Shows information about the variables used on the feature vector.
- **features.txt**: List of all features.
- **activity_labels.txt**: Links the class labels with their activity name.
- **train/X_train.txt**: Training set.
- **train/y_train.txt**: Training labels.
- **test/X_test.txt**: Test set.
- **test/y_test.txt**: Test labels.

## Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Study design and data processing
The run_analysis.R script produces a tidy data that contains the relevent manipulations and
summaries. The steps taken by the script are as follows:

1. Load libraries (data.table)
2. Download the HAR dataset 
3. Unzip Human Activity Recognition dataset 
4. Read and merge X_test and X-train data
5. Read features.txt and set the labels as the new merged X data column names
6. Identify and extract the mean and standard deviation features from the X data
7. Read and merge y_test and y_train data
8. Read in activity labels and add it as a new column in the y data (for each row)
9. Read and Merge subject data and give descriptive column name ("Subject_ID")
10. Merge all data into a single dataset, reshape dataset
11. Write the dataset to a text file ("tidy_dataset.txt")

## The tidy_dataset.txt

The tidy file output at the end of the run_analysis.R script contains 68 variables with 180 rows,
and there are no missing data.
The variable data other than the identifiers are all the mean of the original data.

#### Variables
- Subject_ID 
- Activity
- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y 
- tBodyAcc-mean()-Z 
- tBodyAcc-std()-X 
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z 
- tBodyAccJerk-std()-X 
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y 
- tBodyGyro-mean()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z 
- tBodyGyroJerk-std()-X 
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-mean()
- tBodyAccMag-std() 
- tGravityAccMag-mean()
- tGravityAccMag-std()
- tBodyAccJerkMag-mean()
- tBodyAccJerkMag-std()
- tBodyGyroMag-mean()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-mean()
- tBodyGyroJerkMag-std()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-std()-X 
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z 
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-std()-X 
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z 
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z 
- fBodyAccMag-mean() 
- fBodyAccMag-std()
- fBodyAccMag-meanFreq() 
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-std()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-std() 
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean() 
- fBodyBodyGyroJerkMag-std()
- fBodyBodyGyroJerkMag-meanFreq()
