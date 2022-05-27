##Generates a tidy data set of wearable computing data, displaying mean and standard deviation of various measured parameters.
##Generates a second, independent tidy data set with the mean of each variable for each activity and subject.


## Step 1: Read and merge training and test sets to create 1 data set

# Read provided metadata: features and activity labels
feat = read.table("./UCI HAR Dataset/features.txt")
actLab = read.table("./UCI HAR Dataset/activity_labels.txt") 
  
# Read the testing files
xtest = read.table("./UCI HAR Dataset/test/X_test.txt")
ytest = read.table("./UCI HAR Dataset/test/Y_test.txt")
subtest = read.table("./UCI HAR Dataset/test/subject_test.txt")

# Combine test data columns
test_syx = cbind(subtest,ytest,xtest) 

# Read the training files
xtrain = read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain = read.table("./UCI HAR Dataset/train/Y_train.txt")
subtrain = read.table("./UCI HAR Dataset/train/subject_train.txt")

# Combine training data columns
train_syx = cbind(subtrain,ytrain,xtrain) 

# Combine test and training data sets
totdata_syx = rbind(test_syx,train_syx)

## Step 2: Extract mean and standard deviation for each measurement
# Assign names to columns
colnames(totdata_syx) = c("Subject","Action", feat[,2])

# Find columns containing either mean or std; specifically -mean() and -std() labels
m_index = grep("\\-mean\\(",colnames(totdata_syx))
std_index = grep("\\-std\\(",colnames(totdata_syx))

# Isolate Subject, Action, mean & std columns
mstd_table = totdata_syx[,(sort(c(1,2,m_index,std_index)))]

# Re-order data
mstd_table = mstd_table[order(mstd_table$Subject, mstd_table$Action),]

## Step 3: Use descriptive activity names to name the activities in the dataset 
# Name activities within data set by assigning factor
mstd_table$Action = factor(mstd_table$Action, levels= actLab[,1], labels = actLab[,2]) 


## Step 4: Label the data set with descriptive variable names
# Expand shorthand abbreviations to provide more descriptive labels
colnames(mstd_table) = gsub("^t", "Time",colnames(mstd_table))
colnames(mstd_table) = gsub("Acc", "Accelerometer",colnames(mstd_table))
colnames(mstd_table) = gsub("Gyro", "Gyroscope",colnames(mstd_table))
colnames(mstd_table) = gsub("Mag", "Magnitude",colnames(mstd_table))
colnames(mstd_table) = gsub("^f", "Frequency",colnames(mstd_table))
colnames(mstd_table) = gsub("mean", "Mean",colnames(mstd_table))
colnames(mstd_table) = gsub("std", "SD",colnames(mstd_table))
colnames(mstd_table) = gsub("\\-", "",colnames(mstd_table))
colnames(mstd_table) = gsub("\\(\\)","",colnames(mstd_table))
colnames(mstd_table) = gsub("X$","_X",colnames(mstd_table))
colnames(mstd_table) = gsub("Y$","_Y",colnames(mstd_table))
colnames(mstd_table) = gsub("Z$","_Z",colnames(mstd_table))
colnames(mstd_table) = gsub("BodyBody","Body",colnames(mstd_table))



## Step 5: Generate a second independent tidy data set with the average of each variable for each activity and each subject
# Generate means of all columns based on Subject and Action
FinalTidyTable = aggregate(. ~Subject + Action, mstd_table, mean)
# Sort table to group all action data together for each individual subject
FinalTidyTable = FinalTidyTable[order(FinalTidyTable$Subject),]

#output tidy tables
write.table(mstd_table, "Tidy Table_Raw Compiled Data.txt", row.names = FALSE)
write.table(FinalTidyTable,"Tidy Table_Mean for Subject and Action.txt", row.names = FALSE)

