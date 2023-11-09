#load libraries
library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)
library(DataExplorer)
library(themis)
#library(DMwR) DMwR removed from Cran :(
library(caret)
library(smotefamily)

#load data
data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//creditcard.csv")

#load cleaned data
clean_data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//clean_creditcard.csv")
