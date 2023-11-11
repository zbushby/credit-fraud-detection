

head(data)

#checks
summary(data)

#missing values
sum(is.na(data)) # no missing values

#relationship of numerical variables
pairs(data)

#correlation matrix for numerical variables
correlations <- cor(data %>% select_if(is.numeric), use = "complete.obs")
corrplot::corrplot(correlations, method = "circle")

#boxplot to check for outliers
boxplot(data)

#histogram
hist(data)

#histogram
ggplot(data, aes(x = numeric_column)) + 
  geom_histogram(binwidth = 1, fill = "blue", color = "black")

#bar plot for categorical variables to check frequency of each category
ggplot(data, aes(x = factor_column)) + 
  geom_bar()

#EDA report
create_report(data)
#EDA report on balanced data
create_report(balanced_train_data)

# % of how many fraud/non-fraud
no_frauds <- sum(data$Class == 0) / nrow(data) * 100
frauds <- sum(data$Class == 1) / nrow(data) * 100
cat('No Frauds', round(no_frauds, 2), '% of the dataset\n') #99.83%
cat('Frauds', round(frauds, 2), '% of the dataset\n') #0.17%

#Dataset is imbalanced hence we need to use implement a resampling technique
#dataset should be 50/50 fraud/non-fraud data so that we reduce the chance of overfitting and wrong correlations
#downsampling: remove points
#upsampling: multipling fraud data points
#synthetic data: pick points around fraud points

#dist of transaction amount
#amount is the transaction amount
hist(data$Amount)

#dist of transaction amount
#time is the time between the current transaction and the first transaction
hist(data$Time)

#time and amount need to be scaled 
# we can assume since all the V variables have undergone PCA that they were scaled beforehand as this is a requirement for PCA



#outlier detection
boundary <- 2.58 #99%

for (col in names(data)) {
  if (is.numeric(data[[col]])) {
    # Boxplot
    boxplot(data[[col]], main=paste("Boxplot -", col), ylab=col)
    
    # Calculate IQR
    Q1 <- quantile(data[[col]], 0.25)
    Q3 <- quantile(data[[col]], 0.75)
    IQR <- IQR(data[[col]])
    lower_bound <- Q1 - boundary * IQR
    upper_bound <- Q3 + boundary * IQR
    
    # Identifying outliers
    outliers <- subset(data, data[[col]] < lower_bound | data[[col]] > upper_bound)
    print(paste("Outliers in", col, ":", nrow(outliers)))
  }
}
#all 492 outliers that were detected are from the fraud class so don't remove







