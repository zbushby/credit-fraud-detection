
#base path
#PC
#base_path_project <- "C:\\Users\\zbush\\Documents\\GitHub\\credit-fraud-detection\\"
#base_path_data <- "C:\\Users\\zbush\\Documents\\GitHub\\Data\\"
#mac
base_path_project <- "//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//"
base_path_data <- "//Users//zachbushby//Documents//edu//data_science//Projects//Data//"


#installs and loads any libraries not already installed and loaded
#loads all training and testing datasets
source(paste0(base_path_project,"1. Load Data_Libraries//1. Libraries.R"))

#download all train + test datasets (scaled and balanced data)
#source(paste0(base_path_project,"2. Cleaning//2. Cleaning.R"))

#loads all training + testing datasets
base_path_project <- "//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//"
base_path_data <- "//Users//zachbushby//Documents//edu//data_science//Projects//Data//"
source(paste0(base_path_project,"4. Modelling//4.1 Train_Test_Data.R"))

#Does all comparisons
source(paste0(base_path_project,"4. Modelling//4. Comparison.R"))



