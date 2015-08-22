# About this script

## What is it?

This is a script that cleans the data and runs very simple analysis on it. 
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The original data set contains the results of the activity recognition experiment carried out with 30 volunteers. Here is the description from the original readme file (for the original data set):


"Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."




## Prerequisites


You need RStudio/RConsole to run this code and the original dataset. 



The dataset can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Please unzip it and change the name of the unzipped folder to 'activity'. 



The main script is supposed to run in the same directory where the folder with the data is. It's assumed that the user has the folder named 'activity' in his working directory. 

There are two ways you can do that: 

  

1. Type getwd() in your R console to find out what's the name of your working directory. Then copy 'activity' folder there
  

2. Use setwd('directoryname') to change the working directory to the one where the data folder is.



## How to run the script



Open run_analysis.R file in your RStudio and click "Source". Or just type source("run_analysis.R") in your console. Make sure the R-script is in your working directory. 



## Where do I find the resulting dataset?


You will find it in your working directory. It's named tidy.txt. You can open it with the Notepad. If you want to a more structured version of the data, then type View(meanedData) and you will be able to see view results in RStudio. 



## What does this script do? 


In genearal it combines test and train data provided in the original dataset and calclulates the means for various measurements for each ("Person" - "Activity Type") pair. In this dataset we refer to a person as a subject or ID. Activity type is activityType in the dataset. This script also brushes up the variable names so that they are more readable for you. 