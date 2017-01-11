# run_analysis.R

The first tidy data comes with 68 columns, it is divided in three parts:

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
