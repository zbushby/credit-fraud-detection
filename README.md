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
- All algorithims were trained on all parameters (not tuned) on 80% of the data with 20% left over data for testing. The training data was randomly undersampled.
- To improve I will do n-fold cross validation to produce more accurate metrics of the peformances of all the models.
- This imbalanced dataset required using these primary metrics: F-score, Recall & Precision; Accuracy for imbalanced dataset can be decieving
### The algorithims used were:
#### Quadratic Discriminant Analysis (QDA)
#### Linear Discriminant Analysis (LDA)
#### Logistic Regression (GLM)
- Threshold of 0.9
#### Random Forest
- 50 trees 
#### Support Vector Machine
- Polynomial kernal had the best performance
#### Naive Bayes Classifer
#### Kth Nearest Neighbour Classifer (KNN)
- k = 27
#### Gradient Boosting Machine (GBM)
- Training attributes: Num Trees: 500, 10-fold CV, v = 0.01 (slow learning), min num of data points in terminal nodes: 10.
#### Extreme Gradient Boosing (XGBoost)
- Training attributes: Num trees: 50, max tree depth: 3.
- Threshold of 0.9
#### Neural Network
- Compared different hidden layers: single layer (30), 2 layer (60,30) and deep neural network (100,50,25)
- Single hidden layer with 30 nodes




## Comparison (random undersampling)

| Model              | F1        | Precision | Recall   | Balanced Accuracy | Sensitivity |
|--------------------|-----------|-----------|----------|-------------------|-------------|
| XGBoost            | 0.9965323 | 0.9998229 | 0.9932633| 0.9507601         | 0.9932633   |
| Logistic Regression| 0.9956370 | 0.9998758 | 0.9914340| 0.9636069         | 0.9914340   |
| LDA                | 0.9934328 | 0.9998040 | 0.9871423| 0.9431124         | 0.9871423   |
| SVM                | 0.9893985 | 0.9998384 | 0.9791744| 0.9483028         | 0.9791744   |
| GBM                | 0.9849774 | 0.9999275 | 0.9704677| 0.9668852         | 0.9704677   |
| Naive Bayes        | 0.9826203 | 0.9996906 | 0.9661232| 0.9050799         | 0.9661232   |
| Random Forest      | 0.9782111 | 0.9998714 | 0.9574693| 0.9466245         | 0.9574693   |
| QDA                | 0.9727855 | 0.9998143 | 0.9471796| 0.9277182         | 0.9471796   |
| Neural Network     | 0.9666497 | 0.9999248 | 0.9355179| 0.9494103         | 0.9355179   |

XGBoost amazing performance may be due to its robust handling of complex, non-linear data patterns and its effectiveness in managing imbalanced datasets through regularization and focused iterative improvement. 

## Hyperparameter Tuning of XGBoost


## Extras:
#### Confusion Matrices of Models:

##### Quadratic Discriminant Analysis (QDA)
| Prediction \ Reference |     0   |   1    |
|------------------------|---------|--------|
| 0                      | 53,850  |   10   |
| 1                      | 3,003   |   99   |

##### Linear Discriminant Analysis (LDA)
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 56,122  |   11   |
| 1                      |   731   |   98   |

##### Logistic Regression (GLM)
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 56,366  |    7   |
| 1                      |   487   |  102   |

##### Random Forest
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 54,435  |    7   |
| 1                      |  2,418  |  102   |

##### Support Vector Machine
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 55,669  |    9   |
| 1                      |  1,184  |  100   |

##### Naive Bayes Classifer
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 54,927  |   17   |
| 1                      |  1,926  |   92   |

##### Kth Nearest Neighbour Classifer (KNN)
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 56,391  |    8   |
| 1                      |   462   |  101   |

##### Gradient Boosting Machine (GBM)
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 55,296  |    9   |
| 1                      |  1,557  |  100   |

##### Extreme Gradient Boosing (XGBoost)
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 56,470  |   10   |
| 1                      |   383   |   99   |

##### Neural Network
| Prediction \ Reference |    0    |    1   |
|------------------------|---------|--------|
| 0                      | 53,187  |    4   |
| 1                      |  3,666  |  105   |


## Acknowledgements
The dataset has been collected and analysed during a research collaboration between Worldline and the Machine Learning Group (http://mlg.ulb.ac.be) of ULB (Université Libre de Bruxelles) on big data mining and fraud detection.

#### [Credit Card Fraud Data](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud/download?datasetVersionNumber=3)

### Improvement for the Future
- Compare metrics created by cross validation for each model.
- Tune models before comparing
- Train in keras as ReLu is probably better than sigmoid for hidden layer, neuralnet package uses sigmoid as default. Not sure the best NN hidden layers Num and Node Num.
- Remove outliers from data. When I looked for outliers all the outliers were fraud cases, maybe doing something wrong?

### Resources:

https://fraud-detection-handbook.github.io/fraud-detection-handbook/Chapter_3_GettingStarted/SimulatedDataset.html 




