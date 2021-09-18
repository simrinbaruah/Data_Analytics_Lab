# 3. Compute Manhattan distance and cosine similarity after 
# performing (a),(b),(c) steps of Q.2.
library(philentropy)

P<-1:10/sum(1:10)
Q<-11:20/sum(11:20)
x<-rbind(P,Q)
print(x)

man<-dist(x, method="manhattan")
print(man)


cos<-distance(x, method="cosine")
print(cos)

