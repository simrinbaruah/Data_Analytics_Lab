#2. WAP in R to find display the sum of n natural numbers using loop

#user input
n<-readline(prompt="Enter the value of n: ")

n<-as.integer(n)

i<-n
sum<-0

while(i>0){
  sum<-sum+i
  i<-i-1
}

print(sprintf("The sum of %d natural numbers is %d", n, sum))