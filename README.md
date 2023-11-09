# Credit Card Fraud Detection using Machine Learning 
[Project Website](https://zbushby.github.io/credit-fraud-detection/)

It is important that credit card companies are able to recognize fraudulent credit card transactions so that customers are not charged for items that they did not purchase.


<p align="center">
  <img src="/img/DALL_E.png" alt="DALL·E Image" height="600" width="600">
</p>


## Overview
The dataset contains transactions made by credit cards in September 2013 by European cardholders.
This dataset presents transactions that occurred in two days, where we have 492 frauds out of 284,807 transactions. The dataset is highly unbalanced, the positive class (frauds) account for 0.172% of all transactions.

It contains only numerical input variables which are the result of a PCA transformation. Unfortunately, due to confidentiality issues, Kaggle cannot provide the original features and more background information about the data. Features V1, V2, … V28 are the principal components obtained with PCA, the only features which have not been transformed with PCA are 'Time' and 'Amount'. Feature 'Time' contains the seconds elapsed between each transaction and the first transaction in the dataset. The feature 'Amount' is the transaction Amount, this feature can be used for example-dependent cost-sensitive learning. Feature 'Class' is the response variable and it takes value 1 in case of fraud and 0 otherwise.

## Cleaning
Balanced the Datasets by random undersampling as this method had the best precision when modelling through a logistic regression. Comparison of undersampling, oversampling, Tomek, SMOTE, SMOTEtomek, near miss and no method can be found in the [Balancing.R file](https://github.com/zbushby/credit-fraud-detection/blob/main/2.%20Cleaning/2a.%20Balancing.R)


## EDA
[EDA Report on Given Data](https://htmlpreview.github.io/?https://github.com/zbushby/credit-fraud-detection/blob/main/3.%20EDA/report.html#correlation-analysis)
Key Findings
- PCA confirmed to have taken place*
- There is no missing data
- Fraudulent data is 0.172% of transactions, very imbalanced data.

*PCA at it's heart involves diagonalising a matrix which means solving for the eigenvalues and eigenvectors of that matrix. The whole purpose of the calculation is to find a diagonal representation of the matrix (i.e. only elements along the diagonal of the matrix). By doing PCA again we see the values are the same which proves PCA was done to begin with as PCA on PCA is essentially  trying to calculate the eigenvalues of a diagonal matrix, which yields the exact same diagonal matrix. In addition we can see the components are scaled shown by their distributions around 0.

[EDA Report on Cleaned Data](https://htmlpreview.github.io/?https://github.com/zbushby/credit-fraud-detection/blob/main/3.%20EDA/balanced_train_data_report.html)
-  V1, V3, V7, V9 , V10, V12, V14, V16, V17 are negatively correlated with fraud
-  V2, V4, V11, V19 and Time are positively correlated with fraud
- Time seems to be strongly positively correlated to all independant and dependant variables.



## Machine Learning Algorithims

### Logistic Regression
### GBM
### XGBoost
### Neural Network


## Acknowledgements
The dataset has been collected and analysed during a research collaboration between Worldline and the Machine Learning Group (http://mlg.ulb.ac.be) of ULB (Université Libre de Bruxelles) on big data mining and fraud detection.

### [Credit Card Fraud Data](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud/download?datasetVersionNumber=3)



#### Resources:

https://fraud-detection-handbook.github.io/fraud-detection-handbook/Chapter_3_GettingStarted/SimulatedDataset.html 


