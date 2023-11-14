#scaling and balancing data


#Scale time and amount
scaled_data <- data

scaled_data$Time <- scale(scaled_data$Time, center = TRUE, scale = TRUE)
scaled_data$Amount <- scale(scaled_data$Amount, center = TRUE, scale = TRUE)

#writing clean csv
write.csv(scaled_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//scaled_creditcard.csv", row.names = FALSE)



# Outlier Detection
# remove extreme outliers as this will increase accuracy of our model


# Outlier Removal Trade off
#if we remove outliers that aren't extreme there is a risk the model will lose information and hence will have lower accuracy









#balancing data


#using random undersampling refer to Balancing.R to see comparison of different methods
split <- initial_split(scaled_data, prop = .8)
train_data <- training(split)
test_data <- testing(split)




#tomek links train data
#-------------------------------------------------------------------------------
train_data_t <- train_data
colnames(train_data_t)[31] <- 'class'


tomek_train_data <- recipe(~., train_data_t) %>%
  step_tomek(class) %>%
  prep() %>%
  bake(new_data = NULL)
colnames(tomek_train_data)[31] <- 'Class'

write.csv(tomek_train_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//tomek_train_creditcard.csv", row.names = FALSE)



#smote train data
#-------------------------------------------------------------------------------
smote_train_data <- SMOTE(X = train_data[, -31], target = train_data$Class, K = 5, dup_size = 0)
smote_train_data <- train_smote_sample$data

write.csv(smote_train_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//smote_train_creditcard.csv", row.names = FALSE)


#Nearmiss train data
#-------------------------------------------------------------------------------
nearmiss_train_data <- train_data
colnames(nearmiss_train_data)[31] <- 'class'

train_nearmiss_data <- recipe(~., nearmiss_train_data) %>%
  step_nearmiss(class, under_ratio = 1) %>%
  prep() %>%
  bake(new_data = NULL)
colnames(nearmiss_train_data)[31] <- 'Class'


write.csv(nearmiss_train_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//nearmiss_train_creditcard.csv", row.names = FALSE)

#test data
write.csv(test_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//test_creditcard.csv", row.names = FALSE)

