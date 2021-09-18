# 2. Get the data (PAICOL.csv) and import it with the function read.csv. 
dataset<-read.csv("PAICOL.csv")
print(head(dataset))
# The dataset comprises of the daily levels of a river and the rainfall data from the basin. 
# Replace the value of DATE with formatted dates and then display the 
# summary of the data using the function summary().
dataset$DATE<-as.Date(dataset$DATE, "%Y-%m-%d")
print(summary(dataset))

# Load ggplot package and visulaize the following using ggplot functions:
library(ggplot2)
#   (a) Create a line plot of the attribute ’LEVEL’.
print(ggplot(data=dataset, aes(x=DATE, y=LEVEL)) + geom_line())

# (b) Create a scatter plot of the ’RAIN’ against ’LEVEL’.
print(ggplot(data=dataset, aes(x=RAIN, y=LEVEL)) + geom_point())

# (c) Create a plot of the RAIN and LEVEL.
print(ggplot(data=dataset, aes(x=DATE,y=RAIN)) + 
        geom_line(aes(color="RAIN"))+
      geom_line(data=dataset, aes(x=DATE,y=LEVEL,color="LEVEL")) + ylab("RAIN and LEVEL"))

# (d) Find and plot circles on the LEVEL plot at the maximum and minimum value.
maximum<-dataset$LEVEL==max(dataset$LEVEL)
minimum<-dataset$LEVEL==min(dataset$LEVEL)
print(ggplot(dataset,aes(DATE,LEVEL))+geom_blank()+
        geom_point(data=dataset[maximum,],aes(DATE,LEVEL,color="maximum"))+
        geom_point(data=dataset[minimum,],aes(DATE,LEVEL,color="minimum")))

# (e) Plot the LEVEL for the year “2001.”
dataset$YEAR = as.numeric(format(dataset$DATE, "%Y"))
index_2001=dataset$YEAR==2001
print(ggplot(dataset[index_2001,],aes(DATE,LEVEL))+geom_line())
