#scaling and balancing data


#Scale time and amount
scaled_data <- data

scaled_data$Time <- scale(scaled_data$Time, center = TRUE, scale = TRUE)
scaled_data$Amount <- scale(scaled_data$Amount, center = TRUE, scale = TRUE)

#writing clean csv

write.csv(scaled_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//scaled_creditcard.csv", row.names = FALSE)


#balancing data


write.csv(balanced_data, file = "//Users//zachbushby//Documents//Uni//Career//Projects//Data//balanced_creditcard.csv", row.names = FALSE)


