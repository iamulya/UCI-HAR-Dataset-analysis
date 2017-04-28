
## Source of the dataset

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

## Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Transformation

This analysis only considers the mean and standard deviations for each measurement

## Summary calculated

An independent data set is created, with the average of each variable for each activity and each subject

## Variables

Index  | Variable names | Variable Description
|---|---			|---	  |
"1" | "Subject" | "Subject"
"2" | "Activity" | "Activity"
"3" | "tBodyAcc mean in x" | "Body Linear Acceleration mean in x"
"4" | "tBodyAcc mean in y" | "Body Linear Acceleration mean in y"
"5" | "tBodyAcc mean in z" | "Body Linear Acceleration mean in z"
"6" | "tBodyAcc std in x" | "Body Linear Acceleration std in x"
"7" | "tBodyAcc std in y" | "Body Linear Acceleration std in y"
"8" | "tBodyAcc std in z" | "Body Linear Acceleration std in z"
"9" | "tGravityAcc mean in x" | "Gravity Acceleration mean in x"
"10" | "tGravityAcc mean in y" | "Gravity Acceleration mean in y"
"11" | "tGravityAcc mean in z" | "Gravity Acceleration mean in z"
"12" | "tGravityAcc std in x" | "Gravity Acceleration std in x"
"13" | "tGravityAcc std in y" | "Gravity Acceleration std in y"
"14" | "tGravityAcc std in z" | "Gravity Acceleration std in z"
"15" | "tBodyAccJerk mean in x" | "Body Linear Acceleration Jerk mean in x"
"16" | "tBodyAccJerk mean in y" | "Body Linear Acceleration Jerk mean in y"
"17" | "tBodyAccJerk mean in z" | "Body Linear Acceleration Jerk mean in z"
"18" | "tBodyAccJerk std in x" | "Body Linear Acceleration Jerk std in x"
"19" | "tBodyAccJerk std in y" | "Body Linear Acceleration Jerk std in y"
"20" | "tBodyAccJerk std in z" | "Body Linear Acceleration Jerk std in z"
"21" | "tBodyGyro mean in x" | "Body Angular Velocity mean in x"
"22" | "tBodyGyro mean in y" | "Body Angular Velocity mean in y"
"23" | "tBodyGyro mean in z" | "Body Angular Velocity mean in z"
"24" | "tBodyGyro std in x" | "Body Angular Velocity std in x"
"25" | "tBodyGyro std in y" | "Body Angular Velocity std in y"
"26" | "tBodyGyro std in z" | "Body Angular Velocity std in z"
"27" | "tBodyGyroJerk mean in x" | "Body Angular Velocity Jerk mean in x"
"28" | "tBodyGyroJerk mean in y" | "Body Angular Velocity Jerk mean in y"
"29" | "tBodyGyroJerk mean in z" | "Body Angular Velocity Jerk mean in z"
"30" | "tBodyGyroJerk std in x" | "Body Angular Velocity Jerk std in x"
"31" | "tBodyGyroJerk std in y" | "Body Angular Velocity Jerk std in y"
"32" | "tBodyGyroJerk std in z" | "Body Angular Velocity Jerk std in z"
"33" | "tBodyAccMag mean" | "Body Linear Acceleration mean"
"34" | "tBodyAccMag std" | "Body Linear Acceleration std"
"35" | "tGravityAccMag mean" | "Gravity Acceleration Magnitude mean"
"36" | "tGravityAccMag std" | "Gravity Acceleration Magnitude std"
"37" | "tBodyAccJerkMag mean" | "Body Linear Acceleration Jerk Magnitude mean"
"38" | "tBodyAccJerkMag std" | "Body Linear Acceleration Jerk Magnitude std"
"39" | "tBodyGyroMag mean" | "Body Angular Velocity Magnitude mean"
"40" | "tBodyGyroMag std" | "Body Angular Velocity Magnitude std"
"41" | "tBodyGyroJerkMag mean" | "Body Angular Velocity Jerk Magnitude mean"
"42" | "tBodyGyroJerkMag std" | "Body Angular Velocity Jerk Magnitude std"
"43" | "fBodyAcc mean in x" | "Gravity Acceleration mean in x(In Frequency Domain)"
"44" | "fBodyAcc mean in y" | "Gravity Acceleration mean in y(In Frequency Domain)"
"45" | "fBodyAcc mean in z" | "Gravity Acceleration mean in z(In Frequency Domain)"
"46" | "fBodyAcc std in x" | "Gravity Acceleration std in x(In Frequency Domain)"
"47" | "fBodyAcc std in y" | "Gravity Acceleration std in y(In Frequency Domain)"
"48" | "fBodyAcc std in z" | "Gravity Acceleration std in z(In Frequency Domain)"
"49" | "fBodyAcc mean frequency in x" | "Body Linear Acceleration mean frequency in x(In Frequency Domain)"
"50" | "fBodyAcc mean frequency in y" | "Body Linear Acceleration mean frequency in y(In Frequency Domain)"
"51" | "fBodyAcc mean frequency in z" | "Body Linear Acceleration mean frequency in z(In Frequency Domain)"
"52" | "fBodyAccJerk mean in x" | "Body Linear Acceleration Jerk mean in x(In Frequency Domain)"
"53" | "fBodyAccJerk mean in y" | "Body Linear Acceleration Jerk mean in y(In Frequency Domain)"
"54" | "fBodyAccJerk mean in z" | "Body Linear Acceleration Jerk mean in z(In Frequency Domain)"
"55" | "fBodyAccJerk std in x" | "Body Linear Acceleration Jerk std in x(In Frequency Domain)"
"56" | "fBodyAccJerk std in y" | "Body Linear Acceleration Jerk std in y(In Frequency Domain)"
"57" | "fBodyAccJerk std in z" | "Body Linear Acceleration Jerk std in z(In Frequency Domain)"
"58" | "fBodyAccJerk mean frequency in x" | "Body Linear Acceleration Jerk mean frequency in x(In Frequency Domain)"
"59" | "fBodyAccJerk mean frequency in y" | "Body Linear Acceleration Jerk mean frequency in y(In Frequency Domain)"
"60" | "fBodyAccJerk mean frequency in z" | "Body Linear Acceleration Jerk mean frequency in z(In Frequency Domain)"
"61" | "fBodyGyro mean in x" | "Body Angular Velocity mean in x(In Frequency Domain)"
"62" | "fBodyGyro mean in y" | "Body Angular Velocity mean in y(In Frequency Domain)"
"63" | "fBodyGyro mean in z" | "Body Angular Velocity mean in z(In Frequency Domain)"
"64" | "fBodyGyro std in x" | "Body Angular Velocity std in x(In Frequency Domain)"
"65" | "fBodyGyro std in y" | "Body Angular Velocity std in y(In Frequency Domain)"
"66" | "fBodyGyro std in z" | "Body Angular Velocity std in z(In Frequency Domain)"
"67" | "fBodyGyro mean frequency in x" | "Body Angular Velocity mean frequency in x"
"68" | "fBodyGyro mean frequency in y" | "Body Angular Velocity mean frequency in y"
"69" | "fBodyGyro mean frequency in z" | "Body Angular Velocity mean frequency in z"
"70" | "fBodyAccMag mean" | "Body Angular Velocity Magnitude mean(In Frequency Domain)"
"71" | "fBodyAccMag std" | "Body Linear Acceleration Magnitude std(In Frequency Domain)"
"72" | "fBodyAccMag mean frequency" | "Body Linear Acceleration Magnitude mean frequency"
"73" | "fBodyBodyAccJerkMag mean" | "Body Linear Acceleration Jerk Magnitude mean(In Frequency Domain)"
"74" | "fBodyBodyAccJerkMag std" | "Body Linear Acceleration Jerk Magnitude std(In Frequency Domain)"
"75" | "fBodyBodyAccJerkMag mean frequency" | "Body Linear Acceleration Jerk Magnitude mean frequency"
"76" | "fBodyBodyGyroMag mean" | "Body Angular Velocity Magnitude mean(In Frequency Domain)"
"77" | "fBodyBodyGyroMag std" | "Body Angular Velocity Magnitude std(In Frequency Domain)"
"78" | "fBodyBodyGyroMag mean frequency" | "Body Angular Velocity Magnitude mean frequency"
"79" | "fBodyBodyGyroJerkMag mean" | "Body Angular Velocity Jerk Magnitude mean(In Frequency Domain)"
"80" | "fBodyBodyGyroJerkMag std" | "Body Angular Velocity Jerk Magnitude std(In Frequency Domain)"
"81" | "fBodyBodyGyroJerkMag mean frequency" | "Body Angular Velocity Jerk Magnitude mean frequency"
