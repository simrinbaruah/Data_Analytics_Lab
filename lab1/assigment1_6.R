#6. Design a simple calculator in R.

while(TRUE){
  option<-readline("Options:\n1. Add(+).\n2. Subtract(-).\n3. Divide(/)\n4. Multiply(*)\n5. Exit\n")
  
  option<-as.integer(option)
  if(!(option>=1 && option<=5)){
    print("Invalid Option")
  }else{
    if(option==5){
      break
    }else{
      num1<-readline("Enter the first number: ")
      num2<-readline("Enter the second number: ")
      
      num1<-as.integer(num1)
      num2<-as.integer(num2)
      
      x<-switch(option, num1+num2, num1-num2, num1/num2, num1*num2)
      
      print(sprintf("Result: %d", x))
    }
  }
}