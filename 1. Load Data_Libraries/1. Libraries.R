packages <- c("ggplot2", "dplyr", "readr", "tibble", "tidyr", 
              "DataExplorer", "themis", "caret", "smotefamily", 
              "rsample", "data.table", "MASS", "randomForest", 
              "e1071", "class", "rpart", "rpart.plot", 
              "gbm", "xgboost", 'neuralnet','keras','tensorflow')

#download libraries 
for (pkg in packages) {
  if (!pkg %in% rownames(installed.packages())) {
    install.packages(pkg)
  }
}

for (pkg in packages) {
  if (pkg %in% rownames(installed.packages())) {
    library(pkg, character.only = TRUE)
  } else {
    warning(paste("Package", pkg, "is not installed."))
  }
}

#set seed
set.seed(123)

#load data
#find the data on kaggle: 
data <- read_csv("//Users//zachbushby//Documents//edu//data_science//Projects//Data//creditcard.csv")

#download all train + test datasets
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//2. Cleaning//2. Cleaning.R")


# If you have have downloaded the train and test files

scaled_data <- read_csv("//Users//zachbushby//Documents//edu//data_science//Projects//Data//scaled_creditcard.csv")

#load balanced data
nearmiss_train_data <- data.frame(read_csv("//Users//zachbushby//Documents//edu//data_science//Projects//Data//nearmiss_train_creditcard.csv"))
tomek_train_data <- data.frame(read_csv("//Users//zachbushby//Documents//edu//data_science//Projects//Data//tomek_train_creditcard.csv"))
smote_train_data <- data.frame(read_csv("//Users//zachbushby//Documents//edu//data_science//Projects//Data//smote_train_creditcard.csv"))

#load test data
test_data<- data.frame(read_csv("//Users//zachbushby//Documents//edu//data_science//Projects//Data//test_creditcard.csv"))





