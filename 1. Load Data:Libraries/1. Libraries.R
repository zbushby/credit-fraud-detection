#load libraries
library(ggplot2)
library(dplyr)
library(readr)
library(tibble)
library(tidyr)
library(DataExplorer)
library(themis)
#library(DMwR) DMwR removed from Cran :(
library(caret)
library(smotefamily)
library(rsample)
library(data.table)
library(MASS)
library(randomForest)
library(e1071)

#load data
#find the data on kaggle: 
data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//creditcard.csv")

#load fully scaled data
#this data is created in the cleaning.R file
scaled_data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//scaled_creditcard.csv")

#load balanced data
balanced_train_data <- data.frame(read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//balanced_train_creditcard.csv"))

test_data<- data.frame(read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//test_creditcard.csv"))





