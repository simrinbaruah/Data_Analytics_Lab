#5. WAP in R to find the sum of n natural numbers with formula.

#user input
n<-readline(prompt="Enter the value of n: ")

n<-as.integer(n)

sum<-(n*(n+1))/2

print(sprintf("The sum of %d natural numbers is %d", n, sum))