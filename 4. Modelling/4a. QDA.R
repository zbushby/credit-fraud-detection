#Quadratic Discriminant Analysis

#model
qda_model <- MASS::qda(Class ~ ., 
                       data = balanced_train_data, 
                       method = "mle")
#pred
qda_pred <- predict(qda_model, newdata = test_data)$class

qda_cmatrix <- confusionMatrix(data = as.factor(qda_pred),
                               reference = as.factor(test_data$Class))
qda_cmatrix$table
qda_cmatrix$byClass

