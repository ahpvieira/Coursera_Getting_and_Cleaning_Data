## Getting and Cleaning Data Course Project

This repository contains the work I submitted for the Getting and Cleaning Data Course Project, which is part of the [Johns Hopkins Data Science Specialization in Coursera](https://www.coursera.org/specialization/jhudatascience/1).

### Purpose of the project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The students were required to submit:

1. Tidy data set from the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
2. Codebook describing the variables, the data, and any transformations performed on the raw data.
3. R code for performing the analysis.

### The R code

The ```run_analysis.R``` script performs five steps through which the raw data is transformed into the tidy data contained in ```tidy.txt```. First of all, it merges the test and training sets to create one data set. Then, the variables with the measurements on the mean and standard deviation are extracted. The columns containing the activities each person performed in the experiment receives descriptive labels, as well as the variables with the measurements (or "features"). Finally, the scripts creates from this transformed data set, an independent one with the average of each variable for each activity and each subject. 

### Using the code book

The code book is one of the components of every tidy data. It contains information about the variables (and its values) in the data set not contained in the tidy data, the summary choices I made and the experimental study design I used.
