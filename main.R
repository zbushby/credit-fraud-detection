
#base path
#PC
#base_path_project <- "C:\\Users\\zbush\\Documents\\GitHub\\credit-fraud-detection\\"
#base_path_data <- "C:\\Users\\zbush\\Documents\\GitHub\\Data\\"
#mac
base_path_project <- "//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//"
base_path_data <- "//Users//zachbushby//Documents//edu//data_science//Projects//Data//Credit Fraud Detection//"


#installs and loads any libraries not already installed and loaded
#loads all training and testing datasets
source(paste0(base_path_project,"1. Load Data_Libraries//1. Libraries.R"))

#download all train + test datasets (scaled and balanced data)
#source(paste0(base_path_project,"2. Cleaning//2. Cleaning.R"))

#loads all training + testing datasets
source(paste0(base_path_project,"4. Modelling//4.1 Train_Test_Data.R"))

#Does all comparisons
source(paste0(base_path_project,"4. Modelling//4. Comparison.R"))


#--------------------------------RESULTS---------------------------------------
#Top 10 Models (Ranked by f1):

all_models %>%
  dplyr::select(Model, F1, Precision, Recall, `Balanced.Accuracy`, Sensitivity, Method) %>% 
  dplyr::arrange(desc(F1)) %>% 
  head()

#f1, precision, recall, balanced accuracy, sensitivity, (ranked by f1):

all_models %>%
  dplyr::select(Model, F1, Precision, Recall, `Balanced.Accuracy`, Sensitivity, Method) %>%
  dplyr::filter(Method == "Near Miss") %>% 
  dplyr::arrange(desc(F1))

all_models %>%
  dplyr::select(Model, F1, Precision, Recall, `Balanced.Accuracy`, Sensitivity, Method) %>%
  dplyr::filter(Method == "SMOTE") %>% 
  dplyr::arrange(desc(F1))

all_models %>%
  dplyr::select(Model, F1, Precision, Recall, `Balanced.Accuracy`, Sensitivity, Method) %>%
  dplyr::filter(Method == "Tomek Links") %>% 
  dplyr::arrange(desc(F1))

#Individual Confusion Matrices:
#Logistic Regression, QDA, LDA, KNN, Random Forest, Linear SVM, Poly SVM, Radial SVM, Naive Bayes, GBM, XGBoost, Single Neural Net, 2 layer Neural Net, Deep Neural Net                   
#nearmiss_confusionmatrices[[""]]
#Logistic Regression, QDA, LDA, Random Forest, Naive Bayes, GBM, XGBoost, Single Neural Net, 2 layer Neural Net, Deep Neural Net 
#smote_confusionmatrices[[""]]
#Logistic Regression, QDA, LDA, KNN, Random Forest, Naive Bayes, GBM, XGBoost, Single Neural Net, 2 layer Neural Net, Deep Neural Net
tomek_confusionmatrices[["Single Neural Net"]]



