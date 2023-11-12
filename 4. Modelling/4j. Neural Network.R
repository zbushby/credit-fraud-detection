# Neural Network Classifier

#single layer

single_nn_model = neuralnet(
  Class~.,
  data=balanced_train_data,
  hidden=c(30),
  threshold = 0.5,
  linear.output = FALSE
)
plot(single_nn_model,rep = "best")

single_nn_pred <- predict(single_nn_model, test_data)

single_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(single_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))
single_nn_cmatrix$table
single_nn_cmatrix$byClass


#2 hidden layers

two_nn_model = neuralnet(
  Class~.,
  data=balanced_train_data,
  hidden=c(60,30),
  threshold = 0.5,
  linear.output = FALSE
)
plot(two_nn_model,rep = "best")

two_nn_pred <- predict(two_nn_model, test_data)

two_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(two_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))
two_nn_cmatrix$table
two_nn_cmatrix$byClass

#Deep Neural Network

deep_nn_model = neuralnet(
  Class~.,
  data=balanced_train_data,
  hidden=c(100,50,25),
  linear.output = FALSE
)
#plot(deep_nn_model,rep = "best")

deep_nn_pred <- predict(deep_nn_model, test_data)

deep_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(deep_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))
deep_nn_cmatrix$table
deep_nn_cmatrix$byClass

#Comparison

actual <- test_data$Class

predictions <- list(
  `Single Layer` = single_nn_pred,
  `2 Layers` = two_nn_pred,
  `Deep Neural Net` = deep_nn_pred
)

metrics_list <- list()

for (model_name in names(predictions)) {
  pred <- predictions[[model_name]]
  cm <- confusionMatrix(data = as.factor(as.numeric(pred > 0.5)), reference = as.factor(actual))
  metrics_list[[model_name]] <- cm$byClass
}


metrics_df <- do.call(cbind, metrics_list)
comparison_table <- t(metrics_df)

comparison_table %>%
  as.data.frame() %>% 
  tibble::rownames_to_column(var = "Model") %>%
  dplyr::select(Model, F1, Precision, Recall, `Balanced Accuracy`) %>%
  dplyr::arrange(desc(F1))

single_nn_cmatrix$table
two_nn_cmatrix$table
deep_nn_cmatrix$table
# Assuming single_nn_cmatrix$table, two_nn_cmatrix$table, and deep_nn_cmatrix$table 
# are the confusion matrix tables you want to compare

combined_table <- cbind(single_nn_cmatrix$table, two_nn_cmatrix$table, deep_nn_cmatrix$table)
colnames(combined_table) <- c("single_0", "single_1",
                              "two_0", "two_1",
                              "deep_0", "deep_1")
#Predicted: horizontal, Real: vertical
print(combined_table)

#Single is the best


