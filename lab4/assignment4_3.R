# 3. Take a random sample from the normal distribution, and plot the estimated density function.
x <- rnorm(100)
plot(density(x), main="Density plot of random sample size 100")

# Now take repeated samples of size 4, calculate the mean for each such sample, and
# plot the density. 
av <- numeric(100)

for (i in 1:100) {
 av[i] <- mean(sample(x,4))
}

plot(density(av), main="Repeated sampling of size=4")

#Repeat the above: taking samples of size 9, and of size 25.

for (i in 1:100) {
  av[i] <- mean(sample(x,9))
}

plot(density(av), main="Repeated sampling of size=9")

for (i in 1:100) {
  av[i] <- mean(sample(x,25))
}

plot(density(av), main="Repeated sampling of size=25")