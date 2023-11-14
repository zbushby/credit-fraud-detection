# Neural Network Classifier

#nearmiss Data
#------------------------------------------------------------------------------

#single layer
nearmiss_single_nn_model = neuralnet(
  Class~.,
  data=nearmiss_train_data,
  hidden=c(30),
  threshold = 0.5,
  linear.output = FALSE
)
saveRDS(nearmiss_single_nn_model, paste0(base_path_data,"nearmiss_single_nn_model.rds"))
nearmiss_single_nn_model <- readRDS(paste0(base_path_data,"nearmiss_single_nn_model.rds"))

#plot(single_nn_model,rep = "best")
nearmiss_single_nn_pred <- predict(nearmiss_single_nn_model, test_data)
nearmiss_single_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(nearmiss_single_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))



#2 hidden layers
nearmiss_two_nn_model = neuralnet(
  Class~.,
  data=nearmiss_train_data,
  hidden=c(60,30),
  threshold = 0.5,
  linear.output = FALSE
)
saveRDS(nearmiss_two_nn_model, paste0(base_path_data,"nearmiss_two_nn_model.rds"))
nearmiss_two_nn_model <- readRDS(paste0(base_path_data,"nearmiss_two_nn_model.rds"))

#plot(two_nn_model,rep = "best")
nearmiss_two_nn_pred <- predict(nearmiss_two_nn_model, test_data)
nearmiss_two_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(nearmiss_two_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))

#Deep Neural Network
nearmiss_deep_nn_model = neuralnet(
  Class~.,
  data=nearmiss_train_data,
  hidden=c(100,50,25),
  linear.output = FALSE
)
saveRDS(nearmiss_deep_nn_model, paste0(base_path_data,"nearmiss_deep_nn_model.rds"))
nearmiss_deep_nn_model <- readRDS(paste0(base_path_data,"nearmiss_deep_nn_model.rds"))

#plot(deep_nn_model,rep = "best")
nearmiss_deep_nn_pred <- predict(nearmiss_deep_nn_model, test_data)
nearmiss_deep_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(nearmiss_deep_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))

#SMOTE Data
#------------------------------------------------------------------------------
smote_single_nn_model = neuralnet(
  Class~.,
  data=smote_train_data,
  hidden=c(30),
  threshold = 0.5,
  linear.output = FALSE
)
saveRDS(smote_single_nn_model, paste0(base_path_data,"smote_single_nn_model.rds"))
smote_single_nn_model <- readRDS(paste0(base_path_data,"smote_single_nn_model.rds"))

#plot(single_nn_model,rep = "best")
smote_single_nn_pred <- predict(smote_single_nn_model, test_data)
smote_single_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(smote_single_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))



#2 hidden layers
smote_two_nn_model = neuralnet(
  Class~.,
  data=smote_train_data,
  hidden=c(60,30),
  threshold = 0.5,
  linear.output = FALSE
)
saveRDS(smote_two_nn_model, paste0(base_path_data,"smote_two_nn_model.rds"))
smote_two_nn_model <- readRDS(paste0(base_path_data,"smote_two_nn_model.rds"))

#plot(two_nn_model,rep = "best")
smote_two_nn_pred <- predict(smote_two_nn_model, test_data)
smote_two_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(smote_two_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))

#Deep Neural Network
smote_deep_nn_model = neuralnet(
  Class~.,
  data=smote_train_data,
  hidden=c(100,50,25),
  linear.output = FALSE
)
saveRDS(smote_deep_nn_model, paste0(base_path_data,"smote_deep_nn_model.rds"))
smote_deep_nn_model <- readRDS(paste0(base_path_data,"smote_deep_nn_model.rds"))

#plot(deep_nn_model,rep = "best")
smote_deep_nn_pred <- predict(smote_deep_nn_model, test_data)
smote_deep_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(smote_deep_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))


#Tomek Links Data
#------------------------------------------------------------------------------
tomek_single_nn_model = neuralnet(
  Class~.,
  data=tomek_train_data,
  hidden=c(30),
  threshold = 0.5,
  linear.output = FALSE
)
saveRDS(tomek_single_nn_model, paste0(base_path_data,"tomek_single_nn_model.rds"))
tomek_single_nn_model <- readRDS(paste0(base_path_data,"tomek_single_nn_model.rds"))

#plot(single_nn_model,rep = "best")
tomek_single_nn_pred <- predict(tomek_single_nn_model, test_data)
tomek_single_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(tomek_single_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))



#2 hidden layers
tomek_two_nn_model = neuralnet(
  Class~.,
  data=tomek_train_data,
  hidden=c(60,30),
  threshold = 0.5,
  linear.output = FALSE
)
saveRDS(tomek_two_nn_model, paste0(base_path_data,"tomek_two_nn_model.rds"))
tomek_two_nn_model <- readRDS(paste0(base_path_data,"tomek_two_nn_model.rds"))

#plot(two_nn_model,rep = "best")
tomek_two_nn_pred <- predict(tomek_two_nn_model, test_data)
tomek_two_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(tomek_two_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))

#Deep Neural Network
tomek_deep_nn_model = neuralnet(
  Class~.,
  data=tomek_train_data,
  hidden=c(100,50,25),
  linear.output = FALSE
)
saveRDS(tomek_deep_nn_model, paste0(base_path_data,"tomek_deep_nn_model.rds"))
tomek_deep_nn_model <- readRDS(paste0(base_path_data,"tomek_deep_nn_model.rds"))

#plot(deep_nn_model,rep = "best")
tomek_deep_nn_pred <- predict(tomek_deep_nn_model, test_data)
tomek_deep_nn_cmatrix <- confusionMatrix(data = as.factor(ifelse(tomek_deep_nn_pred>0.5,1,0)), reference = as.factor(test_data$Class))


#Comparison
# 
# actual <- test_data$Class
# 
# predictions <- list(
#   `Single Layer` = single_nn_pred,
#   `2 Layers` = two_nn_pred,
#   `Deep Neural Net` = deep_nn_pred
# )
# 
# metrics_list <- list()
# 
# for (model_name in names(predictions)) {
#   pred <- predictions[[model_name]]
#   cm <- confusionMatrix(data = as.factor(as.numeric(pred > 0.5)), reference = as.factor(actual))
#   metrics_list[[model_name]] <- cm$byClass
# }
# 
# 
# metrics_df <- do.call(cbind, metrics_list)
# comparison_table <- t(metrics_df)
# 
# comparison_table %>%
#   as.data.frame() %>% 
#   tibble::rownames_to_column(var = "Model") %>%
#   dplyr::select(Model, F1, Precision, Recall, `Balanced Accuracy`) %>%
#   dplyr::arrange(desc(F1))
# 
# single_nn_cmatrix$table
# two_nn_cmatrix$table
# deep_nn_cmatrix$table
# # Assuming single_nn_cmatrix$table, two_nn_cmatrix$table, and deep_nn_cmatrix$table 
# # are the confusion matrix tables you want to compare
# 
# combined_table <- cbind(single_nn_cmatrix$table, two_nn_cmatrix$table, deep_nn_cmatrix$table)
# colnames(combined_table) <- c("single_0", "single_1",
#                               "two_0", "two_1",
#                               "deep_0", "deep_1")
# #Predicted: horizontal, Real: vertical
# print(combined_table)
# 
# #Single is the best
# 
# 
