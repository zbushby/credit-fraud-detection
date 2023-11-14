# Naive Bayes Classifier
#Support Vector Machines
set.seed(123)
nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
smote_train_data$Class <- as.factor(smote_train_data$Class)
tomek_train_data$Class <- as.factor(tomek_train_data$Class)
test_data$Class <- as.factor(test_data$Class)

#nearmiss Data
#------------------------------------------------------------------------------
# nearmiss_nb_model <- naiveBayes(Class ~ ., data = nearmiss_train_data)
# saveRDS(nearmiss_nb_model, "./nearmiss_nb_model.rds")
nearmiss_nb_model <- readRDS("./nearmiss_nb_model.rds")

nearmiss_nb_pred <- predict(nearmiss_nb_model, test_data)
nearmiss_nb_cmatrix <- confusionMatrix(data = as.factor(nearmiss_nb_pred),reference = as.factor(test_data$Class))

#SMOTE Data
#------------------------------------------------------------------------------
# smote_nb_model <- naiveBayes(Class ~ ., data = smote_train_data)
# saveRDS(smote_nb_model, "./smote_nb_model.rds")
smote_nb_model <- readRDS("./smote_nb_model.rds")

smote_nb_pred <- predict(smote_nb_model, test_data)
smote_nb_cmatrix <- confusionMatrix(data = as.factor(smote_nb_pred),reference = as.factor(test_data$Class))

#Tomek Links Data
#------------------------------------------------------------------------------
# tomek_nb_model <- naiveBayes(Class ~ ., data = tomek_train_data)
# saveRDS(tomek_nb_model, "./tomek_nb_model.rds")
tomek_nb_model <- readRDS("./tomek_nb_model.rds")

tomek_nb_pred <- predict(tomek_nb_model, test_data)
tomek_nb_cmatrix <- confusionMatrix(data = as.factor(tomek_nb_pred),reference = as.factor(test_data$Class))

#Naive Bayes is a stat model that is built on Bayes theorem, it works out the probability of events based on the the given attributes probability of being in the dataset
#Naive Bayes is known for being good for sentiment analysis but doesn't peform well in this case.








