## Course Project - module Getting and Cleaning Data from Coursera
## author: Rafael de Souza Toledo,  Date: 12/21/2014

#### Step1:
## reading the content files
testX <- read.table("UCI HAR Dataset/test/X_test.txt", header=F, sep="")                          ## the features data
testY <- read.table("UCI HAR Dataset/test/y_test.txt", header=F, sep="", colClasses="character")  ## activity data
testSub <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F, sep="")                  ## subject data

trainX <- read.table("UCI HAR Dataset/train/X_train.txt", header=F, sep="")
trainY <- read.table("UCI HAR Dataset/train/y_train.txt", header=F, sep="", colClasses="character")
trainSub <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F, sep="")

allX <- rbind(trainX, testX)
allY <- rbind(trainY, testY)
allSub <- rbind(trainSub, testSub)

## merging all training and testing data
allData <- cbind(allSub, allY, allX)

## reading auxiliary files
features <- read.table("features.txt", header=F, sep=" ", colClasses=c("integer", "character"))
labels <-read.table("activity_labels.txt", header=F, sep=" ", colClasses=c("integer", "character"))
#######################

#### Step2:
## attributing names for columns on dataset
colnames(allData) <- c("Subject", "Activity", features[, 2])

## getting only the measurements of mean and standard deviation plus the subject and activity column
filterColumns <- (grepl("-(mean|std)\\(\\)", colnames(allData)) | grepl("Subject", colnames(allData)) | grepl("Activity", colnames(allData)))
subData <- allData[ , filterColumns]
#######################

#### Step3:
## replacing the values of the activity column for the descriptive activity names
for(currentActivity in 1:dim(subData)[1])
    subData[currentActivity, "Activity"] <- labels[as.numeric(subData[currentActivity, "Activity"]), 2]
#######################

### Step4:
## adjusting the names for activies columns
varNames <- names(subData)
varNames <- gsub(pattern="^t",replacement="time",x=varNames)
varNames <- gsub(pattern="^f",replacement="freq",x=varNames)
varNames <- gsub(pattern="-?mean[(][)]-?",replacement="Mean",x=varNames)
varNames <- gsub(pattern="-?std[()][)]-?",replacement="Std",x=varNames)
varNames <- gsub(pattern="-?meanFreq[()][)]-?",replacement="MeanFreq",x=varNames)
colnames(subData) <- varNames
#######################

### Step5:
## creating a tidyset only with the average of each variable and each subject
tidyData <- aggregate(subData[ , 3:dim(subData)[2]], by=list("Subject"=subData$Subject, "Activity"=subData$Activity), mean)

## generating the txt file with the table
write.table(tidyData, file="./tidyData.txt", sep="\t", row.names=FALSE)
#######################

