# Dillinger



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