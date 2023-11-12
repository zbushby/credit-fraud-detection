# Gradient Boosting Machine
balanced_train_data$Class <- as.numeric(balanced_train_data$Class)

#first tree
T1 <- rpart(Class ~ ., data = balanced_train_data, maxdepth = 1, cp = 0)
rpart.plot(T1)

pred1 <- predict(T1)
lambda <- 1
res1 <- (balanced_train_data$Class - lambda*pred1)
ggplot(tibble(res1), aes(res1)) + geom_histogram()

#second tree
T2 <- rpart(res1 ~ . - Class, data = balanced_train_data, maxdepth = 1, cp = 0)
rpart.plot(T2)

pred2 <- predict(T2)
res2 <- balanced_train_data$Class - lambda * (pred1 + pred2)
ggplot(tibble(res2), aes(res2)) + geom_histogram()

#third tree
T3 <- rpart(res2 ~ . - Class, data = balanced_train_data, maxdepth = 1, cp = 0)
rpart.plot(T3)
pred3 <- predict(T3)
res3 <- balanced_train_data$Class - lambda * (pred1 + pred2 + pred3)
ggplot(tibble(res3), aes(res3)) + geom_histogram()



#hundreth tree
lambda <- 1 #shrinkage parameter, smalled = slower learning rate
res <- list(); Ts <- list(); pred_total <- rep(0, nrow(balanced_train_data)); J <- 100
for(i in 1:J) {
  res[[i]] <- balanced_train_data$Class - lambda * pred_total
  Ts[[i]] <- rpart(res[[i]] ~ . - Class, data = balanced_train_data, maxdepth = 1, cp = 0)
  pred_total <- pred_total + predict(Ts[[i]])
}
ggplot(tibble(res = res[[J]]), aes(res)) + geom_histogram()


#train gbm
gbm_model = gbm(balanced_train_data$Class ~.,
                data = balanced_train_data,
                distribution = "multinomial",
                cv.folds = 10,
                shrinkage = .01,
                n.minobsinnode = 10,
                n.trees = 500)

print(gbm_model)
summary(gbm_model)

gbm_pred = predict.gbm(object = gbm_model,
                        newdata = test_data[,1:30],
                        n.trees = 500,           # 500 tress to be built
                        type = "response")

class_names = as.numeric(colnames(gbm_pred)[apply(gbm_pred, 1, which.max)])

gbm_cmatrix <- confusionMatrix(data = as.factor(class_names), reference = as.factor(test_data$Class))
gbm_cmatrix$table
gbm_cmatrix$byClass








