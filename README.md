# About this script

## What is it?

run_analysis.R is the script that cleans the data and runs very simple analysis on it. Original data set and it's details description could be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data set contains the results of the activity recognition experiment carried out with 30 volunteers: each of them performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. These activity labels are found in the activityType column for each observation.  
The observations in the original data set are data from the embedded accelerometer and gyroscope which were used to capture 3-axial linear acceleration and 3-axial angular velocity. The resulting data set represents the means for each person for each activity for mean measurements. 

## Prerequisites


You need RStudio/RConsole to run this code and the original dataset. 



The dataset can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Please unzip it and change the name of the unzipped folder to 'activity'. 



The main script assumes that the 'activity' folder is in the working directory.

There are two ways you can do that: 

  

1. Type getwd() in your R console to find out what's the name of your working directory. Then copy 'activity' folder there
  

2. Use setwd('directoryname') to change the working directory to the one where the 'activity' folder is.



## How to run the script



Open run_analysis.R file in your RStudio and click "Source". Or just type source("run_analysis.R") in your R console. Make sure the R-script is in your working directory. 



## Where do I find the resulting dataset?


You will find it in your working directory. It's named tidy.txt. You can open it with the Notepad. If you want to a more structured version of the data, then type View(meanedData) and you will be able to see view results in RStudio. 



## What does this script do? 


In genearal it combines test and train data provided in the original dataset and calculates the means for various measurements for each ("Person" - "Activity Type") pair. In this dataset we refer to a person as a subject or ID. Activity type is activityType in the dataset. For mor detailed information please read CodeBook.md.