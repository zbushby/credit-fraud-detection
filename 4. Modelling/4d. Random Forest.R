#Random Forest
set.seed(123)

nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
smote_train_data$Class <- as.factor(smote_train_data$Class)
tomek_train_data$Class <- as.factor(tomek_train_data$Class)
test_data$Class <- as.factor(test_data$Class)


#Near Miss Data
#------------------------------------------------------------------------------
nearmiss_m <- floor(ncol(nearmiss_train_data)-1)

nearmiss_train_data$Class <- as.factor(nearmiss_train_data$Class)
# nearmiss_rf_model <- randomForest(Class ~ ., data = nearmiss_train_data, mtry = nearmiss_m, ntree = 50)
# saveRDS(nearmiss_rf_model, "./nearmiss_rf_model.rds")
nearmiss_rf_model <- readRDS("./nearmiss_rf_model.rds")

nearmiss_rf_pred <- predict(nearmiss_rf_model, newdata = test_data, type = "response")
nearmiss_rf_cmatrix <- confusionMatrix(data = as.factor(nearmiss_rf_pred), reference = as.factor(test_data$Class))

#SMOTE Data
#------------------------------------------------------------------------------
smote_m <- floor(ncol(smote_train_data)-1)

smote_train_data$Class <- as.factor(smote_train_data$Class)

# smote_rf_model <- randomForest(Class ~ ., data = smote_train_data, mtry = smote_m, ntree = 50)
# saveRDS(smote_rf_model, "./smote_rf_model.rds")
smote_rf_model <- readRDS("./smote_rf_model.rds")

smote_rf_pred <- predict(smote_rf_model, newdata = test_data, type = "response")
smote_rf_cmatrix <- confusionMatrix(data = as.factor(smote_rf_pred), reference = as.factor(test_data$Class))

#Tomek Links Data
#------------------------------------------------------------------------------
tomek_m <- floor(ncol(tomek_train_data)-1)

tomek_train_data$Class <- as.factor(tomek_train_data$Class)

# tomek_rf_model <- randomForest(Class ~ ., data = tomek_train_data, mtry = tomek_m, ntree = 50)
# saveRDS(tomek_rf_model, "./tomek_rf_model.rds")
tomek_rf_model <- readRDS("./tomek_rf_model.rds")

tomek_rf_pred <- predict(tomek_rf_model, newdata = test_data, type = "response")

tomek_rf_cmatrix <- confusionMatrix(data = as.factor(tomek_rf_pred), reference = as.factor(test_data$Class))



# plot(rf_model)




# #visualisation
# options(repos='http://cran.rstudio.org')
# have.packages <- installed.packages()
# cran.packages <- c('devtools','plotrix','randomForest','tree')
# to.install <- setdiff(cran.packages, have.packages[,1])
# if(length(to.install)>0) install.packages(to.install)
# 
# library(devtools)
# if(!('reprtree' %in% installed.packages())){
#   install_github('munoztd0/reprtree')
# }
# for(p in c(cran.packages, 'reprtree')) eval(substitute(library(pkg), list(pkg=p)))
# library(reprtree)
# #very large tree, with overlapping text
# reprtree:::plot.getTree(rf_model)
