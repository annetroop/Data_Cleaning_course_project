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

## Expanded commentary on the variables occurring in the "variable" column

###Body Acceleration

* "tBodyAcc-mean-X"
* "tBodyAcc-mean-Y"              
* "tBodyAcc-mean-Z"              
* "tBodyAcc-std-X"               
* "tBodyAcc-std-Y"
* "tBodyAcc-std-Z" 
 
The overall acceleration sensed by the phone accelerometer in the given axis.

###Gravity Acceleration

* "tGravityAcc-mean-X" 
* "tGravityAcc-mean-Y"           
* "tGravityAcc-mean-Z" 
* "tGravityAcc-std-X"            
* "tGravityAcc-std-Y" 
* "tGravityAcc-std-Z"            

The amount of sensed acceleration attributable to gravity rather than the person.

### Acceleration Jerk 

* "tBodyAccJerk-mean-X"
* "tBodyAccJerk-mean-Y"              
* "tBodyAccJerk-mean-Z"              
* "tBodyAccJerk-std-X"               
* "tBodyAccJerk-std-Y"
* "tBodyAccJerk-std-Z" 

The derivative of Acceleration.

### Gyro

* "tBodyGyro-mean-X"
* "tBodyGyro-mean-Y"              
* "tBodyGyro-mean-Z"              
* "tBodyGyro-std-X"               
* "tBodyGyro-std-Y"
* "tBodyGyro-std-Z" 

Angular velocity, 3-axial.

### GyroJerk  

* "tBodyGyroJerk-mean-X"
* "tBodyGyroJerk-mean-Y"              
* "tBodyGyroJerk-mean-Z"              
* "tBodyGyroJerk-std-X"               
* "tBodyGyroJerk-std-Y"
* "tBodyGyroJerk-std-Z" 

The derivative of the Gyro variables in the given axis.

### Magnitude Of Body Acceleration 

* "tBodyAccMag-mean" 
* "tBodyAccMag-std"              
The Euclidean norm of the Body Acceleration, that is,  sqrt(x^2 + y^2 + z^2) where x, y, and z are the BodyAcceleration-X, BodyAcceleration-Y and BodyAcceleration-Z.

### MagnitudeOfGravityAcceleration

* "tGravityAccMag-mean"
* "tGravityAccMag-std"

The Euclidean norm of the Gravity Acceleration measurement variable.

### Magnitude Of Gyro

The Euclidean norm of the Gyro measurement variable.

* "tBodyGyroMag-mean"
* "tBodyGyroMag-std"             

### Magnitude Of Gyro Jerk

The Euclidean norm of the Gyro Jerk (derivative of Gyro) measurement variable.

* "tBodyGyroJerkMag-mean"
* "tBodyGyroJerkMag-std"         


### Fourier Of Body Acceleration

* "fBodyAcc-mean-X"
* "fBodyAcc-mean-Y" 
* "fBodyAcc-mean-Z"
* "fBodyAcc-std-X" 
* "fBodyAcc-std-Y"
* "fBodyAcc-std-Z" 

### FourierOfBodyAccelerationMeanFrequency
* "fBodyAcc-meanFreq-X"
* "fBodyAcc-meanFreq-Y"          
* "fBodyAcc-meanFreq-Z"           

### FourierOfBodyAccelerationJerk
* "fBodyAccJerk-mean-X"          
* "fBodyAccJerk-mean-Y"
* "fBodyAccJerk-mean-Z"          
* "fBodyAccJerk-std-X"
* "fBodyAccJerk-std-Y"           
* "fBodyAccJerk-std-Z"            

### FourierOfBodyAccelerationJerkMeanFrequency
* "fBodyAccJerk-meanFreq-X"      
* "fBodyAccJerk-meanFreq-Y"
* "fBodyAccJerk-meanFreq-Z"      

### FourierOfGyroValue
* "fBodyGyro-mean-X"
*  "fBodyGyro-mean-Y"             
* "fBodyGyro-mean-Z"
* "fBodyGyro-std-X"              
* "fBodyGyro-std-Y"
* "fBodyGyro-std-Z"              

### FourierOfGyroValueMeanFrequency
* "fBodyGyro-meanFreq-X"
* "fBodyGyro-meanFreq-Y"         
* "fBodyGyro-meanFreq-Z"          

### FourierOfMagnitudeOfBodyAcceleration

* "fBodyAccMag-mean"             
* "fBodyAccMag-std"
* "fBodyAccMag-meanFreq"         

uh, what?  what's BodyBody mean???
* "fBodyBodyAccJerkMag-mean"
* "fBodyBodyAccJerkMag-std"       

* "fBodyBodyGyroMag-mean"        
* "fBodyBodyGyroMag-std"          

* "fBodyBodyGyroJerkMag-mean"
* "fBodyBodyGyroJerkMag-std"     








## Activities

There are 6 possibilities for what the volunteers were doing during a measurement:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The column numericActivity lists the number; the column Activity has the name.