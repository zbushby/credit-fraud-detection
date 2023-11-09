# I want to learn about different balancing techniques so here is a comparison training a logisitic regression 

set.seed(123)
scaled_data$Class <- as.factor(scaled_data$Class)

table(scaled_data$Class)
#0.001727486 of dataset is fraud


# logistic regression with current imbalanced data 
#-----------------------------------------------------------------------------

split <- initial_split(scaled_data, prop = .8)

train_data <- training(split)
test_data <- testing(split)


#Logistic regression
model <- glm(Class ~.,data = train_data, family = binomial(link="logit"))
pred <- predict(model, newdata = test_data, type = "response")

#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred > 0.5)),
                            reference = test_data$Class)

cmatrix$byClass

# predicted 62 fraudulent observations but miss classified 45 observations
#high Type I error
# We want no information rate to be substantially lower than accuracy
#no information rate = 0.9981 and accuracy  = 0.999
#since 0.0017 of the dataset is fraudulent a algorithim that just picked all of it as non-fraud would have 0.99 accuracy

#Confusion Matrix:
#           Reference
# Prediction     0     1
#           0 56845    45
#           1    10    62





#over-sampling 
#-----------------------------------------------------------------------------
# This method involves randomly selecting from the minority class and simply 
# duplicating each observation until the number of minority class observations
# are equal to the number of majority class observations.
# only do undersampling on training datasets.


train_over_sample <- upSample(x = train_data[,-31], y = train_data$Class)
table(train_over_sample$Class) #even amount of fraud and non-fraud, 227460 for each (lots of data)

#Logistic regression
model_over <- glm(Class ~.,data = train_over_sample, family = binomial(link="logit"))
pred_over <- predict(model_over, newdata = test_data, type = "response")

#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_over > 0.5)),
                           reference = test_data$Class)
cmatrix

cmatrix$byClass

#F-Score worse than the OG dataset
#less false positive values (Type I error) but more false negatives (Type II Error)
#worse model overall but better for detecting fraud 
#no information rate > accuracy (0.9981 > 0.9789 ) = bad 

#Confusion matrix:
#           Reference
# Prediction     0     1
#           0 55664    13
#           1  1191    94





#under-sampling
#-----------------------------------------------------------------------------
train_under_sample <- downSample(x = train_data[,-31], y = train_data$Class)
table(train_under_sample$Class) #even amount of fraud and non-fraud but 385 for each (less data)



#Logistic regression (raw)
model_under <- glm(Class ~.,data = train_under_sample, family = binomial(link="logit"))
pred_under <- predict(model_under, newdata = test_data, type = "response")

#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_under > 0.5)),
                           reference = test_data$Class)
cmatrix

cmatrix$byClass

#F Score: 0.90800150, worse than first and second
#no information rate > accuracy (significantly higher, 0.9981 > 0.8318) = bad
#less false positive values (Type I error) but more false negatives (Type II Error)
#worse model overall but better for detecting fraud 

#Confusion Matrix:
#             Reference
# Prediction     0     1
#           0 47281     7
#           1  9574   100




#synthetic minority oversampling technique (SMOTE)
#-----------------------------------------------------------------------------

train_smote_sample <- SMOTE(X = train_data[, -31], target = train_data$Class, K = 5, dup_size = 0)
train_smote_sample <- train_smote_sample$data
table(train_smote_sample$class)

head(train_smote_sample$class)

#Logistic regression (raw)
model_smote <- glm(class ~.,data = train_smote_sample, family = binomial(link="logit"))
pred_smote <- predict(model_smote, newdata = test_data, type = "response")


#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_smote > 0.5)),
                           reference = test_data$Class)
cmatrix

cmatrix$byClass


#near miss algorithim
#-----------------------------------------------------------------------------





#Tomek Links undersampling
#-----------------------------------------------------------------------------

















#Notes

#examples of different sampling methods
#undersampling: maybe remove key charateristics - naive
#oversampling : decreasing variance - overfitting - naive
#synthetic minority oversampling technique (SMOTE)
#near miss algorithim
#Tomek Links undersampling: takes 2 observations of different classes whos distance is shortest using KNN then deletes majority class






