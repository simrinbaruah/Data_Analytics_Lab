# 2. Perform the following aggregation tasks.
# (a) Get the dataset from UCIMLRepository: https://archive.ics.uci.edu/ml/datasets/iris.
dataset <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"),
         header=FALSE, col.names=c("Sepal.Length","Sepal.Width","Petal.Length","Petal.width","Species"))

print(head(dataset))
# (b) Find the mean of all the metrics (Sepal.Length Sepal.Width Petal.Length Petal.Width)
dataset_mean = aggregate(dataset[,1:4],by=list(dataset$Species),FUN=mean)
print("Mean:")
print(dataset_mean)
# (c) Compute the sum of all the metrics across species and group by species.
dataset_sum = aggregate(dataset[,1:4],by=list(dataset$Species),FUN=sum)
print("Sum:")
print(dataset_sum)
# (d) Compute the count of all the metrics across species and group by species.
dataset_count = aggregate(dataset[,1:4],by=list(dataset$Species),FUN=length)
print("Count:")
print(dataset_count)
# (e) Compute the maximum of all the metrics across species and group by species.
dataset_max = aggregate(dataset[,1:4],by=list(dataset$Species),FUN=max)
print("Max:")
print(dataset_max)