x<-1:5
x
x+2
sum(x)
y<-10
x+y
y^2
z<-x+y
rm(y)
print("Hello World")

data<-read.csv("DataSet.csv",header=TRUE,sep=";")
data$X <- as.numeric(gsub(",", "", data$X))
data$Y <- as.numeric(gsub(",", "", data$Y))

plot(data$X,data$Y,xlab="X",ylab="Y")## Scatterplot
hist(data$Y,xlab="X",density=10,angle=45,col="blue")##histogram

boxplot(data$Y,col="lightblue")##box-&-whisker plot
range(data$X);min(data$X);max(data$X)
mean(data$X);sd(data$X)
range(data$Y);mean(data$Y);sd(data$Y)
summary(data)
regress<-lm(formula=Y~X,data=data)
summary(regress)
res<-resid(regress);summary(res)
install.packages("ggplot2",dependencies = TRUE)
library("ggplot2")
ggplot(data=data)+geom_bar(aes(res),binwidth=0.1)
ggplot(data=data)+geom_boxplot(aes(x=X,y=Y))
ggplot(data=data)+geom_point(aes(x=X,y=Y))+geom_smooth(aes(x=X,y=Y),method="lm")
qqnorm(res,ylim= c(-50,50)):qqline(res)
install.packages("tseries,dependencies=TRUE")
library("tseries")
jarque.bera.test(res)
install.packages("moments")
library("moments")
skewness(res);kurtosis(res)


                               

