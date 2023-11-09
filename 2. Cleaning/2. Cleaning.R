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

balanced_train_data <- downSample(x = train_data[,-31], y = train_data$Class)

#balanced train data
write.csv(balanced_train_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//balanced_train_creditcard.csv", row.names = FALSE)
#test data
write.csv(test_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//test_creditcard.csv", row.names = FALSE)

