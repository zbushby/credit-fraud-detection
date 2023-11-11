#Multiple Classifiers

#Models: LDA, QDA, GLM, RF, SVM, Naives Bayes, KNN, GBM, XGBoost, AdaBoost

#Quadratic Discriminant Analysis (QDA)
#----------------------------------------------------------------------------

#Linear Discriminant Analysis (LDA)
#----------------------------------------------------------------------------


#logistic regression (GLM)
#----------------------------------------------------------------------------


#Random Forest (Bagging)
#----------------------------------------------------------------------------


#Support Vector Machine (SVM)
#----------------------------------------------------------------------------



#Naives Bayes
#----------------------------------------------------------------------------


#K-nearest neighbour (KNN)
#----------------------------------------------------------------------------

#Gradient Boosting Machine (GBM)
#----------------------------------------------------------------------------

#Extreme Gradient Boosting (XGBoost)
#----------------------------------------------------------------------------

#Adaptive Boosting (AdaBoost)
#----------------------------------------------------------------------------

#Neural Network
#----------------------------------------------------------------------------


#Comparison
#----------------------------------------------------------------------------

#Comparison
#------------------------------------------------------------------------------

actual <- test_data$Class

predictions <- list(
  `Logistic Regression` = log_pred,
  SMOTE = log_pred,
  Tomek = pred_tomek,
  Over = pred_over,
  Under = pred_under,
  NearMiss = pred_nearmiss,
  Regular = pred
)

metrics_list <- list()

for (model_name in names(predictions)) {
  pred <- predictions[[model_name]]
  cm <- confusionMatrix(data = as.factor(as.numeric(pred > 0.5)), reference = actual)
  metrics_list[[model_name]] <- cm$byClass
}


metrics_df <- do.call(cbind, metrics_list)
comparison_table <- t(metrics_df)

print(comparison_table)

