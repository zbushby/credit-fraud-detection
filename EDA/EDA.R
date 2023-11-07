# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)
library(DataExplorer)

data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//creditcard.csv")
head(data)

#checks
summary(data)

#missing values
sum(is.na(data)) # no missing values

#relationship of numerical variables
pairs(data)

#correlation matrix for numerical variables
correlations <- cor(data %>% select_if(is.numeric), use = "complete.obs")
corrplot::corrplot(correlations, method = "circle")

#boxplot to check for outliers
boxplot(data)

#histogram
hist(data)

#histogram
ggplot(data, aes(x = numeric_column)) + 
  geom_histogram(binwidth = 1, fill = "blue", color = "black")

#bar plot for categorical variables to check frequency of each category
ggplot(data, aes(x = factor_column)) + 
  geom_bar()

#EDA report
create_report(data)






