
#Scale time and amount
data 

# Assuming your data frame is named 'df' and the columns you want to scale are 'column1' and 'column2'
df$column1_scaled <- scale(df$column1, center = TRUE, scale = TRUE)
df$column2_scaled <- scale(df$column2, center = TRUE, scale = TRUE)


#examples of different sampling methods
#undersampling: maybe remove key charateristics - naive
#oversampling : decreasing variance - overfitting - naive
#synthetic minority oversampling technique (SMOTE)
#near miss algorithim
#Tomek Links undersampling: takes 2 observations of different classes whos distance is shortest using KNN then deletes majority class





#writing clean csv

# Assuming your data frame is named df
write.csv(df, file = "your_data.csv", row.names = FALSE)


