# The Code Book 



## About this data set


Please read the ReadMe.md file before working with the data set. 



## Understanding column names


Each row in the dataset is an observation for 1 person and the activity (s)he perforemd. Here is an overview of the columns of this data set:

* ID: the id of the person who performed the activity, range: 1-30

* activityType: a factor variable that represents the type of the activity performed by the subject. Levels: WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* Columns 3-68 represent the mean values for the measurements. 

* Abbreviations used are: 

* * Prefix 't' denotes time, prefix 'f' - frequency. 

* * '-XYZ' denotes 3-axial signals in the X, Y and Z directions.



## How does this script work

In general, all the steps are described in the code in great detail (in comments). Here you will see just a general description of the proces. 



0. I loaded the following files as data tables: 
* * Column names for measurements: features.txt
* * Subject (volunteers') ids: subject_train.txt, subject_test.txt
* * Activity ids: y_train.txt, y_test.txt
* * Activity labels: activity_labels.txt
* * Measurements: X_train.txt, X_test.txt
1. First I the features.txt file and extracted the feature names strings. Using a regular expression (with grep function), I selected only those that represent mean or standard deviation. As a result I obtained the list indices. 

2. Using the indices vector, I made subsets of the test and train tables choosing only columns that contain mean and standard deviation.

3. I turned turned the fetures strings into descriptive column names, sequentially replacing all the abbreviations with the full names. 

4. I binded together activity ids, subject ids and measurements data frame for both test and train tables. Then I binded together the test and the train sets. 

5. I added the column names (obtained in step 3) to the combined data set. Then I changed the type of the activityType column from character to factor. 

6. Next I grouped the data by activity type and then converted the wide-format data into long-format data using melt function (from reshape2 package).

7. Using dcast function I converted the long-format data back to wide-format apllying the mean function (as aggregation function).

## Questions about the original data set?


If you have any questions on how this data was gathered, please refer to the original data set, which you can find [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) along with the detaild description of the experiment. 