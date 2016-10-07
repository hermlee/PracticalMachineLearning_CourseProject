# Course Project of Practical Machine Learning
#### _**Xin Li**_
#### _**October 7, 2016**_ 
## Background Information 
Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement and a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways.
## Data Processing
### Import the Data
When importing the data, "NA", "#DIV/0!", and "" are recognized as missing values.
	trData <- read.csv(paste(directory,'/pml-training.csv',sep=''),na.strings=c("NA","#DIV/0!",""))
	tsData <- read.csv(paste(directory,'/pml-testing.csv',sep=''),na.strings=c("NA","#DIV/0!",""))

### Data Cleaning
We first delect the columns with too many missing values. Here we set the threshold to be 80%. In other words, if a column contains more than 80% of missing values, this column is deleted.
N_row <- nrow(trData)
N_col <- ncol(tsData)
threshold <- 0.8
col_na <- NULL
for (i in 1:N_col) {
	if (sum(is.na(trData[,i]))>(N_row*threshold)){
		col_na <- append(col_na,i)
	}
}
if (length(col_na)>0) {
	trData <- trData[,-col_na]
	tsData <- tsData[,-col_na]
}
Then, delete the rows with missing data:
row_na <- NULL
for (i in N_row) {
	if (sum(is.na(trData[i,]))>0){
		row_na <- append(row_na,i)
	}
}
if (length(row_na>0)) {
	trData <- trData[-row_na,]
}
