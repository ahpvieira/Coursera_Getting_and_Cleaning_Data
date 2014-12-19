## Codebook

This document provides information about the original data sets, the study design used to collect them and the transformations performed to cleap up the data.  

### Data

The data sets are derived from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using). This database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The features selected for it come from the accelerometer and gyroscope 3-axial raw signals. Its total number of instances is 10,299 and of attributes is 561.

### Variables

Its recommended to check the original data set ```README.txt``` file for further details about its variables. The tidy data in ```tidy.txt``` contains 180 observations about 79 variables. It presents the average of each variable related only to the mean and standard deviation of the original features. They were appropriately labeled with descriptive names. In this sense, "TimeBodyAccMeanX", for example, means the mean value of the accelerometer axial raw signal in the X direction. Check ```features_info.txt``` in the original data set zip file for additional information about this used notation.   

### Transformations

Three kinds of basic transformations were performed on the raw data and are presented in the ```run_analysis.R``` script. They were made after merging the training and the test sets and creating only one data set.

1. Extraction of the measurements on the mean and standard deviation for each feature.
2. Descriptive labeling of the features variables and the activity values.
3. Creation of an independent tidy data set with the average of each feature variable for each activity and each subject.
