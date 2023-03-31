# CodeBook for the Human Activity Recognition Using Smartphones Dataset

This codebook describes the variables, data, and transformations performed on the original dataset to create the tidy dataset submitted for the Getting and Cleaning Data Course Project.

## Original Dataset

The original dataset represents data collected from the accelerometers of the Samsung Galaxy S smartphone during various activities performed by 30 subjects. The dataset can be found at the following link:

[Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Tidy Dataset

The submitted tidy dataset contains the average of each variable for each activity and each subject. The dataset has 180 rows (30 subjects * 6 activities) and columns representing the mean and standard deviation of various accelerometer and gyroscope measurements.

### Variables

- `subject`: An identifier of the subject who carried out the experiment. Its range is from 1 to 30.
- `activity`: The type of activity performed by the subject when the measurements were taken. There are six possible activities:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

The remaining variables in the dataset represent the average of each measurement for each activity and each subject. The measurements are the mean and standard deviation of various accelerometer and gyroscope signals. The variable names are based on the following components:

- `t`: Time domain signals
- `f`: Frequency domain signals
- `Acc`: Accelerometer measurements
- `Gyro`: Gyroscope measurements
- `Jerk`: Jerk signals (time derivative of the signals)
- `Mag`: Magnitude of the signals calculated using the Euclidean norm
- `mean`: Mean value of the signals
- `std`: Standard deviation of the signals
- `X`, `Y`, `Z`: The axis along which the measurement was taken

For example, the variable `tBodyAcc-mean()-X` represents the average of the mean time-domain body acceleration signal along the X-axis for each activity and each subject.

### Transformations

The following steps were performed to create the submitted tidy dataset:

1. Merged the training and test datasets to create a single dataset.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the dataset.
4. Appropriately labeled the dataset with descriptive variable names.
5. Created a second, independent tidy dataset with the average of each variable for each activity and each subject.

Refer to the "run_analysis.R" script in the GitHub repository for the detailed code implementation of these transformations.
Units

The original dataset measurements were normalized and bounded within the range of [-1, 1]. Therefore, the units for the measurements in the tidy dataset are dimensionless, as they represent the average of the normalized values.
Additional Notes

The original dataset contained several other measurements that were not included in the submitted tidy dataset, as the project instructions specifically asked to extract only the mean and standard deviation measurements. Other files not included in this analysis include the "Inertial Signals" folder.

For more information about the original dataset, please refer to the "README.txt" and "features_info.txt" files included in the original dataset.


