#Quadratic Discriminant Analysis
set.seed(123)

#Near Miss Data
#------------------------------------------------------------------------------
#model
# nearmiss_qda_model <- MASS::qda(Class ~ ., 
#                        data = nearmiss_train_data, 
#                        method = "mle")
# saveRDS(nearmiss_qda_model, paste0(base_path_data,"nearmiss_qda_model.rds"))
nearmiss_qda_model <- readRDS(paste0(base_path_data,"nearmiss_qda_model.rds"))
#pred
nearmiss_qda_pred <- predict(nearmiss_qda_model, newdata = test_data)$class



nearmiss_qda_cmatrix <- confusionMatrix(data = as.factor(nearmiss_qda_pred),
                               reference = as.factor(test_data$Class))
#nearmiss_qda_cmatrix$table
#nearmiss_qda_cmatrix$byClass


#SMOTE Data
#------------------------------------------------------------------------------
# smote_qda_model <- MASS::qda(Class ~ ., 
#                        data = smote_train_data, 
#                        method = "mle")
# saveRDS(smote_qda_model, paste0(base_path_data,"smote_qda_model.rds"))
smote_qda_model <- readRDS(paste0(base_path_data,"smote_qda_model.rds"))

#pred
smote_qda_pred <- predict(smote_qda_model, newdata = test_data)$class



smote_qda_cmatrix <- confusionMatrix(data = as.factor(smote_qda_pred),
                               reference = as.factor(test_data$Class))

#Tomek Links Data
#------------------------------------------------------------------------------
# tomek_qda_model <- MASS::qda(Class ~ ., 
#                        data = tomek_train_data, 
#                        method = "mle")
# saveRDS(tomek_qda_model, paste0(base_path_data,"tomek_qda_model.rds"))
tomek_qda_model <- readRDS(paste0(base_path_data,"tomek_qda_model.rds"))

#pred
tomek_qda_pred <- predict(tomek_qda_model, newdata = test_data)$class



tomek_qda_cmatrix <- confusionMatrix(data = as.factor(tomek_qda_pred),
                               reference = as.factor(test_data$Class))

