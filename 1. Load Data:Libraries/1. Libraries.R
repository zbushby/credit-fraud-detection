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



#load data
#find the data on kaggle: 
data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//creditcard.csv")

#load fully scaled data
#this data is created in the cleaning.R file
scaled_data <- read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//scaled_creditcard.csv")

#load balanced data
balanced_train_data <- data.frame(read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//balanced_train_creditcard.csv"))

test_data<- data.frame(read_csv("//Users//zachbushby//Documents//Uni//Career//Projects//Data//test_creditcard.csv"))





