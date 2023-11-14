# If you have have downloaded the train and test files

# Load scaled_data
scaled_data <- read_csv(paste0(base_path_data, "scaled_creditcard.csv"))

# Load balanced data
nearmiss_train_data <- data.frame(read_csv(paste0(base_path_data, "nearmiss_train_creditcard.csv")))
tomek_train_data <- data.frame(read_csv(paste0(base_path_data, "tomek_train_creditcard.csv")))
smote_train_data <- data.frame(read_csv(paste0(base_path_data, "smote_train_creditcard.csv")))

# Load test data
test_data <- data.frame(read_csv(paste0(base_path_data, "test_creditcard.csv")))