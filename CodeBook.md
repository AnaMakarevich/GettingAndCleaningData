# The Code Book 



## About this data set


Please read the ReadMe.md file before working with the data set. 



## Understanding column names


Each row in the dataset is an observation for 1 person (also refered to as subject) and the activity (s)he perforemd. Here is an overview of the columns of this data set:

* ID: the id of the person who performed the activity, range: 1-30

* activityType: a factor variable that represents the type of the activity performed by the subject. Levels: WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* Columns 3-68 represent the mean values for the measurements. 

* Abbreviations used are: 

* * Prefix 't' denotes time, prefix 'f' - frequency. 

* * '-XYZ' denotes 3-axial signals in the X, Y and Z directions.



## How does this script work

In general, all the steps are described in the code in great detail (in comments). Here I just give the sequence of steps performed to obtain the tidy data set. 

Here is the list of the files I used to create the tidy data set:

* features.txt - this was used for column names for the whole data set
* subject_train.txt, subject_test.txt - these two represent the ids of the volunteers (ID column in the tidy data set)
* y_train.txt, y_test.txt - these are activity ids (activityType column in the tidy data set)
* activity_labels.txt - string labels for activity ids
* X_train.txt, X_test.txt - measurements, the core part of the dataset


1. First I extracted the feature names (from features.txt). Using a regular expression (with grep function), I selected only those that represent mean or standard deviation. As a result I obtained a vector of indices. 

2. Using the indices vector, I made subsets of the test and train tables choosing only columns that contain mean and standard deviation.

3. I turned the fetures strings into descriptive column names, sequentially replacing all the abbreviations with the full names and cleaning them. 

4. I binded together activity ids, subject ids and measurements data frame for both test and train tables. Then I binded together the test and the train sets. 

5. I added the column names (obtained in step 3) to the combined data set. Then I changed the type of the activityType column from character to factor. 

6. Next I grouped the data by activity type and then converted the wide-format data into long-format data using melt function (from reshape2 package).

7. Using dcast function I converted the long-format data back to wide-format apllying the mean function (as aggregation function).
8. Finally I wrote the resulting data set to txt file. 
9. DONE. :)

## Questions about the original data set?


If you have any questions on how the data was gathered, please check the original data set, which you can find [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) along with the detaild description of the experiment. 