# Naive Bayes Classifier
#technically not a machine learning algorithm


# Train the Naive Bayes model
nb_model <- naiveBayes(Class ~ ., data = balanced_train_data)

nb_pred <- predict(nb_model, test_data)


nb_cmatrix <- confusionMatrix(data = as.factor(nb_pred),reference = as.factor(test_data$Class))
nb_cmatrix$table
nb_cmatrix$byClass

#Naive Bayes is a stat model that is built on Bayes theorem, it works out the probability of events based on the the given attributes probability of being in the dataset
#Naive Bayes is known for being good for sentiment analysis but doesn't peform well in this case.








