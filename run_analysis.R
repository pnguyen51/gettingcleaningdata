
#Read features

features <- readLines('features.txt')
features <-  gsub('\\d* ', '', features)
meanSDFeatures <- grep("-mean\\(\\)|-std\\(\\)", features)
features <- gsub('\\(\\)', '', features)

#Read training/test x data, subset columns, merge

trainX <- read.table('train/X_train.txt', col.names=features)
testX <- read.table('test/X_test.txt',col.names=features)

trainX <- trainX[, meanSDFeatures]
testX <- testX[, meanSDFeatures]

xData <- rbind(trainX, testX)

#Read activity labels

activityLabels <- readLines('activity_labels.txt')
activityLabels <- gsub('\\d ', '', activityLabels)
activityLabels <- gsub('_', ' ', activityLabels)
activityLabels <- tolower(activityLabels)

#Read training/test y data, merge

trainY <- read.table('train/y_train.txt')
testY <- read.table('test/y_test.txt')

trainY <- data.frame(activity=activityLabels[trainY[,1]])
testY <- data.frame(activity=activityLabels[testY[,1]])

yData <- rbind(trainY, testY)

#create tidy data set

subjectTrain <- read.table('train/subject_train.txt', col.names=c('subject'))
subjectTest <- read.table('test/subject_test.txt', col.names=c('subject'))
subjectData <- rbind(subjectTrain, subjectTest)


tidyData <-  aggregate(xData,list(yData[,1],subjectData[,1]),mean)
colnames(tidyData)[c(1,2)] <- c("activity", "subject")


