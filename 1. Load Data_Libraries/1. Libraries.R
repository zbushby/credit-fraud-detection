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
#find the data on kaggle
data <- read_csv(paste0(base_path_data, "creditcard.csv"))


