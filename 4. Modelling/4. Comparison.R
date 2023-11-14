#Multiple Classifiers


#Models: LDA, QDA, GLM, RF, SVM, Naives Bayes, KNN, GBM, XGBoost, AdaBoost


#QDA
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4a. QDA.R")     
#LDA
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4b. LDA.R")
#Logistic Reg
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4c. Logisitic Regression.R")
#Random Forest
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4d. Random Forest.R")
#Support Vector Machine
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4e. SVM.R")
#Naive Bayes
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4f. Naive Bayes.R")
#kth Nearest Neighbour
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4g. KNN.R")
#Gradient Boosting Machines
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4h. GBM.R")
#Extreme Gradient Boosting
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4i. XGBoost.R")
#Neural Networks
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4j. Neural Network.R")


#Quadratic Discriminant Analysis (QDA)
#----------------------------------------------------------------------------
nearmiss_qda_cmatrix$table
nearmiss_qda_cmatrix$byClass
smote_qda_cmatrix$table
smote_qda_cmatrix$byClass
tomek_qda_cmatrix$table
tomek_qda_cmatrix$byClass

#Linear Discriminant Analysis (LDA)
#----------------------------------------------------------------------------
nearmiss_lda_cmatrix$table
nearmiss_lda_cmatrix$byClass
smote_lda_cmatrix$table
smote_lda_cmatrix$byClass
tomek_lda_cmatrix$table
tomek_lda_cmatrix$byClass

#logistic regression (GLM)
#----------------------------------------------------------------------------
nearmiss_log_cmatrix$table
nearmiss_log_cmatrix$byClass
smote_log_cmatrix$table
smote_log_cmatrix$byClass
tomek_log_cmatrix$table
tomek_log_cmatrix$byClass

#Random Forest (Bagging)
#----------------------------------------------------------------------------
nearmiss_rf_cmatrix$table
nearmiss_rf_cmatrix$byClass
smote_rf_cmatrix$table
smote_rf_cmatrix$byClass
tomek_rf_cmatrix$table
tomek_rf_cmatrix$byClass

#Support Vector Machine (SVM)
#----------------------------------------------------------------------------
#nearmiss
nearmiss_linear_svm_cmatrix$table
nearmiss_linear_svm_cmatrix$byClass
nearmiss_poly_svm_cmatrix$table
nearmiss_poly_svm_cmatrix$byClass
nearmiss_radial_svm_cmatrix$table
nearmiss_radial_svm_cmatrix$byClass
#smote
# smote_linear_svm_cmatrix$table
# smote_linear_svm_cmatrix$byClass
# smote_poly_svm_cmatrix$table
# smote_poly_svm_cmatrix$byClass
# smote_radial_svm_cmatrix$table
# smote_radial_svm_cmatrix$byClass
# #tomek links
# tomek_linear_svm_cmatrix$table
# tomek_linear_svm_cmatrix$byClass
# tomek_poly_svm_cmatrix$table
# tomek_poly_svm_cmatrix$byClass
# tomek_radial_svm_cmatrix$table
# tomek_radial_svm_cmatrix$byClass


#Naives Bayes
#----------------------------------------------------------------------------
nearmiss_nb_cmatrix$table
nearmiss_nb_cmatrix$byClass
smote_nb_cmatrix$table
smote_nb_cmatrix$byClass
tomek_nb_cmatrix$table
tomek_nb_cmatrix$byClass

#K-nearest neighbour (KNN)
#----------------------------------------------------------------------------
nearmiss_knn_cmatrix$table
nearmiss_knn_cmatrix$byClass
smote_knn_cmatrix$table
smote_knn_cmatrix$byClass
tomek_knn_cmatrix$table
tomek_knn_cmatrix$byClass

#Gradient Boosting Machine (GBM)
#----------------------------------------------------------------------------
nearmiss_gbm_cmatrix$table
nearmiss_gbm_cmatrix$byClass
smote_gbm_cmatrix$table
smote_gbm_cmatrix$byClass
tomek_gbm_cmatrix$table
tomek_gbm_cmatrix$byClass


#Extreme Gradient Boosting (XGBoost)
#----------------------------------------------------------------------------
nearmiss_xgb_cmatrix$table
nearmiss_xgb_cmatrix$byClass
smote_xgb_cmatrix$table
smote_xgb_cmatrix$byClass
tomek_xgb_cmatrix$table
tomek_xgb_cmatrix$byClass

#Neural Network
#----------------------------------------------------------------------------
nearmiss_nn_cmatrix$table
nearmiss_nn_cmatrix$byClass
smote_nn_cmatrix$table
smote_nn_cmatrix$byClass
tomek_nn_cmatrix$table
tomek_nn_cmatrix$byClass


#Comparison
#------------------------------------------------------------------------------

actual <- test_data$Class

nearmiss_confusionmatrices <- list(
  `Logistic Regression` = log_cmatrix,
  `QDA` = qda_cmatrix,
  `LDA` = lda_cmatrix,
  `Random Forest` = rf_cmatrix,
  `SVM` = svm_cmatrix,
  `Naive Bayes` = nb_cmatrix,
  `GBM` = gbm_cmatrix,
  `XGBoost` = xgb_cmatrix,
  `Neural Network` = nn_cmatrix
)
smote_confusionmatrices <- list(
  `Logistic Regression` = log_cmatrix,
  `QDA` = qda_cmatrix,
  `LDA` = lda_cmatrix,
  `Random Forest` = rf_cmatrix,
  `SVM` = svm_cmatrix,
  `Naive Bayes` = nb_cmatrix,
  `GBM` = gbm_cmatrix,
  `XGBoost` = xgb_cmatrix,
  `Neural Network` = nn_cmatrix
)
tomek_confusionmatrices <- list(
  `Logistic Regression` = log_cmatrix,
  `QDA` = qda_cmatrix,
  `LDA` = lda_cmatrix,
  `Random Forest` = rf_cmatrix,
  `SVM` = svm_cmatrix,
  `Naive Bayes` = nb_cmatrix,
  `GBM` = gbm_cmatrix,
  `XGBoost` = xgb_cmatrix,
  `Neural Network` = nn_cmatrix
)

algo_confusionmatrices <- list(
  `Near Miss` = nearmiss_confusionmatrices,
  `SMOTE` = smote_confusionmatrices,
  `Tomek Links` = tomek_confusionmatrices
)

all_matrices <- c()

for (confusionmatrices in algo_confusionmatrices){
  
  metrics_list <- list()
  # Ensure that you loop over the names of confusionmatrices, not predictions
  for (model_name in names(confusionmatrices)) {
    cm <- confusionmatrices[[model_name]]
    metrics_list[[model_name]] <- cm$byClass
  }
  
  metrics_df <- do.call(cbind, metrics_list)
  comparison_table <- t(metrics_df)
  
  comparison_table <- comparison_table %>%
    as.data.frame() %>% 
    tibble::rownames_to_column(var = "Model") %>%
    dplyr::select(Model, F1, Precision, Recall, `Balanced Accuracy`, Sensitivity) %>%
    dplyr::arrange(desc(F1))
  all_matrices <- c(all_matrices, comparison_table)
}

all_matrices[[1]] #Near Miss
all_matrices[[2]] #SMOTE
all_matrices[[3]] #Tomek Links


