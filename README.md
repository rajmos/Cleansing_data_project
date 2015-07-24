---
title: "README"
author: "Rajmos"
date: "Friday, July 24, 2015"
output: html_document
---
#Getting and Cleaning Data July 2015- Final Project

##This is the final project for the Getting and Cleaning Data Coursera course.The R script, run_analysis.R created for this project does the following in the sequence

###Download the files, if it does not already exist.
###Caches the activity and feature files into R
###Caches both the training and test files, filtering the columns which correspondsto mean or standard deviation
###Caches the  subject and activity data for each files, combines those columns.
###Merges the two data files
###Transforms the subject and activity columns into factors
###Grenerates a clean, organized dataset with mean value of each variable for each subject and activity combination
###The cleaned data is written to tidy.txt.
