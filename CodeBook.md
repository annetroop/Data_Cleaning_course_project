# Code Book

## Variables

### subject_id

Identifies which volunteer the data comes from.

### activity

Identifies what physical activity the volunteer was performing at the time of these measurements.

### variable

Variable is the name of one of the original measurement types which was already a mean or standard deviation.  (I interpreted meanFreq to not be a mean of a measurement and did not include those.) More discussion of these further down. 

### mean(value)

The fourth column in the data set is the mean value for the set of observations of variable for the given subject_id and activity. (Even if that's the mean of the standard deviation, such as for tBodyGyro.std.X.)

## Meanings of the variables occurring in the "variable" column

###Acceleration
* Acceleration-X
* Acceleration-Y
* Acceleration-Z

The overall acceleration sensed by the phone accelerometer in the given axis.

###GravityAcceleration
* GravityAcceleration-X
* GravityAcceleration-Y
* GravityAcceleration-Z

The amount of sensed acceleration attributable to gravity rather than the person.

### AccelerationJerk 

The derivative of Acceleration.

### GyroValue 

Angular velocity, 3-axial.

### GyroJerk  

The derivative of GyroValue.

### MagnitudeOfBodyAcceleration 

The Euclidean norm of the Body Acceleration, that is,  sqrt(x^2 + y^2 + z^2) where x, y, and z are the BodyAcceleration-X, BodyAcceleration-Y and BodyAcceleration-Z.

### MagnitudeOfGravityAcceleration

The Euclidean norm of the Gravity Acceleration.








## Activities

There are 6 possibilities for what the volunteers were doing during a measurement:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The column numericActivity lists the number; the column Activity has the name.