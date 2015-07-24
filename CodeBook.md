---
title: "CodeBook"
author: "Rajmos"
date: "Friday, July 24, 2015"
output: html_document
---
##This is the code book which consolidates the resulting data elements in tidy.txt.

###The script run_analysis.R does the following steps..

####Loads and uncomrpesses the file getdata_dataset.zip from the url specified.

####Load activity labels. activity_labels.txt file is loaded into act_label variable
####features.txt is loaded into feactures variable

####get the data for mean and std deviation into result_feature

####Same actvities done for train and test data sets 

####similar data ( files having the same number of columns and referring to the same entities) is merged using the rbind() function and stored in the variable called merged_data

####merged_data <- rbind(training, test)

####convert into factors the activities & subjects 

####merged_data.melted <- melt(merged_data, id = c("subject", "activity"))
####merged_data.mean <- dcast(merged_data.melted, subject + activity ~ variable, mean)
####merged_data.mean <- dcast(merged_data.melted, subject + activity ~ variable, mean)


####As activity data containts values 1:6, and we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

####We generate a new text file  with all the mean for each subject and activity type for 6 activities and 30 subjects resulting in 180 rows in the text file

####The output file is called tidy.txt, and uploaded to this repository.

###Variables Used in this program


####act_label -- Stores the read data from activity_labels.txt 
####features -- Stores the efactures data from features.txt 
####result_feature -- Stores the mean and std deviation 


####train_sub -- Stores the read data from subject_train.txt
####training_act --< Stores the read data from Y_train.txt
####training -- Stores the read data from X_train.txt 
####training -- Binds the three datasets train_sub, training_act and training


####test_sub -- Stores the read data from subject_test.txt
####test_act -- Stores the read data from Y_test.txt
####test -- Stores the read data from X_test.txt 
####test -- binds the three datasets test_sub, test_act and test



####merge datasets with labels
####merged_data -- STores the merged data sets with labes rbind(training, test) 

####convert into factors the activities & subjects 

####Stores the converted factors for activities and subjects


####merged_data.mean -- Stores the mean

###Activites code:

####(value 1): subject was walking on flat surface
####(value 2): subject was climing upstairs
####(value 3): subject was walking downstairs  
####(value 4): subject was sitting 
####(value 5): subject was standing  
####LAYING (value 6): subject was laying down 

####tidy.txt -- Final text file

