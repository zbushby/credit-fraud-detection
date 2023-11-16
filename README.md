# Credit Card Fraud Detection using Machine Learning 

It is important that credit card companies are able to recognize fraudulent credit card transactions so that customers are not charged for items that they did not purchase.


<p align="center">
  <img src="/img/DALL_E.png" alt="DALL·E Image" height="600" width="600">
</p>


## Overview
The dataset contains transactions made by credit cards in September 2013 by European cardholders.
This dataset presents transactions that occurred in two days, where we have 492 frauds out of 284,807 transactions. The dataset is highly unbalanced, the positive class (frauds) account for 0.172% of all transactions.

It contains only numerical input variables which are the result of a PCA transformation. Unfortunately, due to confidentiality issues, Kaggle cannot provide the original features and more background information about the data. Features V1, V2, … V28 are the principal components obtained with PCA, the only features which have not been transformed with PCA are 'Time' and 'Amount'. Feature 'Time' contains the seconds elapsed between each transaction and the first transaction in the dataset. The feature 'Amount' is the transaction Amount, this feature can be used for example-dependent cost-sensitive learning. Feature 'Class' is the response variable and it takes value 1 in case of fraud and 0 otherwise.

## Cleaning
In order to accurately detect fradulent case we must balance the data having close to even fraud/non-fraud cases through the following methods:
Comparison of undersampling, oversampling, Tomek, SMOTE, SMOTEtomek, near miss and no method can be found in the [Balancing.R file](https://github.com/zbushby/credit-fraud-detection/blob/main/2.%20Cleaning/2a.%20Balancing.R). The comparison was achieved by using these methods on the training dataset for a logisitc regression and comparing results through the test data. 
- Time and Amount were scaled before using selected methods.
- I created training datasets using Tomek Links (undersampling) (highest f1 & recall), SMOTE (oversampling) (well-rounded) and near miss (undersampling) (highest balanced accuracy & precision).

| Method     | F1         | Recall     | Precision  | Balanced Accuracy |
|------------|------------|------------|------------|-------------------|
| Tomek      | 0.9995341  | 0.9998593  | 0.9992090  | 0.7896493         |
| Regular    | 0.9995165  | 0.9998241  | 0.9992090  | 0.7896317         |
| Over       | 0.9892200  | 0.9788937  | 0.9997665  | 0.9286992         |
| SMOTE      | 0.9882579  | 0.9770117  | 0.9997660  | 0.9277582         |
| SMOTETomek | 0.9881769  | 0.9768534  | 0.9997660  | 0.9276790         |
| Under      | 0.9842914  | 0.9692903  | 0.9997642  | 0.9238975         |
| NearMiss   | 0.9809143  | 0.9627298  | 0.9997991  | 0.9299630         |

## EDA
[EDA Report on Given Data](https://htmlpreview.github.io/?https://github.com/zbushby/credit-fraud-detection/blob/main/3.%20EDA/report.html#correlation-analysis)

Key Findings
- PCA confirmed to have taken place*
- There is no missing data
- Fraudulent data is 0.172% of transactions, very imbalanced data.
From Scaled Data
-  V1, V3, V7, V9 , V10, V12, V14, V16, V17 are negatively correlated with fraud
-  V2, V4, V11, V19 and Time are positively correlated with fraud
- Time seems to be strongly positively correlated to all independant and dependant variables.
  
*PCA at it's heart involves diagonalising a matrix which means solving for the eigenvalues and eigenvectors of that matrix. The whole purpose of the calculation is to find a diagonal representation of the matrix (i.e. only elements along the diagonal of the matrix). By doing PCA again we see the values are the same which proves PCA was done to begin with as PCA on PCA is essentially  trying to calculate the eigenvalues of a diagonal matrix, which yields the exact same diagonal matrix. In addition we can see the components are scaled shown by their distributions around 0.


## Machine Learning Algorithims
- All algorithims were trained on all parameters (not tuned) on 80% of the data with 20% left over data for testing. The training data was randomly undersampled.
- This imbalanced dataset required using these primary metrics: F-score, Recall & Precision; Accuracy for imbalanced dataset can be decieving
### The algorithims used were:
- **Quadratic Discriminant Analysis (QDA)**
- **Linear Discriminant Analysis (LDA)**
- **Logistic Regression (GLM)**
- Threshold of 0.9
- **Random Forest**
- 50 trees 
- **Support Vector Machine**
- As SVM as O(n^3) couldn't use on SMOTE and Tomek Links data as SMOTE is 590x bigger than near miss
- **Naive Bayes Classifer**
- **Kth Nearest Neighbour Classifer (KNN)**
- Couldn't use SMOTE due to its oversampling property and hence duplicate values. 
- **Gradient Boosting Machine (GBM)**
- Training attributes: Num Trees: 500, 10-fold CV, v = 0.01 (slow learning), min num of data points in terminal nodes: 10.
- **Extreme Gradient Boosing (XGBoost)**
- Training attributes: Num trees: 50, max tree depth: 3.
- Threshold of 0.9
- **Neural Networks**
- Compared different hidden layers: single layer (30), 2 layer (60,30) and deep neural network (100,50,25)


## Comparison 
### Top 6 Models Overall (Based on F1)

|           Model           |      F1     |  Precision  |    Recall   | Balanced.Accuracy | Sensitivity |    Method     |
|---------------------------|------------ |------------ |------------ |------------------ |------------ |-------------- |
|     Random Forest         | 0.9997714   | 0.9995956   | 0.9999472   | 0.8924970         | 0.9999472   | Tomek Links   |
|     XGBoost               | 0.9997626   | 0.9995605   | 0.9999648   | 0.8831600         | 0.9999648   | Tomek Links   |
|     Single Neural Net     | 0.9996923   | 0.9995077   | 0.9998769   | 0.8690973         | 0.9998769   | Tomek Links   |
|     LDA                   | 0.9996659   | 0.9994725   | 0.9998593   | 0.8597427         | 0.9998593   | Tomek Links   |
|     Deep Neural Net       | 0.9996307   | 0.9994023   | 0.9998593   | 0.8410511         | 0.9998593   | Tomek Links   |
|     Logistic Regression   | 0.9996131   | 0.9994901   | 0.9997362   | 0.8643541         | 0.9997362   | Tomek Links   |

### Tomek Links Dataset Models:

|         Model         |      F1      |  Precision   |     Recall    | Balanced.Accuracy |  Sensitivity  |    Method     |
|-----------------------|------------- |------------- |-------------- |------------------ |-------------- |-------------- |
|     Random Forest     | 0.9997714    | 0.9995956    | 0.9999472     | 0.8924970         | 0.9999472     | Tomek Links   |
|           XGBoost     | 0.9997626    | 0.9995605    | 0.9999648     | 0.8831600         | 0.9999648     | Tomek Links   |
|  Single Neural Net    | 0.9996923    | 0.9995077    | 0.9998769     | 0.8690973         | 0.9998769     | Tomek Links   |
|            LDA        | 0.9996659    | 0.9994725    | 0.9998593     | 0.8597427         | 0.9998593     | Tomek Links   |
|    Deep Neural Net    | 0.9996307    | 0.9994023    | 0.9998593     | 0.8410511         | 0.9998593     | Tomek Links   |
| Logistic Regression   | 0.9996131    | 0.9994901    | 0.9997362     | 0.8643541         | 0.9997362     | Tomek Links   |
|            GBM        | 0.9995165    | 0.9991564    | 0.9998769     | 0.7756394         | 0.9998769     | Tomek Links   |
|            KNN        | 0.9992530    | 0.9985597    | 0.9999472     | 0.6167960         | 0.9999472     | Tomek Links   |
|  2 layer Neural Net   | 0.9990599    | 0.9981216    | 1.0000000     | 0.5000000         | 1.0000000     | Tomek Links   |
|       Naive Bayes     | 0.9894458    | 0.9996410    | 0.9794565     | 0.8962703         | 0.9794565     | Tomek Links   |
|            QDA        | 0.9885017    | 0.9996942    | 0.9775569     | 0.9093392         | 0.9775569     | Tomek Links   |

###  SMOTE Dataset Models:

|         Model          |      F1      |  Precision   |     Recall    | Balanced.Accuracy |  Sensitivity  |  Method  |
|------------------------|------------- |------------- |-------------- |------------------ |-------------- |--------- |
|     Random Forest      | 0.9994282    | 0.9996481    | 0.9992085     | 0.9061463         | 0.9992085     | SMOTE    |
|   Deep Neural Net      | 0.9994195    | 0.9995426    | 0.9992965     | 0.8781529         | 0.9992965     | SMOTE    |
|  2 layer Neural Net    | 0.9993755    | 0.9995425    | 0.9992085     | 0.8781089         | 0.9992085     | SMOTE    |
|   Single Neural Net    | 0.9993315    | 0.9995952    | 0.9990678     | 0.8920573         | 0.9990678     | SMOTE    |
| Logistic Regression    | 0.9969400    | 0.9996817    | 0.9942133     | 0.9129945         | 0.9942133     | SMOTE    |
|           XGBoost      | 0.9955493    | 0.9996985    | 0.9914344     | 0.9162779         | 0.9914344     | SMOTE    |
|           LDA          | 0.9933455    | 0.9995726    | 0.9871955     | 0.8814482         | 0.9871955     | SMOTE    |
|      Naive Bayes       | 0.9884389    | 0.9996762    | 0.9774514     | 0.9046136         | 0.9774514     | SMOTE    |
|           QDA          | 0.9873131    | 0.9996755    | 0.9752528     | 0.9035143         | 0.9752528     | SMOTE    |
|           GBM          | 0.9850547    | 0.9996378    | 0.9708909     | 0.8919875         | 0.9708909     | SMOTE    |

### Near Miss Dataset Models:

|             Model             |      F1      |  Precision   |     Recall    | Balanced.Accuracy |  Sensitivity  |    Method     |
|------------------------------ |------------- |------------- |-------------- |------------------ |-------------- |-------------- |
|             KNN               |  0.9950169   |  0.9996804   |  0.9903966    |  0.9110862        |  0.9903966    | Near Miss     |
| Logistic Regression           |  0.9929255   |  0.9997326   |  0.9862105    |  0.9230118        |  0.9862105    | Near Miss     |
|        Poly SVM               |  0.9881049   |  0.9997660   |  0.9767127    |  0.9276087        |  0.9767127    | Near Miss     |
|             LDA               |  0.9864388   |  0.9996027   |  0.9736171    |  0.8840048        |  0.9736171    | Near Miss     |
|             GBM               |  0.9854077   |  0.9996381   |  0.9715768    |  0.8923305        |  0.9715768    | Near Miss     |
|         XGBoost               |  0.9832290   |  0.9997637   |  0.9672324    |  0.9228686        |  0.9672324    | Near Miss     |
|     Naive Bayes               |  0.9823839   |  0.9997087   |  0.9656495    |  0.9080584        |  0.9656495    | Near Miss     |
|      Linear SVM               |  0.9800190   |  0.9997804   |  0.9610237    |  0.9244371        |  0.9610237    | Near Miss     |
|   Random Forest               |  0.9795710   |  0.9997619   |  0.9601794    |  0.9193420        |  0.9601794    | Near Miss     |
|    Deep Neural Net            |  0.9752775   |  0.9997599   |  0.9519655    |  0.9152351        |  0.9519655    | Near Miss     |
|  Single Neural Net            |  0.9743437   |  0.9997779   |  0.9501715    |  0.9190110        |  0.9501715    | Near Miss     |
|      Radial SVM               |  0.9726854   |  0.9997772   |  0.9470231    |  0.9174368        |  0.9470231    | Near Miss     |
|  2 layer Neural Net           |  0.9686318   |  0.9998128   |  0.9393369    |  0.9229395        |  0.9393369    | Near Miss     |
|             QDA               |  0.9648613   |  0.9997171   |  0.9323542    |  0.8960837        |  0.9323542    | Near Miss     |

### Key Points:

- **Best Performing Model:** The Random Forest model outperformed others, especially on the Tomek Links dataset, due to its strong handling of unbalanced data and robustness against overfitting.

- **Neural Networks and Data Sensitivity:** Neural networks showed varying results, performing well with Tomek Links and SMOTE but less effectively with the Near Miss dataset, likely due to data loss impacting their learning capability. Neural Networks rely on rich sets of data to capture complex patterns.

- **Impact of Data Balancing Techniques:** The effectiveness of models varied significantly with different data balancing methods, indicating the importance of choosing the right preprocessing technique for each model.

- **Universal Overfitting Concern:** All models risk overfitting in imbalanced fraud detection datasets, especially when trained on heavily preprocessed data which underscoring the need for better validation and testing. Cross Validation in the future.

- **Ensemble methods:** The most successful models in this data trend are ensemble methods, particularly Random Forest and XGBoost. These models excel in complex datasets such as credit card fraud by combining diverse models to reduce overfitting, handle imbalanced data, and enhance generalisation through error correction and flexible model combinations.


#### Confusion Matrices of Top 3:

**Random Forest**

| Reference / Prediction | 0    | 1   |
|------------------------|------|-----|
| 0                      | 56852| 23  |
| 1                      | 3    | 84  |


**XGBoost**

| Reference / Prediction | 0    | 1   |
|------------------------|------|-----|
| 0                      | 56853| 25  |
| 1                      | 2    | 82  |

**Single Layer Neural Network**

| Reference / Prediction | 0    | 1   |
|------------------------|------|-----|
| 0                      | 56848| 28  |
| 1                      | 7    | 79  |


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




