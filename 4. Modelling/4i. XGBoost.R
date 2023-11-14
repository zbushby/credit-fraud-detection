# Extreme Gradient Boosting

#nearmiss Data
#------------------------------------------------------------------------------ 
  
nearmiss_X_train = data.matrix(nearmiss_train_data[,1:30])                  
nearmiss_y_train = nearmiss_train_data[,31]                              
X_test = data.matrix(test_data[,1:30])                    
y_test = test_data[,31]                                  
nearmiss_xgboost_train = xgb.DMatrix(data=nearmiss_X_train, label=nearmiss_y_train)
xgboost_test = xgb.DMatrix(data=X_test, label=y_test)


#model
nearmiss_xgb_model <- xgboost(data = nearmiss_xgboost_train, max.depth = 3, nrounds = 50, objective = "binary:logistic", eval_metric = "logloss")
saveRDS(nearmiss_xgb_model, "./nearmiss_xgb_model.rds")
nearmiss_xgb_model <- readRDS("./nearmiss_xgb_model.rds")
#summary(xgb_model)

nearmiss_xgb_pred = predict(nearmiss_xgb_model, xgboost_test)
nearmiss_xgb_pred <- ifelse(nearmiss_xgb_pred > 0.9, 1, 0) #used 0.9 as per threshold optimisation below

#confusion matrix
nearmiss_xgb_cmatrix <- confusionMatrix(data = as.factor(nearmiss_xgb_pred), reference = as.factor(test_data$Class))

#SMOTE Data
#------------------------------------------------------------------------------

smote_X_train = data.matrix(smote_train_data[,1:30])                  
smote_y_train = smote_train_data[,31]                              
X_test = data.matrix(test_data[,1:30])                    
y_test = test_data[,31]                                  
smote_xgboost_train = xgb.DMatrix(data=smote_X_train, label=smote_y_train)
xgboost_test = xgb.DMatrix(data=X_test, label=y_test)


#model
smote_xgb_model <- xgboost(data = smote_xgboost_train, max.depth = 3, nrounds = 50, objective = "binary:logistic", eval_metric = "logloss")
saveRDS(smote_xgb_model, "./smote_xgb_model.rds")
smote_xgb_model <- readRDS("./smote_xgb_model.rds")
#summary(xgb_model)

smote_xgb_pred = predict(smote_xgb_model, xgboost_test)
smote_xgb_pred <- ifelse(smote_xgb_pred > 0.9, 1, 0) #used 0.9 as per threshold optimisation below

#confusion matrix
smote_xgb_cmatrix <- confusionMatrix(data = as.factor(smote_xgb_pred), reference = as.factor(test_data$Class))

#Tomek Data
#------------------------------------------------------------------------------

tomek_X_train = data.matrix(tomek_train_data[,1:30])                  
tomek_y_train = tomek_train_data[,31]                              
X_test = data.matrix(test_data[,1:30])                    
y_test = test_data[,31]                                  
tomek_xgboost_train = xgb.DMatrix(data=tomek_X_train, label=tomek_y_train)
xgboost_test = xgb.DMatrix(data=X_test, label=y_test)


#model
tomek_xgb_model <- xgboost(data = tomek_xgboost_train, max.depth = 3, nrounds = 50, objective = "binary:logistic", eval_metric = "logloss")
saveRDS(tomek_xgb_model, "./tomek_xgb_model.rds")
tomek_xgb_model <- readRDS("./tomek_xgb_model.rds")
#summary(xgb_model)

tomek_xgb_pred = predict(tomek_xgb_model, xgboost_test)
tomek_xgb_pred <- ifelse(tomek_xgb_pred > 0.9, 1, 0) #used 0.9 as per threshold optimisation below

#confusion matrix
tomek_xgb_cmatrix <- confusionMatrix(data = as.factor(tomek_xgb_pred), reference = as.factor(test_data$Class))

#threhold optimisation

preds <- list(
  nearmiss = nearmiss_xgb_pred, 
  smote = smote_xgb_pred, 
  tomek = tomek_xgb_pred)
for (pred_name in names(preds)){

  xgb_pred_probs <- preds[[pred_name]]
  
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
  print(pred_name)
  print(optimal_row)
}


