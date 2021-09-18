# 1. Get the iris dataset from UCI ML Repository (https://archive.ics.uci.edu/ml/datasets/iris)
dataset <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"),
                    header=FALSE, col.names=c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species"))

print(head(dataset))

# and perform the following visualization tasks:
#   (a) Create Bar Plots to show the comparison between cumulative totals across ”Petal
# Length”.

barplot(dataset$Petal.Length, main="Petal Length")

# (b) Load the package RColorBrewer and create stacked bar plot to show the comparison
# between cumulative totals across ”Species” and ”Petal Length”. The RColorBrewer
# package is normally used to manage colors with R

library(RColorBrewer)
barplot(table(dataset$Species, dataset$Petal.Length), 
        main="Species and Petal Length", col=c(brewer.pal(n = 3, name = "Accent")))

# (c) Create box plot. Visualize how the spread (of Sepal Length) is across various categories
# ( of Species). Fill all the box plots with different color palettes. A color palette
# is a group of colors that is used to make the graph more appealing.

boxplot(dataset$Sepal.Length~dataset$Species, 
        main="Species vs. Sepal Length",col=rainbow(3))

# (d) Create a scatter plot with Species along the Y axis and Petal Length along the X axis.dataset$Species=factor(dataset$Species,levels=c('Iris-setosa', 'Iris-versicolor', 'Iris-virginica'))
dataset$Species=factor(dataset$Species,levels=c('Iris-setosa', 'Iris-versicolor', 'Iris-virginica'))
plot(x=dataset$Petal.Length, y=dataset$Species, main="Petal Length vs. Species")




