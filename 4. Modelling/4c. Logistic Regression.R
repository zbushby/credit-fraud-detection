
#Logistic Regression

#model
log_model <- glm(Class ~.,data = balanced_train_data, family = binomial(link="logit"))
#prediction
log_pred <- predict(log_model, newdata = test_data, type = "response")

log_cmatrix <- confusionMatrix(data = as.factor(as.numeric(log_pred > 0.5)),reference = as.factor(test_data$Class))
log_cmatrix$table
log_cmatrix$byClass

