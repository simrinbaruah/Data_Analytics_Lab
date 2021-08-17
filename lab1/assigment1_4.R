#4. WAP in R to find the multiplication table (from 1 to 10)

for(i in 1:10){
  print(sprintf("Multiplication table of %d", i))
  for(j in 1:10){
    print(sprintf("%d x %d = %d", i,j,i*j))
  }
  cat("\n")
}