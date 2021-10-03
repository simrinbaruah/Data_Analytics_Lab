# 2. Continue the same with minimum support of 20% and the minimum confidence of 50%

library(arules)
library(arulesViz)

data(Adult)

rules <- apriori(Adult, parameter = list(supp = 0.2, conf = 0.5))

rules<-sort(rules, decreasing = TRUE, by = "confidence")
inspect(rules[1:10]) #first 10 strong association rules

itemFrequencyPlot(Adult, topN = 20,
                  type = 'absolute',
                  main = 'Frequency Plot',
                  ylab = "Item Frequency")
