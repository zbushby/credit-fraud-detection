#Kth Nearest Neighbour

balanced_train_data$Class <- as.factor(balanced_train_data$Class)


#selecting k, sqrt(num of data), k is odd, k%2 ==1
floor(sqrt(nrow(balanced_train_data)))

knn_train_data <- balanced_train_data[,1:30]
knn_train_labels <- balanced_train_data[,31]
knn_test_data <- test_data[,1:30]
knn_test_labels <- test_data[,31]

knn_pred <- knn(
  train = knn_train_data, 
  test = knn_test_data,
  cl = knn_train_labels, 
  k=27
)

knn_cmatrix <- confusionMatrix(data = as.factor(knn_pred),reference = as.factor(knn_test_labels))
knn_cmatrix$table
knn_cmatrix$byClass








