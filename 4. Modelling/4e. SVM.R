#Support Vector Machines
set.seed(123)
nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
smote_train_data$Class <- as.factor(smote_train_data$Class)
tomek_train_data$Class <- as.factor(tomek_train_data$Class)
test_data$Class <- as.factor(test_data$Class)

#Near Miss Data
#------------------------------------------------------------------------------
#linear SVM
nearmiss_linear_svm_model <- svm(Class ~ .,
               data = nearmiss_train_data,
               kernel = "linear",
               cost = 1,
               scale = FALSE)

nearmiss_linear_svm_pred <- predict(nearmiss_linear_svm_model, newdata = test_data, type = "response")
nearmiss_linear_svm_cmatrix <- confusionMatrix(data = as.factor(nearmiss_linear_svm_pred),reference = as.factor(test_data$Class))



#polynomial kernal
nearmiss_poly_svm_model <- svm(Class ~ .,
                 data = nearmiss_train_data,
                 kernel = "polynomial",
                 cost = 1,
                 scale = FALSE)

nearmiss_poly_svm_pred <- predict(nearmiss_poly_svm_model, newdata = test_data, type = "response")
nearmiss_poly_svm_cmatrix <- confusionMatrix(data = as.factor(nearmiss_poly_svm_pred),reference = as.factor(test_data$Class))

#radial kernal
nearmiss_radial_svm_model <- svm(Class ~ .,
                 data = nearmiss_train_data,
                 kernel = "radial",
                 cost = 1,
                 scale = FALSE)

nearmiss_radial_svm_pred <- predict(nearmiss_radial_svm_model, newdata = test_data, type = "response")
nearmiss_radial_svm_cmatrix <- confusionMatrix(data = as.factor(nearmiss_radial_svm_pred),reference = as.factor(test_data$Class))


#SMOTE Data
#sooooo slow bc of the amount of the huge dataset
#------------------------------------------------------------------------------

#linear SVM
smote_linear_svm_model <- svm(Class ~ .,
                                 data = smote_train_data,
                                 kernel = "linear",
                                 cost = 1,
                                 scale = FALSE)

smote_linear_svm_pred <- predict(smote_linear_svm_model, newdata = test_data, type = "response")
smote_linear_svm_cmatrix <- confusionMatrix(data = as.factor(smote_linear_svm_pred),reference = as.factor(test_data$Class))



#polynomial kernal
smote_poly_svm_model <- svm(Class ~ .,
                               data = smote_train_data,
                               kernel = "polynomial",
                               cost = 1,
                               scale = FALSE)

smote_poly_svm_pred <- predict(smote_poly_svm_model, newdata = test_data, type = "response")
smote_poly_svm_cmatrix <- confusionMatrix(data = as.factor(smote_poly_svm_pred),reference = as.factor(test_data$Class))

#radial kernal
smote_radial_svm_model <- svm(Class ~ .,
                                 data = smote_train_data,
                                 kernel = "radial",
                                 cost = 1,
                                 scale = FALSE)

smote_radial_svm_pred <- predict(smote_radial_svm_model, newdata = test_data, type = "response")
smote_radial_svm_cmatrix <- confusionMatrix(data = as.factor(smote_radial_svm_pred),reference = as.factor(test_data$Class))


#Tomek Links Data
#------------------------------------------------------------------------------

#linear SVM
tomek_linear_svm_model <- svm(Class ~ .,
                              data = tomek_train_data,
                              kernel = "linear",
                              cost = 1,
                              scale = FALSE)

tomek_linear_svm_pred <- predict(tomek_linear_svm_model, newdata = test_data, type = "response")
tomek_linear_svm_cmatrix <- confusionMatrix(data = as.factor(tomek_linear_svm_pred),reference = as.factor(test_data$Class))



#polynomial kernal
tomek_poly_svm_model <- svm(Class ~ .,
                            data = tomek_train_data,
                            kernel = "polynomial",
                            cost = 1,
                            scale = FALSE)

tomek_poly_svm_pred <- predict(tomek_poly_svm_model, newdata = test_data, type = "response")
tomek_poly_svm_cmatrix <- confusionMatrix(data = as.factor(tomek_poly_svm_pred),reference = as.factor(test_data$Class))

#radial kernal
tomek_radial_svm_model <- svm(Class ~ .,
                              data = tomek_train_data,
                              kernel = "radial",
                              cost = 1,
                              scale = FALSE)

tomek_radial_svm_pred <- predict(tomek_radial_svm_model, newdata = test_data, type = "response")
tomek_radial_svm_cmatrix <- confusionMatrix(data = as.factor(tomek_radial_svm_pred),reference = as.factor(test_data$Class))




# #Comparison
# 
# actual <- test_data$Class
# 
# predictions <- list(
#   Linear = linear_svm_pred,
#   Polynomial = poly_svm_pred,
#   Radial = radial_svm_pred
# )
# 
# metrics_list <- list()
# 
# for (model_name in names(predictions)) {
#   pred <- predictions[[model_name]]
#   cm <- confusionMatrix(data = as.factor(pred), reference = as.factor(actual))
#   metrics_list[[model_name]] <- cm$byClass
# }
# 
# 
# metrics_df <- do.call(cbind, metrics_list)
# comparison_table <- t(metrics_df)
# 
# comparison_table %>% 
#   as.data.frame() %>% 
#   rownames_to_column(var = "Model") %>%
#   arrange(desc(Recall))
# #polynomial SVM has the highest recall although linear has the highest precision
# 
# #confusion matrices
# radial_svm_cmatrix$table
# linear_svm_cmatrix$table
# poly_svm_cmatrix$table
# 
# #pick polynomial model
# 
# svm_model <- poly_svm_model
# svm_pred <- poly_svm_pred
# svm_cmatrix <- poly_svm_cmatrix


