# 1. Perform the following tasks:
#   (a) In R a simple bar graph can be used to model the probability distribution function.
# Take a random vector and probability associated with it and plot it with a bar graph.
set.seed(75)
x<-sample(1:5, size = 20, replace = T,prob = c(0.3, 0.4, 0.2, 0.25, 0.22))
print("Random vector:")
print(x)
barplot(table(x))

# (b) For the above problem create a cumulative frequency table and plot the cumulative
# frequency against each sample point mentioned in the vector.
data<-table(x)
cumfreq_data<-cumsum(data)
print("Cumulative frequency:")
print(cumfreq_data)
barplot(cumfreq_data)

# (c) Using some simple commands in R generate the probability values for the binomial
# distribution for the number of children in 10 with blue eyes using p =0.16. Plot the
# obtained result.
n<-0:10
probability<-dbinom(n,10,0.16)
plot(x = n,y = probability,
     xlab = "Number of kids with blue eyes", ylab = "Probability", main="p=0.16")

# (d) Run the above example with probabilities that a child has blue eyes is 0.05, 0.2, 0.5,
# and 0.8 and see how this changes the distribution.
plot(x = n,y = dbinom(n,10,0.05),
     xlab = "Number of kids with blue eyes", ylab = "Probability", main="p=0.05")
plot(x = n,y = dbinom(n,10,0.2),
     xlab = "Number of kids with blue eyes", ylab = "Probability", main="p=0.2")
plot(x = n,y = dbinom(n,10,0.5),
     xlab = "Number of kids with blue eyes", ylab = "Probability", main="p=0.5")
plot(x = n,y = dbinom(n,10,0.8),
     xlab = "Number of kids with blue eyes", ylab = "Probability", main="p=0.8")

# (e) Consider you have a vector 0:10. Compute poisson distribution with p=0.2. Plot it
# to visulaise the distribution.
vector<-0:10
poisson<-dpois(vector, 0.2)
print("Poisson:")
print(poisson)
plot(x = vector, y = poisson, ylab = "Probability")

