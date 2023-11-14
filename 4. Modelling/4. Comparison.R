#Multiple Classifiers


#Models: LDA, QDA, GLM, RF, SVM, Naives Bayes, KNN, GBM, XGBoost, AdaBoost

print("QDA")
#QDA
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4a. QDA.R")     
print("LDA")
#LDA
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4b. LDA.R")
print("Logistic Regression")
#Logistic Reg
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4c. Logistic Regression.R")
print("Random Forest")
#Random Forest
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4d. Random Forest.R")
print("SVM")
#Support Vector Machine
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4e. SVM.R")
print("Naive Bayes")
#Naive Bayes
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4f. Naive Bayes.R")
print("KNN")
#kth Nearest Neighbour
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4g. KNN.R")
print("GBM")
#Gradient Boosting Machines
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4h. GBM.R")
print("XGBoost")
#Extreme Gradient Boosting
source("//Users//zachbushby//Documents//edu//data_science//Projects//Credit Fraud Detection//4. Modelling//4i. XGBoost.R")
print("Neural Networks")
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
#doesnt work as smote=oversampling algorithim 
# smote_knn_cmatrix$table
# smote_knn_cmatrix$byClass
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

nearmiss_single_nn_cmatrix$table
nearmiss_single_nn_cmatrix$byClass
nearmiss_two_nn_cmatrix$table
nearmiss_two_nn_cmatrix$byClass
nearmiss_deep_nn_cmatrix$table
nearmiss_deep_nn_cmatrix$byClass
smote_single_nn_cmatrix$table
smote_single_nn_cmatrix$byClass
smote_two_nn_cmatrix$table
smote_two_nn_cmatrix$byClass
smote_deep_nn_cmatrix$table
smote_deep_nn_cmatrix$byClass
tomek_single_nn_cmatrix$table
tomek_single_nn_cmatrix$byClass
tomek_two_nn_cmatrix$table
tomek_two_nn_cmatrix$byClass
tomek_deep_nn_cmatrix$table
tomek_deep_nn_cmatrix$byClass


#Comparison
#------------------------------------------------------------------------------

actual <- test_data$Class

nearmiss_confusionmatrices <- list(
  `Logistic Regression` = nearmiss_log_cmatrix,
  `QDA` = nearmiss_qda_cmatrix,
  `LDA` = nearmiss_lda_cmatrix,
  `KNN` = nearmiss_knn_cmatrix,
  `Random Forest` = nearmiss_rf_cmatrix,
  `Linear SVM` = nearmiss_linear_svm_cmatrix,
  `Poly SVM` = nearmiss_poly_svm_cmatrix,
  `Radial SVM` = nearmiss_radial_svm_cmatrix,
  `Naive Bayes` = nearmiss_nb_cmatrix,
  `GBM` = nearmiss_gbm_cmatrix,
  `XGBoost` = nearmiss_xgb_cmatrix,
  `Single Neural Net` = nearmiss_single_nn_cmatrix,
  `2 layer Neural Net` = nearmiss_two_nn_cmatrix,
  `Deep Neural Net` = nearmiss_deep_nn_cmatrix
)
smote_confusionmatrices <- list(
  `Logistic Regression` = smote_log_cmatrix,
  `QDA` = smote_qda_cmatrix,
  `LDA` = smote_lda_cmatrix,
  `Random Forest` = smote_rf_cmatrix,
  `Naive Bayes` = smote_nb_cmatrix,
  `GBM` = smote_gbm_cmatrix,
  `XGBoost` = smote_xgb_cmatrix,
  `Single Neural Net` = smote_single_nn_cmatrix,
  `2 layer Neural Net` = smote_two_nn_cmatrix,
  `Deep Neural Net` = smote_deep_nn_cmatrix
)
tomek_confusionmatrices <- list(
  `Logistic Regression` = tomek_log_cmatrix,
  `QDA` = tomek_qda_cmatrix,
  `LDA` = tomek_lda_cmatrix,
  `KNN` = tomek_knn_cmatrix,
  `Random Forest` = tomek_rf_cmatrix,
  `Naive Bayes` = tomek_nb_cmatrix,
  `GBM` = tomek_gbm_cmatrix,
  `XGBoost` = tomek_xgb_cmatrix,
  `Single Neural Net` = tomek_single_nn_cmatrix,
  `2 layer Neural Net` = tomek_two_nn_cmatrix,
  `Deep Neural Net` = tomek_deep_nn_cmatrix
)

algo_confusionmatrices <- list(
  `Near Miss` = nearmiss_confusionmatrices,
  `SMOTE` = smote_confusionmatrices,
  `Tomek Links` = tomek_confusionmatrices
)

all_models <- list()

for (algo_name in names(algo_confusionmatrices)){
  confusionmatrices <- algo_confusionmatrices[[algo_name]]
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
    dplyr::mutate(Method = algo_name)
  all_models[[algo_name]] <-  data.frame(comparison_table)
}

all_models <- do.call(rbind, all_models)
  
row.names(all_models) <- NULL
