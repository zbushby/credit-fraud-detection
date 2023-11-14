#Linear Discriminant Analysis


#Near Miss Data
#------------------------------------------------------------------------------
#model
# nearmiss_lda_model <- MASS::lda(Class ~ ., 
#                                 data = nearmiss_train_data, 
#                                 method = "mle")
# saveRDS(nearmiss_lda_model, paste0(base_path_data,"nearmiss_lda_model.rds"))
nearmiss_lda_model <- readRDS(paste0(base_path_data,"nearmiss_lda_model.rds"))

#pred
nearmiss_lda_pred <- predict(nearmiss_lda_model, newdata = test_data)$class



nearmiss_lda_cmatrix <- confusionMatrix(data = as.factor(nearmiss_lda_pred),
                                        reference = as.factor(test_data$Class))
#nearmiss_lda_cmatrix$table
#nearmiss_lda_cmatrix$byClass
set.seed(123)

#SMOTE Data
#------------------------------------------------------------------------------
# smote_lda_model <- MASS::lda(Class ~ ., 
#                              data = smote_train_data, 
#                              method = "mle")
# saveRDS(smote_lda_model, paste0(base_path_data,"smote_lda_model.rds"))
smote_lda_model <- readRDS(paste0(base_path_data,"smote_lda_model.rds"))

#pred
smote_lda_pred <- predict(smote_lda_model, newdata = test_data)$class



smote_lda_cmatrix <- confusionMatrix(data = as.factor(smote_lda_pred),
                                     reference = as.factor(test_data$Class))

#Tomek Links Data
#------------------------------------------------------------------------------
# tomek_lda_model <- MASS::lda(Class ~ ., 
#                              data = tomek_train_data, 
#                              method = "mle")
# saveRDS(tomek_lda_model, paste0(base_path_data,"tomek_lda_model.rds"))
tomek_lda_model <- readRDS(paste0(base_path_data,"tomek_lda_model.rds"))

#pred
tomek_lda_pred <- predict(tomek_lda_model, newdata = test_data)$class



tomek_lda_cmatrix <- confusionMatrix(data = as.factor(tomek_lda_pred),
                                     reference = as.factor(test_data$Class))

