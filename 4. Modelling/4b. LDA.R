#Linear Discriminant Analysis

#model
lda_model <- MASS::lda(Class ~ ., 
                        data = balanced_train_data, 
                        method = "mle")
#pred
lda_pred <- predict(lda_model, newdata = test_data)$class

lda_cmatrix <- confusionMatrix(data = as.factor(lda_pred),
                           reference = as.factor(test_data$Class))
lda_cmatrix$table
lda_cmatrix$byClass





