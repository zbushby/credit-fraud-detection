
#Logistic Regression


#model
log_model <- glm(Class ~.,data = balanced_train_data, family = binomial(link="logit"))
log_pred <- predict(log_model, newdata = test_data, type = "response")

# 0.9 as per threshold optimisation
log_cmatrix <- confusionMatrix(data = as.factor(as.numeric(log_pred > 0.9)),reference = as.factor(test_data$Class))
log_cmatrix$table
log_cmatrix$byClass


#threhold optimisation

log_pred_probs <- predict(log_model, newdata = test_data, type = "response")

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
metrics <- t(sapply(thresholds, function(t) calc_metrics(t, log_pred_probs, test_data$Class)))
metrics_df <- as.data.frame(metrics)

#optimal threshold = highest F1 score as f1 takes into account both recall and precision
optimal_row <- metrics_df[which.max(metrics_df$F1), ]
optimal_threshold <- optimal_row$Threshold

optimal_row



