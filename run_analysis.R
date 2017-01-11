##Read feature.txt that contains the names of the columns for X_train.txt, Y_test.txt.

list_features <- read.table("./UCI HAR Dataset/features.txt")
names(list_features) <- c("n", "variable")

####TEST DATA

subject_tst <- read.table("./UCI HAR Dataset/test/subject_test.txt") #ID of the subject who carry out the activity.
#21 subjects.
x_tst <- read.table("./UCI HAR Dataset/test/X_test.txt") #561 variables to predict.
y_tst <- read.table("./UCI HAR Dataset/test/y_test.txt") #predicts one of the activity labels [1-6]

####TRAIN DATA

subject_trn <- read.table("./UCI HAR Dataset/train/subject_train.txt") #ID of the subject who carry out the activity.
#9 subjects.
x_trn <- read.table("./UCI HAR Dataset/train/X_train.txt") #561 variables to predict.
y_trn <- read.table("./UCI HAR Dataset/train/y_train.txt") #predicts one of the activity labels [1-6]


###MERGE DATA: 1. Merges the training and the test sets to create one data set.

subjects <- rbind(subject_trn, subject_tst) #join into one data the train and test ones the ID from which the obs comes from.
prediction <- rbind(y_trn, y_tst) #join into one data the results for the predictions [1-6] activity labels.
predictors <- rbind(x_trn, x_tst) #join into one data the variables to use to make the prediction.

## Name columns of predictors that is the data frame that contains merged X_train.txt and Y_test.txt files.
## name column of subjects and precition as well.
names(subjects) <- c("id")
names(prediction) <- c("activity")
names(predictors) <- list_features$variable

##bind subject, prediction and predictors in one data frame.

all_data <- cbind(subjects, prediction, predictors)

###2. Extracts only the measurements on the mean and standard deviation for each measurement.

mean_columns <- grep("[Mm][Ee][Aa][Nn]\\(\\)", names(all_data)) #index of columns with mean() variable estimated as per features_info.txt.
std_columns <- grep("[Ss][Tt][Dd]\\(\\)", names(all_data)) #index of columns with std() variable estimated as per features_info.txt.

mean_std <- subset(all_data, select=c( mean_columns, std_columns))

##3.  Uses descriptive activity names to name the activities in the data set

##First, Read activity_labels.txt 

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("n", "activity")
activity_labels$activity <- tolower(activity_labels$activity)
####Set up labels for activity column in all_data.

activity <- factor(prediction$activity, levels = c(1, 2, 3, 4, 5, 6), labels = activity_labels$activity)
data_selected <- cbind(subjects, activity, mean_std)

### 4. Appropriately labels the data set with descriptive variable names.


names(data_selected) <- sub("\\(\\)", "", names(data_selected))
names(data_selected) <- sub("[Body]{2,}", "B", names(data_selected))

###5. From the data set in step 4, creates a second,
## independent tidy data set with the average of each variable for each activity and each subject.

melt_data_selected <- melt(data_selected, id.vars = c("id", "activity"), measure.vars = c(3:68))
summary_table <- dcast(tmp0, id+activity~ variable,  mean)
