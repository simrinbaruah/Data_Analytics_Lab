# 2. Data whose distribution is close to lognormal are common. Size measurements of biological
# organisms often have this character. As an example, consider the measurements of
# body weight (body),in the data frame Animals (MASS). Begin by drawing a histogram of
# the untransformed values,and overlaying a density curve. Then
library(MASS)
hist(Animals$body, freq=FALSE, breaks=125)
lines(density(Animals$body), lwd = 2, col = "chocolate3")
# (a) Draw an estimated density curve for the logarithms of the values.

logAnimals <- log(Animals$body)
plot(density(logAnimals), col="blue")

# (b) Determine the mean and standard deviation of log(Animals$body). Overlay the estimated
# density with the theoretical density for a normal distribution with the mean
# and standard deviation just obtained.

av <- mean(logAnimals)
sdv <- sd(logAnimals)
# 99.7% of data observed following a normal distribution lies 
#within 3 standard deviations of the mean.
x <- pretty(c(av - 3 * sdv, av + 3 * sdv),30)
lines(x, dnorm(x, mean = av, sd = sdv), col="red")
legend("topleft", legend=c("Estimated density", "Theoretical density"),
       col=c("blue", "red"), lty=1:1, cex=0.7)