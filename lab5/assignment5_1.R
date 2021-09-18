# 1. Perform the following tasks:
# (a) Import mtcars dataset.
library(datasets)
print(head(mtcars))

# (b) Visualize your data using scatter plots
plot(mtcars$wt, mtcars$mpg,  xlab="Car Weight",
     ylab="Miles Per Gallon", main="Weight vs. Milage", pch=19)
     
# (c) Compute the Correlation between mpg and wt variables.
correlation<-cor(mtcars$mpg, mtcars$wt)
print(sprintf("Correlation between mpg and wt variables: %f", correlation))