# Getting-and-Cleaning-Data-project
Contains components for final project in Coursera Getting and Cleaning Data course

by Alice England

This project includes getting and cleaning wearable data collected from accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project was downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Information on the Samsung data 
### (excerpts from the README.txt file provided with the dataset):
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:

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

#### Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

#### License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.


## Information on the run_analysis.R script
This script achieves the objectives of the assignment. The script produces a data set that merges the training and test data sets, adds decsriptive variable names, updates the activity values to descriptive activity names, extracts only the measurements on the mean and standard deviation for each measurement. It accomplishes this through the following steps:
1. Creates vector containing the column names for both the test and training data sets from the provided features.txt file. No changes are made to the given feature names.
2. Creates a data table (single column) containing the training subject numbers from the provided subject_train.txt file.
3. Creates a data table (single column) containing the activity numbers from the Y_train.txt file. The activity numbers are replaced with descriptions of the activities provided in the activity_labels.txt file.
4. The training data set is read from the provided X_train.txt file with the variable names added as column names. Only the columns containing mean or standard deviations are selected (column names that contain "mean()" or "std()"). After this, columns for the subject numbers and activity descriptions (created in steps 2, 3 above) are added. The resulting data table is 7352 rows by 68 columns.
5. Steps 2-4 are repeated for the test data set using the provided files corresponding to the test data set. The resulting data table is 2947 rows by 68 columns.
6. Finally the training and test data sets are combined (training on top, test on the bottom) to create the final merged data set that contains 10299 rows and 68 columns.

The second objective of the assignment is to create a tidy data set with the average of each variable for each activity and each subject. This is accomplished in the last portion of the script by grouping the merged data set by subject and activity, then summarizing the mean of each variable (column).

#### Notes:
Please see the provided code book (CodeBook.md) that describes the variables in the merged data set and the tidy data set.
