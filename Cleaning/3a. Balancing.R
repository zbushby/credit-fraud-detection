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

cmatrix

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
#SMOTE explanation: https://www.analyticsvidhya.com/blog/2020/10/overcoming-class-imbalance-using-smote-techniques/

train_smote_sample <- SMOTE(X = train_data[, -31], target = train_data$Class, K = 5, dup_size = 0)
train_smote_sample <- train_smote_sample$data
table(train_smote_sample$class)
train_smote_sample$class <- as.factor(train_smote_sample$class) #class variable is a chr turn to fac

#Logistic regression
model_smote <- glm(class ~.,data = train_smote_sample, family = binomial(link="logit"))
pred_smote <- predict(model_smote, newdata = test_data, type = "response")


#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_smote > 0.5)),
                           reference = test_data$Class)
cmatrix


#not as bad as the other algorithims
#no information rate > accuracy (0.9981 > 0.9767)
# not as good as over sampling

#Confusion Matrix:
#           Reference
# Prediction     0     1
#           0 55540    13
#           1  1315    94



#near miss algorithm
#-----------------------------------------------------------------------------
#near miss-1
# Need to have a variable called 'class' for themis package
train_data_nm <- train_data
colnames(train_data_nm)[31] <- 'class'

train_nearmiss_sample <- recipe(~., train_data_nm) %>%
  step_nearmiss(class, under_ratio = 1) %>%
  prep() %>%
  bake(new_data = NULL)

table(train_nearmiss_sample$class) #even but small sample of each

#Logistic regression
model_nearmiss <- glm(class ~.,data = train_nearmiss_sample, family = binomial(link="logit"))
pred_nearmiss <- predict(model_nearmiss, newdata = test_data, type = "response")


#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_nearmiss > 0.5)),
                           reference = test_data$Class)
cmatrix
cmatrix$byClass
#No information rate > Accuracy (0.9981 > 0.9626) = bad
# F-score = 0.98088693
#Confusion Matrix:
#             Reference
# Prediction     0     1
#           0 54733    11
#           1  2122    96







#Tomek Links undersampling
#-----------------------------------------------------------------------------
#need to change to class for dependent var
train_data_t <- train_data
colnames(train_data_t)[31] <- 'class'


train_tomek_sample <- recipe(~., train_data_t) %>%
  step_tomek(class) %>%
  prep() %>%
  bake(new_data = NULL)

table(train_tomek_sample$class) # does not balance the dataset only removes outliers

#Logistic regression
model_tomek <- glm(class ~.,data = train_tomek_sample, family = binomial(link="logit"))
pred_tomek <- predict(model_tomek, newdata = test_data, type = "response")


#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_tomek > 0.5)),
                           reference = test_data$Class)
cmatrix
cmatrix$byClass

#did terrible, it is pretty much the same as the og dataset
# Confusion Matrix:
#           Reference
# Prediction     0     1
#           0 56847    45
#           1     8    62


#SMOTE-tomek hybrid approach (there is no simple package in R with this algorithm so I tried combining both)
#-----------------------------------------------------------------------------
train_data_st <- train_data
colnames(train_data_st)[31] <- 'class'


train_smote_sample <- SMOTE(X = train_data_st[, -31], target = train_data_st$class, K = 5, dup_size = 0)
train_smote_sample <- train_smote_sample$data
table(train_smote_sample$class)
train_smote_sample$class <- as.factor(train_smote_sample$class)

train_smotetomek_sample <- recipe(~., train_smote_sample) %>%
  step_tomek(class) %>%
  prep() %>%
  bake(new_data = NULL)

#Logistic regression
model_smotetomek <- glm(class ~.,data = train_smotetomek_sample, family = binomial(link="logit"))
pred_smotetomek <- predict(model_smotetomek, newdata = test_data, type = "response")


#confusion matrix
cmatrix <- confusionMatrix(data = as.factor(as.numeric(pred_smotetomek > 0.5)),
                           reference = test_data$Class)
cmatrix
cmatrix$byClass




#Comparison
#------------------------------------------------------------------------------

actual <- test_data$Class

predictions <- list(
  SMOTETomek = pred_smotetomek,
  SMOTE = pred_smote,
  Tomek = pred_tomek,
  Over = pred_over,
  Under = pred_under,
  NearMiss = pred_nearmiss,
  Regular = pred
)

metrics_list <- list()

for (model_name in names(predictions)) {
  pred <- predictions[[model_name]]
  cm <- confusionMatrix(data = as.factor(as.numeric(pred > 0.5)), reference = actual)
  metrics_list[[model_name]] <- cm$byClass
}


metrics_df <- do.call(cbind, metrics_list)
comparison_table <- t(metrics_df)

print(comparison_table)

#The best metrics to consider when classes are inbalanced
# https://www.kaggle.com/code/marcinrutecki/best-techniques-and-metrics-for-imbalanced-dataset
#Balanced Accuracy, F1 Score, precision, Recall
comparison_table <- as.data.frame(comparison_table)
comparison_table <- comparison_table %>%
  rownames_to_column(var = "Model") %>%
  select(Model, Precision, F1, Recall, `Balanced Accuracy`)

#Since positive class is more important according to Kaggle use Precision or Recall
# Hence, 
comparison_table[, c("Model","Precision", "F1", "Recall", "Balanced Accuracy")] %>% 
  data.table() %>% 
  arrange(desc(Precision))

comparison_table[, c("Model","Recall","Precision", "F1", "Balanced Accuracy")] %>% 
  data.table() %>% 
  arrange(desc(Recall))


# Pick Random undersampling as this has the best precision and better metrics compared to Tomek




#Random Notes

#examples of different sampling methods
#undersampling: maybe remove key charateristics - naive
#oversampling : decreasing variance - overfitting - naive
#synthetic minority oversampling technique (SMOTE)
#near miss algorithim
#Tomek Links undersampling: takes 2 observations of different classes whos distance is shortest using KNN then deletes majority class






