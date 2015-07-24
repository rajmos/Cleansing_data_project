install.packages("reshape2")
library(reshape2)

## assign the file name
fn <- "getdata_dataset.zip"

## Download the file
if (!file.exists(fn)){
  fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  

## Uncompress the files

if (!file.exists("UCI HAR Dataset")) { 
  unzip(fn) 
}

# Load activity labels
act_label <- read.table("UCI HAR Dataset/activity_labels.txt")
act_label[,2] <- as.character(act_label[,2])

# Load feactures
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# get the data for mean and std deviation

result_feature <- grep(".*mean.*|.*std.*", features[,2])
result_feature.names <- features[result_feature,2]
result_feature.names = gsub('-mean', 'Mean', result_feature.names)
result_feature.names = gsub('-std', 'Std', result_feature.names)
result_feature.names <- gsub('[-()]', '', result_feature.names)


# cache the train data


train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt")
training_act <- read.table("UCI HAR Dataset/train/Y_train.txt")
training <- read.table("UCI HAR Dataset/train/X_train.txt")[result_feature]
training <- cbind(train_sub, training_act, training)


test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_act <- read.table("UCI HAR Dataset/test/Y_test.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")[result_feature] 
test <- cbind(test_sub, test_act, test)

## head(training)
## head(test)

# merge datasets with labels
merged_data <- rbind(training, test)
colnames(merged_data) <- c("subject", "activity", result_feature.names)

# convert into factors the activities & subjects  
merged_data$activity <- factor(merged_data$activity, levels = act_label[,1], labels = act_label[,2])
merged_data$subject <- as.factor(merged_data$subject)

merged_data.melted <- melt(merged_data, id = c("subject", "activity"))
merged_data.mean <- dcast(merged_data.melted, subject + activity ~ variable, mean)

write.table(merged_data.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
