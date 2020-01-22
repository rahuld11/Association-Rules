install.packages("arules") #Used for buliding association rules i.e. apriori algorithm
library(arules)

###so we can importfile by using read.transaction function for transaction data
book<-read.transactions(file.choose(),format="basket")

View(book)
str(book)

###so we can see all the elements in the data so we can use inspect command and showing only top 10 transaction
inspect(book[1:10]) 

class(book)
summary(book)

install.packages("arulesViz") #used for visualizing rules
library(arulesViz)

# Applying apriori algorithm to get relevant rules
arules <- apriori(book,parameter = list(support=0.003,confidence=0.06,minlen=1))
arules

inspect(arules)

##if you want to inspect top rules baised on the lift to view use inspecct
inspect(head(sort(arules,by="lift")))

# Sorting rules by confidence 
arules_conf <- sort(arules,by="confidence")
inspect(arules_conf)

# Sortint rules by lift ratio
arules_lift <- sort(arules,by="lift")
inspect(arules_lift)

##overall Quality
head(quality(arules))

head(quality(sort(arules)))

##Different ways of Visualization Rules
plot(arules,jitter=0)
windows()

plot(arules,method = "scatterplot")
plot(arules,method = "graph")

