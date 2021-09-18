# 3. Simulate a simple dataset of 10 points.Create a heat map to visualize relationships between
# the variables. A heat map is agraphical representation of data where the data values are
# represented as colours.
data <- matrix(rnorm(100), nrow = 10, ncol = 10) 
print(data)
heatmap(data, Colv = NA, Rowv = NA)