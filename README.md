Getting and Cleaning Data - Programming Assignment

This assignments refers to the analysis done on the data as provided in the link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The analysis is done using run_analysis.R script.

Instructions to use the run_analysis.R script.
1. Download the zip as mentioned in the link above in a local folder
2. Uncompress the zip file
3. Download the run_analysis.R script inside the folder "UCI HAR Dataset"
4. Ensure you see test and train folders at the same level as run_analysis.R
5. Start R/RStudio
6. Change working directory to the folder "UCI HAR Dataset" as created in step 2 above
7. execute command: source("run_analysis.R") in R/RStudio

Overview of script run_analysis.R
- loads reference data from activity_labels.txt and feature.txt from "UCI HAR Dataset" folder
- loads X_test.txt, y_test.txt, subject_test.txt from "test" sub-folder of "UCI HAR Dataset" folder
- loads X_train.txt, y_train.txt, subject_train.txt from "train" sub-folder of "UCI HAR Dataset" folder
- identifies column numbers of all those columns which have either the text "mean()" or text "std()" in the name
- joins the activity names with corresponding activity IDs
- vertically concatenates X, y and subject sets of test and train data
- extracts only mean and std columns as identified in earlier step
- horizontally concatenates X data with activity labels and subjects to get final data
- groups the final data set by subject and activity
- creates a separate data set with mean of each column except subject and activity
- writes this new data set to a CSV file named X_all_mean_std_vars_mean.csv in the same folder as "UCI HAR Dataset" folder

Columns written to final result set are provided below
- All these columns except subject and activity contain mean of the corresponding values from original data sets
- Result set contains one unique combination of subject and activity on each row
- the column names from original set are renamed to replace () with "_" (an underscore) and "-" (hyphens) are removed.

subject
activity
tBodyAccmean_X
tBodyAccmean_Y
tBodyAccmean_Z
tBodyAccstd_X
tBodyAccstd_Y
tBodyAccstd_Z
tGravityAccmean_X
tGravityAccmean_Y
tGravityAccmean_Z
tGravityAccstd_X
tGravityAccstd_Y
tGravityAccstd_Z
tBodyAccJerkmean_X
tBodyAccJerkmean_Y
tBodyAccJerkmean_Z
tBodyAccJerkstd_X
tBodyAccJerkstd_Y
tBodyAccJerkstd_Z
tBodyGyromean_X
tBodyGyromean_Y
tBodyGyromean_Z
tBodyGyrostd_X
tBodyGyrostd_Y
tBodyGyrostd_Z
tBodyGyroJerkmean_X
tBodyGyroJerkmean_Y
tBodyGyroJerkmean_Z
tBodyGyroJerkstd_X
tBodyGyroJerkstd_Y
tBodyGyroJerkstd_Z
tBodyAccMagmean_
tBodyAccMagstd_
tGravityAccMagmean_
tGravityAccMagstd_
tBodyAccJerkMagmean_
tBodyAccJerkMagstd_
tBodyGyroMagmean_
tBodyGyroMagstd_
tBodyGyroJerkMagmean_
tBodyGyroJerkMagstd_
fBodyAccmean_X
fBodyAccmean_Y
fBodyAccmean_Z
fBodyAccstd_X
fBodyAccstd_Y
fBodyAccstd_Z
fBodyAccmeanFreq_X
fBodyAccmeanFreq_Y
fBodyAccmeanFreq_Z
fBodyAccJerkmean_X
fBodyAccJerkmean_Y
fBodyAccJerkmean_Z
fBodyAccJerkstd_X
fBodyAccJerkstd_Y
fBodyAccJerkstd_Z
fBodyAccJerkmeanFreq_X
fBodyAccJerkmeanFreq_Y
fBodyAccJerkmeanFreq_Z
fBodyGyromean_X
fBodyGyromean_Y
fBodyGyromean_Z
fBodyGyrostd_X
fBodyGyrostd_Y
fBodyGyrostd_Z
fBodyGyromeanFreq_X
fBodyGyromeanFreq_Y
fBodyGyromeanFreq_Z
fBodyAccMagmean_
fBodyAccMagstd_
fBodyAccMagmeanFreq_
fBodyBodyAccJerkMagmean_
fBodyBodyAccJerkMagstd_
fBodyBodyAccJerkMagmeanFreq_
fBodyBodyGyroMagmean_
fBodyBodyGyroMagstd_
fBodyBodyGyroMagmeanFreq_
fBodyBodyGyroJerkMagmean_
fBodyBodyGyroJerkMagstd_
fBodyBodyGyroJerkMagmeanFreq_
