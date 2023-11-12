#Random Forest

set.seed(123)
m <- floor(ncol(balanced_train_data)-1)

balanced_train_data$Class <- as.factor(balanced_train_data$Class)

rf_model <- randomForest(Class ~ ., data = balanced_train_data, mtry = m, ntree = 500)

rf_pred <- predict(rf_model, newdata = test_data, type = "response")

rf_cmatrix <- confusionMatrix(data = as.factor(rf_pred), reference = as.factor(test_data$Class))
rf_cmatrix$table
rf_cmatrix$byClass


plot(rf_model)




#visualisation
options(repos='http://cran.rstudio.org')
have.packages <- installed.packages()
cran.packages <- c('devtools','plotrix','randomForest','tree')
to.install <- setdiff(cran.packages, have.packages[,1])
if(length(to.install)>0) install.packages(to.install)

library(devtools)
if(!('reprtree' %in% installed.packages())){
  install_github('munoztd0/reprtree')
}
for(p in c(cran.packages, 'reprtree')) eval(substitute(library(pkg), list(pkg=p)))
library(reprtree)
#very large tree, with overlapping text
reprtree:::plot.getTree(rf_model)
