# 1. Perform the following pre-processing tasks.
# (a) Get the dataset and read it using read.csv function.
dataset<-read.csv(file = 'Dataset.csv')
print("Dataset")
print(dataset)

print("Summary of dataset")
print(summary(dataset))

# (b) The dataset contains missing data. Handle the missing data by taking mean/median/mode
dataset$Age[is.na(dataset$Age)]<-mean(dataset$Age,na.rm=TRUE)
dataset$Salary[is.na(dataset$Salary)]<-median(dataset$Salary,na.rm=TRUE)
print("After replacing missing values:")
print(dataset)

# (c) Encode categorical data. Encode ”France”, ”Spain” and ”Germany” with 1, 2, 3
# values. Also encode the target variable with 0 and 1 i.e. Encode Yes with 0 and No
# with 1. factor function or if-else statement can be used to convert the categorical
# features into numeric features.
dataset$Country=factor(dataset$Country,levels=c('France', 'Spain', 'Germany'),labels=c(1,2,3))
dataset$Purchased=factor(dataset$Purchased,levels=c('Yes','No'),labels=c(0,1))
print("After encoding:")
print(dataset)

# (d) Scale the dataset using any of the scaling technique. Use scale function to scale the values.
dataset_matrix<-matrix(unlist(dataset), ncol=4)
print("After Scaling:")
print(scale(dataset_matrix))