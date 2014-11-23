# Codebook

This is codebook describing source of data, task and the desired result of Getting and Cleaning Data Project.

[0] "subjectId" : integer
1,2,...,24. 
Number identyfing the subject.

[1]"activityId": character
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

Label identyfying performed activity type

[2] Each of below variables meanOfExampleVariable is computed as mean of all values of ExampleVariable variable performed by one subject during one activity.

Each variable is of numeric type, is normalized and bounded in [-1,1]. 

Originally they come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Mean: Mean value
Std: Standard deviation

The complete list of variables is as follows:

  
 [3]"meanOftBodyAccMeanX"            "meanOftBodyAccMeanY"           
 [5] "meanOftBodyAccMeanZ"            "meanOftBodyAccStdX"            
 [7] "meanOftBodyAccStdY"             "meanOftBodyAccStdZ"            
 [9] "meanOftGravityAccMeanX"         "meanOftGravityAccMeanY"        
[11] "meanOftGravityAccMeanZ"         "meanOftGravityAccStdX"         
[13] "meanOftGravityAccStdY"          "meanOftGravityAccStdZ"         
[15] "meanOftBodyAccJerkMeanX"        "meanOftBodyAccJerkMeanY"       
[17] "meanOftBodyAccJerkMeanZ"        "meanOftBodyAccJerkStdX"        
[19] "meanOftBodyAccJerkStdY"         "meanOftBodyAccJerkStdZ"        
[21] "meanOftBodyGyroMeanX"           "meanOftBodyGyroMeanY"          
[23] "meanOftBodyGyroMeanZ"           "meanOftBodyGyroStdX"           
[25] "meanOftBodyGyroStdY"            "meanOftBodyGyroStdZ"           
[27] "meanOftBodyGyroJerkMeanX"       "meanOftBodyGyroJerkMeanY"      
[29] "meanOftBodyGyroJerkMeanZ"       "meanOftBodyGyroJerkStdX"       
[31] "meanOftBodyGyroJerkStdY"        "meanOftBodyGyroJerkStdZ"       
[33] "meanOftBodyAccMagMean"          "meanOftBodyAccMagStd"          
[35] "meanOftGravityAccMagMean"       "meanOftGravityAccMagStd"       
[37] "meanOftBodyAccJerkMagMean"      "meanOftBodyAccJerkMagStd"      
[39] "meanOftBodyGyroMagMean"         "meanOftBodyGyroMagStd"         
[41] "meanOftBodyGyroJerkMagMean"     "meanOftBodyGyroJerkMagStd"     
[43] "meanOffBodyAccMeanX"            "meanOffBodyAccMeanY"           
[45] "meanOffBodyAccMeanZ"            "meanOffBodyAccStdX"            
[47] "meanOffBodyAccStdY"             "meanOffBodyAccStdZ"            
[49] "meanOffBodyAccJerkMeanX"        "meanOffBodyAccJerkMeanY"       
[51] "meanOffBodyAccJerkMeanZ"        "meanOffBodyAccJerkStdX"        
[53] "meanOffBodyAccJerkStdY"         "meanOffBodyAccJerkStdZ"        
[55] "meanOffBodyGyroMeanX"           "meanOffBodyGyroMeanY"          
[57] "meanOffBodyGyroMeanZ"           "meanOffBodyGyroStdX"           
[59] "meanOffBodyGyroStdY"            "meanOffBodyGyroStdZ"           
[61] "meanOffBodyAccMagMean"          "meanOffBodyAccMagStd"          
[63] "meanOffBodyBodyAccJerkMagMean"  "meanOffBodyBodyAccJerkMagStd"  
[65] "meanOffBodyBodyGyroMagMean"     "meanOffBodyBodyGyroMagStd"     
[67] "meanOffBodyBodyGyroJerkMagMean" "meanOffBodyBodyGyroJerkMagStd"

Giving 68 variables altogether in the tidy data set.
