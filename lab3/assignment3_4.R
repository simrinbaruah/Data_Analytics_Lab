# 4. Creating a sample of 100 numbers which are incremented by 1.5. Create the binomial
# distribution and plot it using dotchart.

x <- seq(0,100,by = 1.5)

x<-trunc(x) 
y <- dbinom(x,100,0.3)
dotchart(y, labels = x, cex = 0.5, xlab = "Binomial Distribution")