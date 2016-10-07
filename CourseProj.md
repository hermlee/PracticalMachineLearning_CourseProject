# Course Prject of Practical Machine Learning <h1> 
###### _**Xin Li**_ <h3> 
###### _**October 7, 2016**_ <h3>
## Background Information <h2> 
Using devices such as Jawbone Up, Nike FuelBand, and Fitbit it is now possible to collect a large amount of data about personal activity relatively inexpensively. These type of devices are part of the quantified self movement â€?a group of enthusiasts who take measurements about themselves regularly to improve their health, to find patterns in their behavior, or because they are tech geeks. One thing that people regularly do is quantify how much of a particular activity they do, but they rarely quantify how well they do it. In this project, your goal will be to use data from accelerometers on the belt, forearm, arm, and dumbell of 6 participants. They were asked to perform barbell lifts correctly and incorrectly in 5 different ways.
## Data Processing <h2> 
## Import the Data <h3>
'<trData <- read.csv(paste(directory,'/pml-training.csv',sep=''),na.strings=c("NA","#DIV/0!",""))
tsData <- read.csv(paste(directory,'/pml-testing.csv',sep=''),na.strings=c("NA","#DIV/0!",""))>'