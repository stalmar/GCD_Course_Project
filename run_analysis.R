# Downloading the file

## Creating the directory for the file

if(!file.exists("UCI HAR Dataset")) {
        dir.create("UCI HAR Dataset")
}

## Downloading the file

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./UCI HAR Dataset/data.zip")

## Recording the date
dateDownloaded<-date()

## Unzipping the files and deleting downloaded zipped file
unzip("./UCI HAR Dataset/data.zip", exdir = getwd() )
file.remove("./UCI HAR Dataset/data.zip")

# Loading of the files

## loading train and test data sets

testActivityLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
trainActivityLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")

testActivityData<-read.table("./UCI HAR Dataset/test/X_test.txt")
trainActivityData<-read.table("./UCI HAR Dataset/train/X_train.txt")

testActivitySubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
trainActivitySubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")

## loading files with descriptions

activitiesDictionary<-read.table("./UCI HAR Dataset/activity_labels.txt")
featuresDictionary<-read.table("./UCI HAR Dataset/features.txt")

# merging of train and test data sets

activityLabels<-rbind(trainActivityLabels,testActivityLabels)
activityData<-rbind(trainActivityData,testActivityData)
activitySubjects<-rbind(trainActivitySubjects,testActivitySubjects)

subjectsActivitiesData<-cbind(activitySubjects,activityLabels,activityData)

# renaming the variables

l<-length(names(subjectsActivitiesData))

c<-c("subjectId","activityId")
colnames(subjectsActivitiesData)[1:2]<-c
colnames(subjectsActivitiesData)[3:l]<-as.character(featuresDictionary[[2]])

# translating activity labels into activity names via activitiesDictionary,
# to have descriptive activity names

subjectsActivitiesData$activityId <- sapply(subjectsActivitiesData$activityId, function(x) activitiesDictionary[x, 2])

# identification od variables responsible for means or standard deviation 
# excluding meanFreq(), which is not mean value per se

meanOrStd<-setdiff(grep("subjectId|activityId|mean|std", names(subjectsActivitiesData)),grep("Freq", names(subjectsActivitiesData)))
meanOrStdCols<-names(subjectsActivitiesData)[as.numeric(meanOrStd)]

subjectsActivitiesMeanOrStdData<-subset(subjectsActivitiesData, select = meanOrStdCols)

#change of the names of variables a little bit to remove unnecesary parts
#for their readability

## installs useful package "functional" which enables function composition

install.packages("functional")
library("functional")

## definition of functions to transform names of variables

specialCharactersRemover<-function(x){
        gsub("[[:punct:]]", "", x)
}

meanUpperCaser<-function(x){
        gsub("mean","Mean",x)
}

stdUpeerCaser<-function(x){
        gsub("std","Std",x)
}

shortNames<-names(subjectsActivitiesMeanOrStdData)

goodNames<-sapply(shortNames,Compose(stdUpeerCaser,meanUpperCaser,specialCharactersRemover))
names(subjectsActivitiesMeanOrStdData)<-goodNames

#From this data we create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

## we load library useful for aggregation

library(lattice)

## we take a mean of all variables with respect to agreggation 
## according to subjectId and activityId

meansOfMeansData <- aggregate(. ~ subjectId + activityId, data = subjectsActivitiesMeanOrStdData, FUN = "mean") 

## we change names a little bit to emphasize that we have means of what was means
## already


## definition of functions to transform names of variables

meanAdder<-function(x){
        paste("meanOf",x, sep="")
}

prevNames<-names(meansOfMeansData)
meanNames<-sapply(prevNames,meanAdder)
names(meansOfMeansData)<-meanNames
names(meansOfMeansData)[1:2]<-c("subjectId","activityId")

tidySubjectActivitiesData<-meansOfMeansData 

## we export created in this way, tidy, data set

write.table(tidySubjectActivitiesData, file = "./tidySubjectActivitiesData.txt", row.name=FALSE) 





