#3. Write the above two programs in R using functions.

#function to get the highest of three numbers
highest<-function(){
  
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
}

#function to find the sum of n natural numbers

naturalsum<-function(){
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
}


while(TRUE){
  option<-readline("Options:\n1. Highest of three numbers.\n2. Sum of n natural numbers.\n3. Exit\n")
  
  option<-as.integer(option)
  x<-switch(option, highest(), naturalsum(), break)
  if(is.null(x)){
    print("Invalid Option")
  }
}

