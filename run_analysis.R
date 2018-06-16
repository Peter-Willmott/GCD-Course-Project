#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#load required packages
library(data.table)

#Download Zip 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fn <- "FUCIHARDataset.zip"
download.file(url, fn)

#Unzip folder
unzip("FUCIHARDataset.zip", files = NULL, exdir=".")

#Read and Merge X data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_data <- rbind(x_train,x_test)

#Read in features and set as the column names of merged X data 
features <- read.table("UCI HAR Dataset/features.txt")
features <- features[,2]
colnames(x_data) <- features

#Extract the measurements of the mean and standard deviation
mean_std_index <- grepl("mean|std", features)
mean_std <- x_data[,mean_std_index]

#Read and Merge y data
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_data <- rbind(y_train,y_test)

#Read in activity labels and add it as a new column in the y data (for each row)
#Add descriptive column names
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels <- activity_labels[,2]
y_data[,2] <- activity_labels[y_data[,1]]
colnames(y_data) <- c("Activity_ID", "Activity")

#Read and Merge subject data and give descriptive column name
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_data <- rbind(subject_train,subject_test)
colnames(subject_data) <- c("Subject_ID")

#Merge all data into a single dataset, reshape dataset
combined_data <- cbind(subject_data, y_data, mean_std)
combined_data_melted <- melt(combined_data, id = c("Subject_ID", "Activity_ID", "Activity"), measure.vars = setdiff(colnames(combined_data), c("Subject_ID", "Activity_ID", "Activity")))
tidy_data <- dcast(combined_data_melted, Subject_ID + Activity ~ variable, mean)

#Write the dataset to a text file
write.table(tidy_data, file = "tidy_dataset.txt", sep = ",")
