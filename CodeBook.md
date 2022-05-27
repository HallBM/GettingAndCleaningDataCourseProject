## Codebook for GettingAndCleaningDataCourseProject

# Source of data (run_analysis.R script combines test and training data sets)
The compressed data analyzed in this project can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

# Description of data
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  


# This code book describes the tidy table output of the code provided by run_analysis: 
"Tidy Table_Mean for Subject and Action.txt"

## Categorical data (columns 1 and 2)
"Subject" = Subject identification number (n= 1 to 30)
"Action" = The type of activity that was performed while data was collected from a smartphone (Samsung Galaxy S II) worn on the waist (6 actions): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## Data measurments (columns 3 to 68)
# Description of raw labels and full raw data set
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

# Subset of data used for final tidy data table
Extracted only the measurements of the mean and standard deviation for each measurement. Only data with labels indicating "-mean()" and "-std()" were utilized (n = 66 categories of data)

# Modification of raw data descriptors for final table
* "t" at start of label expanded to "Time"
* "f" at start of label expanded to "Frequency"
* "Acc" expanded to "Accelerometer"
* "Gyro" expanded to "Gyroscope"
* "Mag"  expanded to "Magnitude"
* "-mean()" written as "Mean"
* "std()" written as "SD" to indicate standard deviation
* "-X" at end of label written as "_X" to indicate X-coordinate position data
* "-Y" at end of label written as "_Y" to indicate Y-coordinate position data
* "-Z" at end of label written as "_Z" to indicate Z-coordinate position data
* "BodyBody" simplified to "Body"

# Full list of data descriptors for final table: [Column number] "Descriptor"
 [3] "TimeBodyAccelerometerMean_X"                
 [4] "TimeBodyAccelerometerMean_Y"                
 [5] "TimeBodyAccelerometerMean_Z"                
 [6] "TimeBodyAccelerometerSD_X"                  
 [7] "TimeBodyAccelerometerSD_Y"                  
 [8] "TimeBodyAccelerometerSD_Z"                  
 [9] "TimeGravityAccelerometerMean_X"             
[10] "TimeGravityAccelerometerMean_Y"             
[11] "TimeGravityAccelerometerMean_Z"             
[12] "TimeGravityAccelerometerSD_X"               
[13] "TimeGravityAccelerometerSD_Y"               
[14] "TimeGravityAccelerometerSD_Z"               
[15] "TimeBodyAccelerometerJerkMean_X"            
[16] "TimeBodyAccelerometerJerkMean_Y"            
[17] "TimeBodyAccelerometerJerkMean_Z"            
[18] "TimeBodyAccelerometerJerkSD_X"              
[19] "TimeBodyAccelerometerJerkSD_Y"              
[20] "TimeBodyAccelerometerJerkSD_Z"              
[21] "TimeBodyGyroscopeMean_X"                    
[22] "TimeBodyGyroscopeMean_Y"                    
[23] "TimeBodyGyroscopeMean_Z"                    
[24] "TimeBodyGyroscopeSD_X"                      
[25] "TimeBodyGyroscopeSD_Y"                      
[26] "TimeBodyGyroscopeSD_Z"                      
[27] "TimeBodyGyroscopeJerkMean_X"                
[28] "TimeBodyGyroscopeJerkMean_Y"                
[29] "TimeBodyGyroscopeJerkMean_Z"                
[30] "TimeBodyGyroscopeJerkSD_X"                  
[31] "TimeBodyGyroscopeJerkSD_Y"                  
[32] "TimeBodyGyroscopeJerkSD_Z"                  
[33] "TimeBodyAccelerometerMagnitudeMean"         
[34] "TimeBodyAccelerometerMagnitudeSD"           
[35] "TimeGravityAccelerometerMagnitudeMean"      
[36] "TimeGravityAccelerometerMagnitudeSD"        
[37] "TimeBodyAccelerometerJerkMagnitudeMean"     
[38] "TimeBodyAccelerometerJerkMagnitudeSD"       
[39] "TimeBodyGyroscopeMagnitudeMean"             
[40] "TimeBodyGyroscopeMagnitudeSD"               
[41] "TimeBodyGyroscopeJerkMagnitudeMean"         
[42] "TimeBodyGyroscopeJerkMagnitudeSD"           
[43] "FrequencyBodyAccelerometerMean_X"           
[44] "FrequencyBodyAccelerometerMean_Y"           
[45] "FrequencyBodyAccelerometerMean_Z"           
[46] "FrequencyBodyAccelerometerSD_X"             
[47] "FrequencyBodyAccelerometerSD_Y"             
[48] "FrequencyBodyAccelerometerSD_Z"             
[49] "FrequencyBodyAccelerometerJerkMean_X"       
[50] "FrequencyBodyAccelerometerJerkMean_Y"       
[51] "FrequencyBodyAccelerometerJerkMean_Z"       
[52] "FrequencyBodyAccelerometerJerkSD_X"         
[53] "FrequencyBodyAccelerometerJerkSD_Y"         
[54] "FrequencyBodyAccelerometerJerkSD_Z"         
[55] "FrequencyBodyGyroscopeMean_X"               
[56] "FrequencyBodyGyroscopeMean_Y"               
[57] "FrequencyBodyGyroscopeMean_Z"               
[58] "FrequencyBodyGyroscopeSD_X"                 
[59] "FrequencyBodyGyroscopeSD_Y"                 
[60] "FrequencyBodyGyroscopeSD_Z"                 
[61] "FrequencyBodyAccelerometerMagnitudeMean"    
[62] "FrequencyBodyAccelerometerMagnitudeSD"      
[63] "FrequencyBodyAccelerometerJerkMagnitudeMean"
[64] "FrequencyBodyAccelerometerJerkMagnitudeSD"  
[65] "FrequencyBodyGyroscopeMagnitudeMean"        
[66] "FrequencyBodyGyroscopeMagnitudeSD"          
[67] "FrequencyBodyGyroscopeJerkMagnitudeMean"    
[68] "FrequencyBodyGyroscopeJerkMagnitudeSD"

# data manipulation
Values present in table represent the average value of the category for each subject performing each action. 