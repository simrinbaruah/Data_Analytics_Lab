#1. WAP in R to find the highest of three numbers.

#user input
num1<-readline(prompt="Enter the first number: ")
num2<-readline(prompt="Enter the second number: ")
num3<-readline(prompt="Enter the third number: ")

#converting to integers
num1<-as.integer(num1)
num2<-as.integer(num2)
num3<-as.integer(num3)

if(num1>=num2 && num1>=num3){
  print(sprintf("%d is the highest.", num1))
}else if(num2>=num1 && num2>=num3){
  print(sprintf("%d is the highest.", num2))
}else{
  print(sprintf("%d is the highest.", num3))
}