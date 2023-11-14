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

# Define the base path
base_path_project <- "//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//"
base_path_data <- "//Users//zachbushby//Documents//edu//data_science//Projects//Data//"


#load data
#find the data on kaggle: 

data <- read_csv(paste0(base_path_data, "creditcard.csv"))

#download all train + test datasets
source(paste0(base_path_project,"2. Cleaning//2. Cleaning.R"))

# If you have have downloaded the train and test files
# Use the base path with different file names
scaled_data <- read_csv(paste0(base_path_data, "scaled_creditcard.csv"))


# Load balanced data
nearmiss_train_data <- data.frame(read_csv(paste0(base_path_data, "nearmiss_train_creditcard.csv")))
tomek_train_data <- data.frame(read_csv(paste0(base_path_data, "tomek_train_creditcard.csv")))
smote_train_data <- data.frame(read_csv(paste0(base_path_data, "smote_train_creditcard.csv")))

# Load test data
test_data <- data.frame(read_csv(paste0(base_path_data, "test_creditcard.csv")))
