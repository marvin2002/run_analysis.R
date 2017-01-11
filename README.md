# run_analysis.R

The file has a run_analysis.R that has the functions made to answer five requirements which are:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3.  Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Once the code is run those requirements are fullfill. Yet, it is explained along the way on each line. In that way you should not have so much problem when checking the code. 
The final result comes with two data frames:
1) data_selected: this comes with all the observation from selected columns.
2) summary_data: this comes with an average of the variables that are the predictors ordered by subject(id) and prediction(activity)


The above data frames have 68 columns each, it is divided in three parts:

a) id: names the subject from whom the data comes from.

b) activity: gives the activity of the person ( the prediction) as per the variables and transformation of them.

c) all the other columns: those are the selection of the mean and standar deviation of the predictors 66 out of 561.


Within that column are measuments that were taken with the accelerometer and gyroscope of the samsung II as
which is divided further in a way that the following means:

t : time

f: fast fourier transformation

B: Body

X, Y, Z: the axial acceleration or angular orientation

Gyro: angular velocity from the gyroscope

ACC: acceleration from the accelerometer

std: standar deviation
