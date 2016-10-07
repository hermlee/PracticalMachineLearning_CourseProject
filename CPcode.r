## load the library
library(caret)

## load the data
directory <- 'C:/Users/Herm Lee/Box Sync/Cousera Courses/Data Science/Practical Machine Learning/Course Project/'
trData <- read.csv(paste(directory,'/pml-training.csv',sep=''),na.strings=c("NA","#DIV/0!",""))
tsData <- read.csv(paste(directory,'/pml-testing.csv',sep=''),na.strings=c("NA","#DIV/0!",""))

## partition training data set into two data sets, 70% for training and 30% for testing
set.seed(1989)
intrain <- createDataPartition (trData$classe,p=0.7,list=FALSE)
data_train <- trData[intrain,]
data_test <- trData[-intrain,]

## cleaning the data
## remove the first column
data_train <- data_train[,c(-1)]
data_test <- data_test[,c(-1)]
## remove colums with more than 80% NA
N_row <- nrow(data_train)
N_col <- ncol(data_train)
threshold <- 0.6
col_na <- NULL
for (i in 1:N_col) {
	if (sum(is.na(data_train[,i]))>N_row*threshold){
		append(col_na,i)
	}
}
if (length(col_na)>0) {
	data_train <- data_train[,-col_na]
	data_test <- data_test[,-col_na]
}
## remove the rows with NA
row_na <- NULL
for (i in N_row) {
	if (sum(is.na(data_train[i,]))>0){
		append(row_na,i)
	}
}
if (length(row_na>0)) {
	data_train <- data_train[-row_na,]
}

## Prediction Algorithm
## Cross validation
ctrl <- trainControl(method='cv',num = 5)
## Classification Tree
set.seed(2010)
mod_rpart <- train(classe ~ ., data=data_train, method="rpart", trControl=ctrl)
fancyRpartPlot(mod_rpart$finalModel)
pred_rpart <- predict(mod_rpart,data_test)
conf_rpart <- confusionMatrix(data_test$classe,pred_rpart)
acc_rpart <- conf_rpart$overall[1]
## Random Forest
set.seed(2016)
mod_rf <- train(classe~., data=data_train, method='rf',trControl=ctrl)
pred_rf <- predict(mod_rf,data_test)
conf_rf <- confusionMatrix(data_test$classe,pred_rpart)
acc_rf <- conf_rf$overall[1]
