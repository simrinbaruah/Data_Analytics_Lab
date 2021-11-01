# 1. Assume a tiny version of web with 4 web pages and edges between them and apply
# (a) Topic Sensitive Page rank algorithm

library(igraph)
web <- graph(edges=c(1,2, 2,1, 1,3, 3,1, 1,4, 4,2, 2,4, 4,3), n=4, directed=TRUE)
print(web)
plot(web)

mt <- stochastic_matrix(web)
mt <- t(as.matrix(mt))
v <- as.matrix(c(1/4, 1/4, 1/4, 1/4))
diff <- matrix(Inf, nrow=4, ncol=1)

beta <- 0.8
#Let the teleport set S={2,4}
es <- c(0, 1, 0, 1)
mt <- beta*mt
t2 <- ((1-beta)*es)/2
while(abs(max(diff)) > 0.001){
  new_v <- (mt %*% v) + t2
  diff <- new_v - v
  v <- new_v
}
print("Topic Sensitive Rank:")
print(v)