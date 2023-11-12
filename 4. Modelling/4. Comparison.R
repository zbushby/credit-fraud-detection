#Multiple Classifiers

#Models: LDA, QDA, GLM, RF, SVM, Naives Bayes, KNN, GBM, XGBoost, AdaBoost

#Quadratic Discriminant Analysis (QDA)
#----------------------------------------------------------------------------
qda_cmatrix$table
qda_cmatrix$byClass

#Linear Discriminant Analysis (LDA)
#----------------------------------------------------------------------------
lda_cmatrix$table
lda_cmatrix$byClass

#logistic regression (GLM)
#----------------------------------------------------------------------------
log_cmatrix$table
log_cmatrix$byClass

#Random Forest (Bagging)
#----------------------------------------------------------------------------
rf_cmatrix$table
rf_cmatrix$byClass

#Support Vector Machine (SVM)
#----------------------------------------------------------------------------
svm_cmatrix$table
svm_cmatrix$byClass

#Naives Bayes
#----------------------------------------------------------------------------
nb_cmatrix$table
nb_cmatrix$byClass

#K-nearest neighbour (KNN)
#----------------------------------------------------------------------------
knn_cmatrix$table
knn_cmatrix$byClass

#Gradient Boosting Machine (GBM)
#----------------------------------------------------------------------------
gbm_cmatrix$table
gbm_cmatrix$byClass

#Extreme Gradient Boosting (XGBoost)
#----------------------------------------------------------------------------
xgb_cmatrix$table
xgb_cmatrix$byClass

#Neural Network
#----------------------------------------------------------------------------
nn_cmatrix$table
nn_cmatrix$byClass


#Comparison
#------------------------------------------------------------------------------

actual <- test_data$Class

confusionmatrices <- list(
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
metrics_list <- list()

# Ensure that you loop over the names of confusionmatrices, not predictions
for (model_name in names(confusionmatrices)) {
  cm <- confusionmatrices[[model_name]]
  metrics_list[[model_name]] <- cm$byClass
}

metrics_df <- do.call(cbind, metrics_list)
comparison_table <- t(metrics_df)

comparison_table %>%
  as.data.frame() %>% 
  tibble::rownames_to_column(var = "Model") %>%
  dplyr::select(Model, F1, Precision, Recall, `Balanced Accuracy`, Sensitivity) %>%
  dplyr::arrange(desc(F1))

