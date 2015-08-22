# Load the subject vectors: each observation contains the ID of the subject that performed the activity
subject_train <- read.table("./activity/train/subject_train.txt", header=FALSE, sep=",")
subject_test <- read.table("./activity/test/subject_test.txt", header=FALSE)

# Load labels vectors: each observation contains the id of the activity
labels_train <- read.table("./activity/train/y_train.txt", header=FALSE, sep=",")
labels_test <- read.table("./activity/test/y_test.txt", header=FALSE)

# Load labels codes: each obs contains activity id and the corresponding string that describes it
labels_codes <- read.table("./activity/activity_labels.txt", header = FALSE)

# Load train and test data 
X_train <- read.table("./activity/train/X_train.txt", header=FALSE)
X_test <- read.table("./activity/test/X_test.txt", header=FALSE)

#Load features: column names for the train and test data (not including subject ID)
features = read.table("./activity/features.txt", header=FALSE)

# Choose the the indeces of the features that contain the words mean or std
# This regex excludes meanFreq and angle(something, mean) because they are irrelevant for us
chosenFeatures = grep("mean\\b|std", features$V2)

library(dplyr)
#Choose only cols we need from both train and test sets
train = select(X_train, chosenFeatures)
test  = select(X_test, chosenFeatures)

# Select the column names from the features list according to our indices list
colnames = c("ID", "activityType", as.character(features$V2[chosenFeatures]))

# Edit the column names so that they look DESCRIPTIVE (well, at least our TA says this is descriptive :) )
colnames = gsub("Acc","Accelerometer", colnames, ignore.case = TRUE)              
colnames = gsub("Gyro", "Gyroscope", colnames,ignore.case = TRUE)
colnames = gsub("Mag", "Magnitude", colnames,ignore.case = TRUE)        
colnames = gsub("BodyBody", "Body",colnames,ignore.case = TRUE)
colnames = gsub("Std", "StandardDeviation", colnames,ignore.case = TRUE)        
colnames = gsub("mean","Mean",colnames)
colnames = make.names(colnames)
colnames = gsub("\\.*","",colnames)

#Combine the subject, labels vectors and the data for both test and train data
trainWSubject = cbind(subject_train, labels_train, train)
testWSubject = cbind(subject_test, labels_test, test)

#Finally combine the two datasets (train and test) into one
combinedData = rbind(trainWSubject, testWSubject)

#Assign the colnames for the selected columns
colnames(combinedData) = colnames

#Turn subjects and labels into factors
combinedData$activityType <- as.factor(combinedData$activityType)
levels(combinedData$activityType) = labels_codes$V2
combinedData$ID <- as.factor(combinedData$ID)


library(reshape2)
# turn into grouped table (by activityType)
tst = group_by(combinedData, activityType)
# turn wide-format data into long-format (ID-activityType pair is the row identificator)
cleanData <- melt(combinedData, id = c("ID", "activityType"))
# turn long-format into wide-format: again we use ID-activityType pair as identificator
meanedData <- dcast(cleanData, ID + activityType ~ variable, fun.aggregate = mean)

write.table(meanedData, "tidy.txt", row.names = FALSE, quote = FALSE)



