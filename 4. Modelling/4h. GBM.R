# Gradient Boosting Machine
set.seed(123)
nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
smote_train_data$Class <- as.factor(smote_train_data$Class)
tomek_train_data$Class <- as.factor(tomek_train_data$Class)
test_data$Class <- as.factor(test_data$Class)

# 
# #first tree
# T1 <- rpart(Class ~ ., data = balanced_train_data, maxdepth = 1, cp = 0)
# rpart.plot(T1)
# 
# pred1 <- predict(T1)
# lambda <- 1
# res1 <- (balanced_train_data$Class - lambda*pred1)
# ggplot(tibble(res1), aes(res1)) + geom_histogram()
# 
# #second tree
# T2 <- rpart(res1 ~ . - Class, data = balanced_train_data, maxdepth = 1, cp = 0)
# rpart.plot(T2)
# 
# pred2 <- predict(T2)
# res2 <- balanced_train_data$Class - lambda * (pred1 + pred2)
# ggplot(tibble(res2), aes(res2)) + geom_histogram()
# 
# #third tree
# T3 <- rpart(res2 ~ . - Class, data = balanced_train_data, maxdepth = 1, cp = 0)
# rpart.plot(T3)
# pred3 <- predict(T3)
# res3 <- balanced_train_data$Class - lambda * (pred1 + pred2 + pred3)
# ggplot(tibble(res3), aes(res3)) + geom_histogram()
# 
# 
# 
# #hundreth tree
# lambda <- 1 #shrinkage parameter, smalled = slower learning rate
# res <- list(); Ts <- list(); pred_total <- rep(0, nrow(balanced_train_data)); J <- 100
# for(i in 1:J) {
#   res[[i]] <- balanced_train_data$Class - lambda * pred_total
#   Ts[[i]] <- rpart(res[[i]] ~ . - Class, data = balanced_train_data, maxdepth = 1, cp = 0)
#   pred_total <- pred_total + predict(Ts[[i]])
# }
# ggplot(tibble(res = res[[J]]), aes(res)) + geom_histogram()
# 

#nearmiss Data
#------------------------------------------------------------------------------
#train gbm
nearmiss_gbm_model = gbm(nearmiss_train_data$Class ~.,
                data = nearmiss_train_data,
                distribution = "multinomial",
                cv.folds = 10,
                shrinkage = .01,
                n.minobsinnode = 10,
                n.trees = 50)
saveRDS(nearmiss_gbm_model, "./nearmiss_gbm_model.rds")
nearmiss_gbm_model <- readRDS("./nearmiss_gbm_model.rds")

#print(nearmiss_gbm_model)
#summary(nearmiss_gbm_model)

nearmiss_gbm_pred = predict.gbm(object = nearmiss_gbm_model,
                        newdata = test_data[,1:30],
                        n.trees = 50,           # 500 tress to be built
                        type = "response")

class_names = as.numeric(colnames(nearmiss_gbm_pred)[apply(nearmiss_gbm_pred, 1, which.max)])

nearmiss_gbm_cmatrix <- confusionMatrix(data = as.factor(class_names), reference = as.factor(test_data$Class))



#SMOTE Data
#------------------------------------------------------------------------------
#train gbm
smote_gbm_model = gbm(smote_train_data$Class ~.,
                         data = smote_train_data,
                         distribution = "multinomial",
                         cv.folds = 10,
                         shrinkage = .01,
                         n.minobsinnode = 10,
                         n.trees = 50)
saveRDS(smote_gbm_model, "./smote_gbm_model.rds")
smote_gbm_model <- readRDS("./smote_gbm_model.rds")

#print(smote_gbm_model)
#summary(smote_gbm_model)

smote_gbm_pred = predict.gbm(object = smote_gbm_model,
                                newdata = test_data[,1:30],
                                n.trees = 50,           # 500 tress to be built
                                type = "response")

class_names = as.numeric(colnames(smote_gbm_pred)[apply(smote_gbm_pred, 1, which.max)])

smote_gbm_cmatrix <- confusionMatrix(data = as.factor(class_names), reference = as.factor(test_data$Class))





#Tomek Links Data
#------------------------------------------------------------------------------
#train gbm
tomek_gbm_model = gbm(tomek_train_data$Class ~.,
                         data = tomek_train_data,
                         distribution = "multinomial",
                         cv.folds = 10,
                         shrinkage = .01,
                         n.minobsinnode = 10,
                         n.trees = 50)
saveRDS(tomek_gbm_model, "./tomek_gbm_model.rds")
tomek_gbm_model <- readRDS("./tomek_gbm_model.rds")

#print(tomek_gbm_model)
#summary(tomek_gbm_model)

tomek_gbm_pred = predict.gbm(object = tomek_gbm_model,
                                newdata = test_data[,1:30],
                                n.trees = 50,           # 500 tress to be built
                                type = "response")

class_names = as.numeric(colnames(tomek_gbm_pred)[apply(tomek_gbm_pred, 1, which.max)])

tomek_gbm_cmatrix <- confusionMatrix(data = as.factor(class_names), reference = as.factor(test_data$Class))






