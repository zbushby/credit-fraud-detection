#Support Vector Machines

#linear SVM
linear_svm_model <- svm(Class ~ .,
               data = balanced_train_data,
               kernel = "linear",
               cost = 1,
               scale = FALSE)

linear_svm_pred <- predict(linear_svm_model, newdata = test_data, type = "response")

linear_svm_cmatrix <- confusionMatrix(data = as.factor(linear_svm_pred),reference = as.factor(test_data$Class))
linear_svm_cmatrix$table
linear_svm_cmatrix$byClass


#polynomial kernal
poly_svm_model <- svm(Class ~ .,
                 data = balanced_train_data,
                 kernel = "polynomial",
                 cost = 1,
                 scale = FALSE)

poly_svm_pred <- predict(poly_svm_model, newdata = test_data, type = "response")

poly_svm_cmatrix <- confusionMatrix(data = as.factor(poly_svm_pred),reference = as.factor(test_data$Class))
poly_svm_cmatrix$table
poly_svm_cmatrix$byClass

#radial kernal
radial_svm_model <- svm(Class ~ .,
                 data = balanced_train_data,
                 kernel = "radial",
                 cost = 1,
                 scale = FALSE)

radial_svm_pred <- predict(radial_svm_model, newdata = test_data, type = "response")

radial_svm_cmatrix <- confusionMatrix(data = as.factor(radial_svm_pred),reference = as.factor(test_data$Class))
radial_svm_cmatrix$table
radial_svm_cmatrix$byClass


#Comparison

actual <- test_data$Class

predictions <- list(
  Linear = linear_svm_pred,
  Polynomial = poly_svm_pred,
  Radial = radial_svm_pred
)

metrics_list <- list()

for (model_name in names(predictions)) {
  pred <- predictions[[model_name]]
  cm <- confusionMatrix(data = as.factor(pred), reference = as.factor(actual))
  metrics_list[[model_name]] <- cm$byClass
}


metrics_df <- do.call(cbind, metrics_list)
comparison_table <- t(metrics_df)

comparison_table %>% 
  as.data.frame() %>% 
  rownames_to_column(var = "Model") %>%
  arrange(desc(Recall))
#polynomial SVM has the highest recall although linear has the highest precision

#confusion matrices
radial_svm_cmatrix$table
linear_svm_cmatrix$table
poly_svm_cmatrix$table

#pick polynomial model

svm_model <- poly_svm_model
svm_pred <- poly_svm_pred
svm_cmatrix <- poly_svm_cmatrix


