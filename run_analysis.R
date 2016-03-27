library(dplyr)

# start clean
message("Cleaning up...")
rm(list = ls())

# read reference data
message("Reading reference data...")
col_names_data <- read.table("features.txt", header = FALSE, sep = "")
col_names <- col_names_data[, 2]
rm(col_names_data)
mean_std_col_names_logical <- grepl("mean()|std()", col_names)
mean_std_col_names <- col_names[mean_std_col_names_logical]
mean_std_col_nums <- which(mean_std_col_names_logical == TRUE)
message("   col_names read.")

activity_labels <- read.table("activity_labels.txt", header = FALSE, sep = " ")
message("   activity_labels read.")

# read test and train data, merge with reference data
message("Reading test data...")
X_test <- read.table("test/X_test.txt", header = FALSE, sep = "", row.names = NULL)
message("   X_test read.")
subject_test <- read.table("test/subject_test.txt", header = FALSE)
message("   subject_test read.")
y_test <- read.table("test/y_test.txt", header = FALSE)
y_test_lbl <- merge(y_test, activity_labels, by.x = "V1", by.y = "V1")
message("   y_test read.")

message("Reading train data...")
X_train <- read.table("train/X_train.txt", header = FALSE, sep = "", row.names = NULL)
message("   X_train read.")
subject_train <- read.table("train/subject_train.txt", header = FALSE)
message("   subject_train read.")
y_train <- read.table("train/y_train.txt", header = FALSE)
y_train_lbl <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1")
message("   y_train read.")
rm(activity_labels)

# rbind test and train data sets
message("Merging data sets from test and train...")
X_all <- rbind(X_test, X_train)
y_all_lbl <- rbind(y_test_lbl, y_train_lbl)
subject_all <- rbind(subject_test, subject_train)
rm(X_test, X_train, y_test_lbl, y_train_lbl, subject_test, subject_train, y_test, y_train)

# extract all columns from rbind'ed data set with words "mean()" and "std()" in it
message("Extracting columns with mean() and std() from test and train data...")
X_all_mean_std <- select(X_all, mean_std_col_nums)
rm(X_all)
mean_std_col_new_names <- gsub("\\(\\)", "_", gsub("-", "", mean_std_col_names))
colnames(X_all_mean_std) <- mean_std_col_new_names

# add subject and activity data to extracted data set
message("Adding subject and activity data to test and train data...")
X_all_mean_std_1 <- cbind(activity = y_all_lbl$V2, X_all_mean_std)
X_all_mean_std_final <- cbind(subject = subject_all$V1, X_all_mean_std_1)

rm(y_all_lbl, subject_all, col_names, mean_std_col_names_logical, mean_std_col_nums, X_all_mean_std, X_all_mean_std_1)

# group by and summarise
X_all_group <- group_by(X_all_mean_std_final, subject, activity)
X_all_sumarise <- summarise_each(X_all_group, funs = "mean")
rm(X_all_group)

# write output to csv
write.csv(X_all_sumarise, file = "X_all_mean_std_vars_mean.csv")
message("Written final output to X_all_mean_std_vars_mean.csv")
