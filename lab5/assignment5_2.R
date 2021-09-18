# 2. Perform the following:
# (a) Define a normalized vector P.
P<-1:10/sum(1:10)

# (b) Define a normalized vector Q.
Q<-11:20/sum(11:20)

# (c) Combine P and Q as matrix object. Please note that when defining a matrix from
# vectors, the vectors should be combined as rows.
x<-rbind(P,Q)
print(x)

# (d) Compute the Euclidean Distance with default parameters
euc<-dist(x, method = "euclidean")
print(euc)


