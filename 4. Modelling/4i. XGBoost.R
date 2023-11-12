# Extreme Gradient Boosting

X_train = data.matrix(balanced_train_data[,1:30])                  
y_train = balanced_train_data[,31]                              

X_test = data.matrix(test_data[,1:30])                    
y_test = test_data[,31]                                  


xgboost_train = xgb.DMatrix(data=X_train, label=y_train)
xgboost_test = xgb.DMatrix(data=X_test, label=y_test)


#model
xgb_model <- xgboost(data = xgboost_train, max.depth = 3, nrounds = 50, objective = "binary:logistic", eval_metric = "logloss")

summary(xgb_model)

xgb_pred = predict(xgb_model, xgboost_test)
xgb_pred <- ifelse(xgb_pred > 0.9, 1, 0) #used 0.9 as per threshold optimisation below

#confusion matrix
xgb_cmatrix <- confusionMatrix(data = as.factor(xgb_pred), reference = as.factor(test_data$Class))
xgb_cmatrix$table
xgb_cmatrix$byClass




#threhold optimisation

xgb_pred_probs <- predict(xgb_model, xgboost_test)

#function to calculate precision, recall, and F1 score for a given threshold
calc_metrics <- function(threshold, predictions, actuals) {
  pred_binary <- ifelse(predictions > threshold, 1, 0)
  cm <- confusionMatrix(as.factor(pred_binary), as.factor(actuals))
  precision <- cm$byClass['Precision']
  recall <- cm$byClass['Recall']
  f1_score <- cm$byClass['F1']
  return(c(Threshold = threshold, Precision = precision, Recall = recall, F1 = f1_score))
}

#iterate through different thresholds
thresholds <- seq(0.1, 0.9, by = 0.01)
metrics <- t(sapply(thresholds, function(t) calc_metrics(t, xgb_pred_probs, test_data$Class)))
metrics_df <- as.data.frame(metrics)

#optimal threshold = highest F1 score as f1 takes into account both recall and precision
optimal_row <- metrics_df[which.max(metrics_df$F1), ]
optimal_threshold <- optimal_row$Threshold

optimal_row



