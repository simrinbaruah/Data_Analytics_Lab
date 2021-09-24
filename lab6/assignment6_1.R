# 1. Download any two datasets of your choice, read it and perform the following tasks
# (a) Visualise the data.
# (b) Perform K-Means Clustering selecting the best value of k and taking Euclidean distance
# as similarity measure. Check your algorithm with the following three conditions
# , visulaise the clusters and note the difference
# i. Maximum number of iterations
# ii. Cluster centroid remains unchanged
# iii. Highest quality of cluster is reached.
# (c) Repeat the Q.2 taking Manhattan distance as similarity measure and note the difference
# between the clusters as compared to that found in Q. 2.

KmeansFunc <- function(data,K,distFunc) {
  set.seed(123)
  centroids<-data[sample(nrow(data),3),]
  print(centroids)
  
  max_iterations<-300
  centroid_updation<-TRUE
  clusters<-vector("list", nrow(data))
  
  while (max_iterations>0 && centroid_updation){
    for (row in 1:nrow(data)){
      x<-data[row,]
      min_distance<-Inf
      for(centroid in 1:K){
        selected_centroid<-centroids[centroid,]
        distance<-dist(rbind(x,selected_centroid), distFunc)
        
        if(distance < min_distance){
          clusters[row] <- centroid
          min_distance <- distance
        }
      }
    }
    old_centroids<-centroids
    for(row_centroid in 1:K){
      for(col_centroid in 1:ncol(data)){
        sum<-0.0
        count<-0.0
        average<-NULL
        for(row in 1:nrow(data)){
          if(row_centroid == clusters[row]){
            sum<-sum + data[row, col_centroid]
            count<-count+1
            if(count>0){
              average<-sum/count
            }
          }
        }
        centroids[row_centroid, col_centroid] <- average
      }
    }
    
    centroid_updation <- !(all(old_centroids==centroids))
    max_iterations <- max_iterations-1
  }
  
  return(clusters)
}


#First dataset
print(summary(iris))
plot(iris$Petal.Length, iris$Petal.Width, col=iris$Species, 
     main="Visualising IRIS data")
print("Each Species")
print(table(iris$Species))
iris$Species<-NULL
print(head(iris))
scaled_data<- as.matrix(scale(iris))
k.max <- 15
data <- scaled_data
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 300)$tot.withinss})
print(wss)
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE,
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


K<-3
clusters<-KmeansFunc(data, 3, "euclidean")
new_data1<-iris
new_data1$Cluster<-as.factor(as.numeric(clusters))
print(head(new_data1))

plot(new_data1$Petal.Length, new_data1$Petal.Width, col=new_data1$Cluster,
     main="After Using K-means: euclidean")
print("EACH CLUSTER (euclidean)")
print(table(new_data1$Cluster))

clusters<-KmeansFunc(data, 3, "manhattan")
new_data2<-iris
new_data2$Cluster<-as.factor(as.numeric(clusters))
print(head(new_data2))

plot(new_data2$Petal.Length, new_data2$Petal.Width, col=new_data2$Cluster,
     main="After Using K-means: manhattan")
print("EACH CLUSTER (manhattan)")
print(table(new_data2$Cluster))

#Second dataset
wine <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"),
            header=FALSE, col.names= c('Type', 'Alcohol', 'Malic', 'Ash', 
                                      'Alcalinity', 'Magnesium', 'Phenols', 
                                      'Flavanoids', 'Nonflavanoids',
                                      'Proanthocyanins', 'Color', 'Hue', 
                                      'Dilution', 'Proline'))

print(summary(wine))
plot(wine$Alcohol, wine$Ash, col=wine$Type,
     main="Visualising WINE data")
print("Each type:")
print(table(wine$Type))

wine$Type<-NULL
print(head(wine))
scaled_data<- as.matrix(scale(wine))
k.max <- 15
data <- scaled_data
wss <- sapply(1:k.max, 
              function(k){kmeans(data, k, nstart=50,iter.max = 300)$tot.withinss})
print(wss)
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE,
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


K<-3
clusters<-KmeansFunc(data, 3, "euclidean")
new_data1<-wine
new_data1$Cluster<-as.factor(as.numeric(clusters))
print(head(new_data1))

plot(new_data1$Alcohol, new_data1$Ash, col=new_data1$Cluster,
     main="After Using K-means: euclidean")
print("EACH CLUSTER (euclidean)")
print(table(new_data1$Cluster))

clusters<-KmeansFunc(data, 3, "manhattan")
new_data2<-wine
new_data2$Cluster<-as.factor(as.numeric(clusters))
print(head(new_data2))

plot(new_data2$Alcohol, new_data2$Ash, col=new_data2$Cluster,
     main="After Using K-means: manhattan")
print("EACH CLUSTER (manhattan)")
print(table(new_data2$Cluster))
