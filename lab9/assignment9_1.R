# 1. Assume a tiny version of web with 4 web pages and edges between them and apply
# (a) Basic page rank algorithm
# (b) Telereporting on page rank algorithm

library(igraph)
web <- graph(edges=c(1,2, 2,1, 1,3, 3,1, 1,4, 4,2, 2,4, 4,3), n=4, directed=TRUE)
print(web)
plot(web)

#Page rank algo
mt <- stochastic_matrix(web)
mt <- t(as.matrix(mt))
v <- as.matrix(c(1/4, 1/4, 1/4, 1/4))
diff <- matrix(Inf, nrow=4, ncol=1)
while(abs(max(diff)) > 0.001){
  new_v <- mt %*% v
  diff <- new_v - v
  v <- new_v
}
print("Rank:")
print(v)

#Teleporting
web <- graph(edges=c(1,2, 2,1, 1,3, 1,4, 4,2, 2,4, 4,3, 3,3), n=4, directed=TRUE)
print(web)
plot(web)
mt <- stochastic_matrix(web)
mt <- t(as.matrix(mt))
v <- as.matrix(c(1/4, 1/4, 1/4, 1/4))
diff <- matrix(Inf, nrow=4, ncol=1)
while(abs(max(diff)) > 0.001){
  new_v <- mt %*% v
  diff <- new_v - v
  v <- new_v
}
print("Rank without teleporting:")
print(v)

beta <- 0.8
e <- c(1, 1, 1, 1)
mt <- beta*mt
t2 <- ((1-beta)*e)/4

diff <- matrix(Inf, nrow=4, ncol=1)
while(abs(max(diff)) > 0.001){
  new_v <- (mt %*% v) + t2
  diff <- new_v - v
  v <- new_v
}
print("Rank with teleporting:")
print(v)