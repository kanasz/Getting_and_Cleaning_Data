CodeBook
===================
Introduction
-------------------
This code book file describes the data, variables and the work that has been performed to clean up the data. The R code is presended in the file `run_analysis.R`. 

Data Set Information
-------------------
The original data were obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Data Transformation Steps
-------------------
In this section are described all of the transformations which are appliet to get and clean up the data. Analysis starts with running of `runAnalysis` function. 

This function will call 5 methods.

File			        |Step
------------------------|--------------------------------------------- 
downloadData 		    |1. downloads the data from the web
getMergedData 		    |2. import the data from train and test files, 
			            |3. merge train and test data
getCleanedData  	    |4. import features data and rename variables,  
			            |5. get data only for means and stds, 
			            |6. get full activity names, 
 			            |7. set names for activities and subjects.
 			            |8. merge data into one data frame.
getComputedMeans 	    |9. calculate the mean for each variable
saveData 		        |10. export data to the file

Variables Description
-------------------
In the file `tidy_data.txt` are variables:
1. Subject.
2. Activity.
3. Other variables that represent measurements from accelerometer and gyroscope.

Data Columns
-------------------
	"subject"	
	"activity"	
	"tBodyAccmeanX"	
	"tBodyAccmeanY"	
	"tBodyAccmeanZ"	
	"tBodyAccstdX"	
	"tBodyAccstdY"	
	"tBodyAccstdZ"	
	"tGravityAccmeanX"		
	"tGravityAccmeanY"
	"tGravityAccmeanZ"
	"tGravityAccstdX"
	"tGravityAccstdY"
	"tGravityAccstdZ"
	"tBodyAccJerkmeanX"
	"tBodyAccJerkmeanY"
	"tBodyAccJerkmeanZ"
	"tBodyAccJerkstdX"
	"tBodyAccJerkstdY"
	"tBodyAccJerkstdZ"
	"tBodyGyromeanX"
	"tBodyGyromeanY"
	"tBodyGyromeanZ"
	"tBodyGyrostdX"
	"tBodyGyrostdY"
	"tBodyGyrostdZ"
	"tBodyGyroJerkmeanX"
	"tBodyGyroJerkmeanY"
	"tBodyGyroJerkmeanZ"
	"tBodyGyroJerkstdX"
	"tBodyGyroJerkstdY"
	"tBodyGyroJerkstdZ"
	"tBodyAccMagmean"
	"tBodyAccMagstd"
	"tGravityAccMagmean"
	"tGravityAccMagstd"
	"tBodyAccJerkMagmean"
	"tBodyAccJerkMagstd"
	"tBodyGyroMagmean"
	"tBodyGyroMagstd"
	"tBodyGyroJerkMagmean"
	"tBodyGyroJerkMagstd"
	"fBodyAccmeanX"
	"fBodyAccmeanY"
	"fBodyAccmeanZ"
	"fBodyAccstdX"
	"fBodyAccstdY"
	"fBodyAccstdZ"
	"fBodyAccmeanFreqX"
	"fBodyAccmeanFreqY"
	"fBodyAccmeanFreqZ"
	"fBodyAccJerkmeanX"
	"fBodyAccJerkmeanY"
	"fBodyAccJerkmeanZ"
	"fBodyAccJerkstdX"
	"fBodyAccJerkstdY"
	"fBodyAccJerkstdZ"
	"fBodyAccJerkmeanFreqX"
	"fBodyAccJerkmeanFreqY"
	"fBodyAccJerkmeanFreqZ"
	"fBodyGyromeanX"
	"fBodyGyromeanY"
	"fBodyGyromeanZ"
	"fBodyGyrostdX"	
	"fBodyGyrostdY"
	"fBodyGyrostdZ"
	"fBodyGyromeanFreqX"
	"fBodyGyromeanFreqY"