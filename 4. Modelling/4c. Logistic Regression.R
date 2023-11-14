
#Logistic Regression
set.seed(123)
nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
smote_train_data$Class <- as.factor(smote_train_data$Class)
tomek_train_data$Class <- as.factor(tomek_train_data$Class)
test_data$Class <- as.factor(test_data$Class)

#Near Miss Data
#------------------------------------------------------------------------------
#model
nearmiss_log_model <- glm(Class ~.,data = nearmiss_train_data, family = binomial(link="logit"))
nearmiss_log_pred <- predict(nearmiss_log_model, newdata = test_data, type = "response")

# 0.9 as per threshold optimisation
nearmiss_log_cmatrix <- confusionMatrix(data = as.factor(as.numeric(nearmiss_log_pred > 0.9)),reference = as.factor(test_data$Class))

#SMOTE Data
#------------------------------------------------------------------------------
#model
smote_log_model <- glm(Class ~.,data = smote_train_data, family = binomial(link="logit"))
smote_log_pred <- predict(smote_log_model, newdata = test_data, type = "response")

# 0.9 as per threshold optimisation
smote_log_cmatrix <- confusionMatrix(data = as.factor(as.numeric(smote_log_pred > 0.9)),reference = as.factor(test_data$Class))


#Tomek Links Data
#------------------------------------------------------------------------------
#model
tomek_log_model <- glm(Class ~.,data = tomek_train_data, family = binomial(link="logit"))
tomek_log_pred <- predict(tomek_log_model, newdata = test_data, type = "response")

# 0.9 as per threshold optimisation
tomek_log_cmatrix <- confusionMatrix(data = as.factor(as.numeric(tomek_log_pred > 0.35)),reference = as.factor(test_data$Class))



#threhold optimisation
preds <- list(
  nearmiss = nearmiss_log_pred, 
  smote = smote_log_pred, 
  tomek = tomek_log_pred)
for (pred_name in names(preds)){
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
  metrics <- t(sapply(thresholds, function(t) calc_metrics(t, preds[[pred_name]], test_data$Class)))
  metrics_df <- as.data.frame(metrics)
  
  #optimal threshold = highest F1 score as f1 takes into account both recall and precision
  optimal_row <- metrics_df[which.max(metrics_df$F1), ]
  optimal_threshold <- optimal_row$Threshold
  print(pred_name)
  print(optimal_row)
  
}




