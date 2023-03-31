setwd("UCI HAR Dataset")

# Read the data files
subject_train <- read.table("./train/subject_train.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

subject_test <- read.table("./test/subject_test.txt")
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Merge the training and test data sets
subject <- rbind(subject_train, subject_test)
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)

# Extract only mean and standard deviation measurements
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features[, 2])
X <- X[, mean_std_features]

# Assign descriptive variable names
colnames(X) <- features[mean_std_features, 2]
colnames(y) <- "activity"
colnames(subject) <- "subject"
# Combine subject, activity, and extracted measurements into one data set
combined_data <- cbind(subject, y, X)

# Use descriptive activity names
combined_data$activity <- activity_labels[combined_data$activity, 2]

# Clean up variable names to make them more descriptive and readable
colnames(combined_data) <- gsub("([A-Za-z0-9])[-()]", "\\1_", colnames(combined_data))
colnames(combined_data) <- gsub("\\(\\)", "", colnames(combined_data))
colnames(combined_data) <- tolower(colnames(combined_data))

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- combined_data %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean = mean))

# Write the tidy data set to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

