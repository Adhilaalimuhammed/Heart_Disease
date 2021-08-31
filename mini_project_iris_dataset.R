#1: loading data------
library(datasets)
library(ggplot2)
df=iris

#2: head & tail of the dataset
head(df)
tail(df)

#3: Shape of the data
ncol(df)
nrow(df) 
dim(df)

#4: column names
colnames(df)

#5: datatypes of each column
str(df)

#6: overall Summary
summary(df)

#7: findimg null values,if any
sum(is.na(df))

#8: paired scatter plot
plot(df,pch=21,bg = c("red","green","blue"),main="scatter plot")

#9: find the count of dependent column values and plot in graph
table(df$Species=='setosa')
table(df$Species)
ggplot(df,aes(x=Species))+geom_bar(fill=c("red","green","yellow"))
#----------------------------------------------------
#10: histogram of each independent column
hist(df$Sepal.Length,main = "sepal length",xlab = "sepal length",ylab = "frecuency",col='yellow')

hist(df$Sepal.Width,col='blue')

hist(df$Petal.Length,main = "Petal length",xlab = "petal length",ylab = "frecuecy",col="pink")

hist(df$Petal.Width,main = "Petal width",xlab = "petal width",ylab = "frecuency",col="red")
#--------------------------------------------------------------------------------------------------
#11: find the count where species='setosa' for sepal.Length<,>5
table(df$Sepal.Length)

table((df$Sepal.Length>5) &(df$Species=='setosa'))
table((df$Sepal.Length<5)&(df$Species=='setosa'))

#12: finding the relation of species colimn values with each independent columns
#a
sl =split(df$Sepal.Length,df$Species)
lapply(sl, mean)
ggplot(df,aes(x=Sepal.Length,fill=Species))+geom_bar()
#---------------------------------------------------------
#b
sw =split(df$Sepal.Width,df$Species)
lapply(sw, mean)
ggplot(df,aes(x=Sepal.Width,fill=Species))+geom_bar()
#----------------------------------------------------------
#c
pl =split(df$Petal.Length,df$Species)
lapply(pl, mean)

ggplot(df,aes(x=Petal.Length,fill=Species))+geom_bar()
#-------------------------------------------------------------
#d
pw =split(df$Petal.Width,df$Species)
lapply(pw, mean)

ggplot(df,aes(x=Petal.Width,fill=Species))+geom_bar()
#-------------------------------------------------------------

#13: boxplot of df
boxplot(df,las=2,col='green')
#--------------------------------------------------------

#14: correlation of independent columns & plotS

library(corrplot)

c = cor(df[,1:4])
c
corrplot(c,method='square')

