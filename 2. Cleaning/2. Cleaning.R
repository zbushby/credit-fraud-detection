#scaling and balancing data
#if not already defined in libraries.R
#base_path_data <- "//Users//zachbushby//Documents//edu//data_science//Projects//Data//"
data <- read_csv(paste0(base_path_data, "creditcard.csv"))
#Scale time and amount
scaled_data <- data

scaled_data$Time <- scale(scaled_data$Time, center = TRUE, scale = TRUE)
scaled_data$Amount <- scale(scaled_data$Amount, center = TRUE, scale = TRUE)

#writing clean csv
write.csv(scaled_data, file = paste0(base_path_data, "scaled_creditcard.csv"), row.names = FALSE)


#balancing data

#split again so not to use the split from balancing.R in order to make no overfitting
split <- initial_split(scaled_data, prop = .8)
train_data <- training(split)
test_data <- testing(split)

train_data$Class <- as.factor(train_data$Class)


#tomek links train data
#-------------------------------------------------------------------------------
tomek_train_data <- train_data
colnames(tomek_train_data)[31] <- 'class'


tomek_train_data <- recipe(~., tomek_train_data) %>%
  step_tomek(class) %>%
  prep() %>%
  bake(new_data = NULL)
colnames(tomek_train_data)[31] <- 'Class'

write.csv(tomek_train_data, file = paste0(base_path_data, "tomek_train_creditcard.csv"), row.names = FALSE)


#smote train data
#-------------------------------------------------------------------------------
smote_train_data <- SMOTE(X = train_data[, -31], target = train_data$Class, K = 5, dup_size = 0)
smote_train_data <- smote_train_data$data
colnames(smote_train_data)[31] <- 'Class'

write.csv(smote_train_data, file = paste0(base_path_data, "smote_train_creditcard.csv"), row.names = FALSE)


#Nearmiss train data
#-------------------------------------------------------------------------------
nearmiss_train_data <- train_data
colnames(nearmiss_train_data)[31] <- 'class'

nearmiss_train_data <- recipe(~., nearmiss_train_data) %>%
  step_nearmiss(class, under_ratio = 1) %>%
  prep() %>%
  bake(new_data = NULL)
colnames(nearmiss_train_data)[31] <- 'Class'


write.csv(nearmiss_train_data, file = paste0(base_path_data, "nearmiss_train_creditcard.csv"), row.names = FALSE)

#test data
write.csv(test_data, file = paste0(base_path_data, "test_creditcard.csv"), row.names = FALSE)

