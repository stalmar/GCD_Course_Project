=================================
Getting and Cleaning Data project
=================================

# The goal of the project

The goal of the project was to create one tidy data set out of several
data sets, containing data collected from the accelerometers from the Samsung Galaxy S smartphone.

The data was splitted into training and test sets. Description of activities measured and variables estimated from them, as well as names of activities were dispersed among many text files.

In order to complete the task one had to merge data sets, include propoer variables and activities names, rename them for better readability and summarize the data computing the means of extracted variables (which were means themselves) according to subject and activity type.

# The original data sets and experiment design.

## Source and licence

The data for the project were taken from [here][https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ]

The full description of data is avaliable [here][http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ]

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

## Experiment design

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, authors captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables

In original data set for each record there were:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For the project's use we only utilized variables which described means or standard deviation, which we identified as having either "mean" or "std" in their names. 

All the variables, finally used (averaged) in the project's course are described in GCD_Codebook.

All original features were normalized and bounded within [-1,1].Since our features are averages of them, the same holds true.

Every row in the tidy data set contains subject id, activitity type and the means of each variable on the pair (subject id, activitity type).

# Data and code

Repository for the project contains:

- raw data set UCI HAR Dataset, described in details in its own Readme
- script run_analysis.R, which performs all necessary tasks
- GCD_Codebook, describing all the variables used
- this GCD_readme, descrining context, data and run_analysis.R script

# run_analysis R script

Assuming that the reader is in the right working directory, script first downloades the data from web, recording the time, uzips it to the working directory and removes the zipped file. 

Having dowloaded them on disk, script loades into R train and test: activity labels, main activity data and data identyfing subjects performing activities.

Additional tables which include features dictionary (variables names) and activities dictionary (activities names) are also loaded.

After merging these sets and renaming variables and activities according to dictonaries, we extract only variables describing means or standard deviation, excluding variables containing meanFreq.

Then script changes names of variables slightly, removing special signs (including "-" and "()") and changing some lower to upper cases, to make variables names more readable.

As next step we aggregate the data to take mean of all the extracted variables with respect to subject and activity type and change the variable name again to indicate that they are next level means.

Finally, we export tidy data set as tidySubjectActivitiesData.txt. It can be loaded into R with read.table(), keeping header = TRUE.
 

