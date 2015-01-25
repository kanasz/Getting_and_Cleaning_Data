#dorobit ukladanie mergovanych dat


#library(plyr)

downloadData = function(){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  destFilename <-"UCI_HAR_Dataset.zip"
  download.file(url, destFilename, method='auto')
  unzip(destFilename)
}

getMergedData = function(){
  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  x_data <- rbind(x_train, x_test)
  y_data <- rbind(y_train, y_test)
  
  subject_data <- rbind(subject_train, subject_test)
  
  list(x=x_data, y=y_data, subject=subject_data)
}

getCleanedData = function(mergedData){
  features <- read.table('./UCI HAR Dataset/features.txt')
  features[,2] <- gsub("-", "", features[,2])
  features[,2] <- gsub(",", "", features[,2])
  features[,2] <- gsub("\\(", "", features[,2])
  features[,2] <- gsub("\\)", "", features[,2])
  means_and_stds <- grep("(mean|std)", features[, 2])
  
  x_data <- mergedData$x[, means_and_stds]
  names(x_data) <- features[means_and_stds, 2]
  
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

  y_data <- activities[mergedData$y[, 1], 2]
  y_data <- data.frame(y_data)
  names(y_data) <- "activity"
  names(mergedData$subject) <- "subject"
  
  # bind all the data in a single data set
  cbind(x_data, y_data, mergedData$subject)

}

getComputedMeans = function(cleanedData){
  #cleanedData<-getCleanedData();
  # 66 <- 68 columns but last two (activity & subject)
  
  means <- ddply(cleanedData, .(subject, activity), function(x) colMeans(x[, 1:66]))
  means
}

saveData = function(data){
  write.table(data, "tidy_data.txt",sep="\t", row.name=FALSE)
  #write.csv(data, "tidy_data.csv")

}

runAnalysis = function(){
  print("downloading data...")
  #downloadData();
  print("merging data...")
  mergedData<-getMergedData();
  print("cleaning data...")
  cleanedData<-getCleanedData(mergedData);
  print("computing means...")
  dataWithMeans<-getComputedMeans(cleanedData)
  print("saving data...")
  saveData(dataWithMeans);
  print("ALL DONE")
}