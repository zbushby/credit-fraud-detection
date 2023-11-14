#Kth Nearest Neighbour
set.seed(123)
nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
smote_train_data$Class <- as.factor(smote_train_data$Class)
tomek_train_data$Class <- as.factor(tomek_train_data$Class)
test_data$Class <- as.factor(test_data$Class)

#nearmiss Data
#------------------------------------------------------------------------------
#selecting k, sqrt(num of data), k is odd, k%2 ==1
#floor(sqrt(nrow(nearmiss_train_data)))
nearmiss_knn_train_data <- nearmiss_train_data[,1:30]
nearmiss_knn_train_labels <- nearmiss_train_data[,31]
nearmiss_knn_test_data <- test_data[,1:30]
nearmiss_knn_test_labels <- test_data[,31]

# nearmiss_knn_pred <- knn(
#   train = nearmiss_knn_train_data, 
#   test = nearmiss_knn_test_data,
#   cl = nearmiss_knn_train_labels, 
#   k=27
# )
# saveRDS(nearmiss_knn_pred, paste0(base_path_data,"nearmiss_knn_pred.rds"))
nearmiss_knn_pred <- readRDS(paste0(base_path_data,"nearmiss_knn_pred.rds"))

nearmiss_knn_cmatrix <- confusionMatrix(data = as.factor(nearmiss_knn_pred),reference = as.factor(nearmiss_knn_test_labels))

#SMOTE Data
#------------------------------------------------------------------------------
#selecting k, sqrt(num of data), k is odd, k%2 ==1
#floor(sqrt(nrow(smote_train_data)))
#the error "too many ties in knn" is due to knn data with identical euclidian distance, 
#this is due to the smote algorithim duplicating some data points and generated synthetic samples that are too close to the decision boundary

# smote_knn_train_data <- knn_smote_train_data[,1:30]
# smote_knn_train_labels <- knn_smote_train_data[,31]
# smote_knn_test_data <- test_data[,1:30]
# smote_knn_test_labels <- test_data[,31]
# 
# smote_knn_pred <- knn(
#   train = smote_knn_train_data, 
#   test = smote_knn_test_data,
#   cl = smote_knn_train_labels, 
#   k=674
# )
# saveRDS(smote_knn_pred, paste0(base_path_data,"smote_knn_pred.rds"))
# smote_knn_pred <- readRDS(paste0(base_path_data,"smote_knn_pred.rds"))
# 
# smote_knn_cmatrix <- confusionMatrix(data = as.factor(smote_knn_pred),reference = as.factor(smote_knn_test_labels))

#Tomek Links Data
#------------------------------------------------------------------------------
#selecting k, sqrt(num of data), k is odd, k%2 ==1
#floor(sqrt(nrow(tomek_train_data)))
tomek_knn_train_data <- tomek_train_data[,1:30]
tomek_knn_train_labels <- tomek_train_data[,31]
tomek_knn_test_data <- test_data[,1:30]
tomek_knn_test_labels <- test_data[,31]

# tomek_knn_pred <- knn(
#   train = tomek_knn_train_data, 
#   test = tomek_knn_test_data,
#   cl = tomek_knn_train_labels, 
#   k=477
# )
# saveRDS(tomek_knn_pred, paste0(base_path_data,"tomek_knn_pred.rds"))
tomek_knn_pred <- readRDS(paste0(base_path_data,"tomek_knn_pred.rds"))

tomek_knn_cmatrix <- confusionMatrix(data = as.factor(tomek_knn_pred),reference = as.factor(tomek_knn_test_labels))







