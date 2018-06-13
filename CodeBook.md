# Code book for Coursera *Getting and Cleaning Data* course project

This code book summarizes the resulting data fields in tidy_data.txt.

## Identifiers

subject - The ID of the test subject
activity - The type of activity performed when the corresponding measurements were taken

## Measurements

timeDomainBodyAccelerationMeanX
 timeDomainBodyAccelerationMeanY 
 timeDomainBodyAccelerationMeanZ 
 timeDomainBodyAccelerationStdX 
 timeDomainBodyAccelerationStdY 
 timeDomainBodyAccelerationStdZ 
 timeDomainGravityAccelerationMeanX 
 timeDomainGravityAccelerationMeanY 
 timeDomainGravityAccelerationMeanZ 
 timeDomainGravityAccelerationStdX 
 timeDomainGravityAccelerationStdY 
 timeDomainGravityAccelerationStdZ 
 timeDomainBodyAccelerationJerkMeanX 
 timeDomainBodyAccelerationJerkMeanY 
 timeDomainBodyAccelerationJerkMeanZ
 timeDomainBodyAccelerationJerkStdX 
 timeDomainBodyAccelerationJerkStdY 
 timeDomainBodyAccelerationJerkStdZ 
 timeDomainBodyGyroscopeMeanX 
 timeDomainBodyGyroscopeMeanY 
 timeDomainBodyGyroscopeMeanZ 
 timeDomainBodyGyroscopeStdX 
 timeDomainBodyGyroscopeStdY 
 timeDomainBodyGyroscopeStdZ 
 timeDomainBodyGyroscopeJerkMeanX 
 timeDomainBodyGyroscopeJerkMeanY 
 timeDomainBodyGyroscopeJerkMeanZ 
 timeDomainBodyGyroscopeJerkStdX 
 timeDomainBodyGyroscopeJerkStdY 
 timeDomainBodyGyroscopeJerkStdZ 
 timeDomainBodyAccelerationMagnitudeMean 
 timeDomainBodyAccelerationMagnitudeStd 
 timeDomainGravityAccelerationMagnitudeMean 
 timeDomainGravityAccelerationMagnitudeStd 
 timeDomainBodyAccelerationJerkMagnitudeMean 
 timeDomainBodyAccelerationJerkMagnitudeStd 
 timeDomainBodyGyroscopeMagnitudeMean 
 timeDomainBodyGyroscopeMagnitudeStd 
 timeDomainBodyGyroscopeJerkMagnitudeMean 
 timeDomainBodyGyroscopeJerkMagnitudeStd 
 frequencyDomainBodyAccelerationMeanX 
 frequencyDomainBodyAccelerationMeanY 
 frequencyDomainBodyAccelerationMeanZ 
 frequencyDomainBodyAccelerationStdX 
 frequencyDomainBodyAccelerationStdY 
 frequencyDomainBodyAccelerationStdZ 
 frequencyDomainBodyAccelerationMeanFrequencyX 
 frequencyDomainBodyAccelerationMeanFrequencyY 
 frequencyDomainBodyAccelerationMeanFrequencyZ 
 frequencyDomainBodyAccelerationJerkMeanX 
 frequencyDomainBodyAccelerationJerkMeanY 
 frequencyDomainBodyAccelerationJerkMeanZ 
 frequencyDomainBodyAccelerationJerkStdX 
 frequencyDomainBodyAccelerationJerkStdY 
 frequencyDomainBodyAccelerationJerkStdZ 
 frequencyDomainBodyAccelerationJerkMeanFrequencyX 
 frequencyDomainBodyAccelerationJerkMeanFrequencyY 
 frequencyDomainBodyAccelerationJerkMeanFrequencyZ 
 frequencyDomainBodyGyroscopeMeanX 
 frequencyDomainBodyGyroscopeMeanY 
 frequencyDomainBodyGyroscopeMeanZ 
 frequencyDomainBodyGyroscopeStdX 
 frequencyDomainBodyGyroscopeStdY 
 frequencyDomainBodyGyroscopeStdZ 
 frequencyDomainBodyGyroscopeMeanFrequencyX 
 frequencyDomainBodyGyroscopeMeanFrequencyY 
 frequencyDomainBodyGyroscopeMeanFrequencyZ 
 frequencyDomainBodyAccelerationMagnitudeMean 
 frequencyDomainBodyAccelerationMagnitudeStd 
 frequencyDomainBodyAccelerationMagnitudeMeanFrequency 
 frequencyDomainBodyBodyAccelerationJerkMagnitudeMean 
 frequencyDomainBodyBodyAccelerationJerkMagnitudeStd 
 frequencyDomainBodyBodyAccelerationJerkMagnitudeMeanFrequency 
 frequencyDomainBodyBodyGyroscopeMagnitudeMean 
 frequencyDomainBodyBodyGyroscopeMagnitudeStd 
 frequencyDomainBodyBodyGyroscopeMagnitudeMeanFrequency 
 frequencyDomainBodyBodyGyroscopeJerkMagnitudeMean 
 frequencyDomainBodyBodyGyroscopeJerkMagnitudeStd 
 frequencyDomainBodyBodyGyroscopeJerkMagnitudeMeanFrequency
 
## Transformations 

The following transformations were applied to the source data:

1. The training and test sets were merged to create one data set.
2. The measurements on the mean and standard deviation (i.e. signals containing the strings `mean` and `std`) 
	were extracted for each measurement.
3. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names 
		(see [Identifiers](#identifiers) section).
4. The variable names were replaced with descriptive variable names (e.g. `tBodyAcc-mean()-X` was expanded to `
		timeDomainBodyAccelerometerMeanX`), using the following set of rules:
	4.1 Special characters (i.e. `(`, `)`, and `-`) were removed
	4.2 The initial `f` and `t` were expanded to `frequencyDomain` and `timeDomain` respectively.
	4.3 `Acc`, `Gyro`, `Mag`, `Freq`, `mean`, and `std` were replaced with `Accelerometer`, `Gyroscope`, `Magnitude`, `Frequency`, `Mean`
			and `StandardDeviation` respectively.
5. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the `run_analysis.R` R script (see `README.md` file for usage instructions).

