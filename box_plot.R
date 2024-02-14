summary(iris)
View(airquality)
is.na(airquality$Ozone)
# get missing values of Ozone
# COUNT the number of missing values of Ozone
summary(airquality)
count(is.na(airquality$Ozone)==FALSE)
sum(is.na(airquality$Ozone)==FALSE)
nvm
sum(is.na(airquality$Ozone))
ggplot(data=iris) + geom_point(mapping=aes(x=Sepal.Length, y=Sepal.Width))
library(ggplot2)
ggplot(data=iris) + geom_point(mapping=aes(x=Sepal.Length, y=Sepal.Width))
ggplot(data=iris) + geom_point(mapping=aes(x=Sepal.Length, y=Sepal.Width)) + labs(x="Sepal Length", y="Sepal Width")
ggplot(data=iris) + geom_point(mapping=aes(x=Sepal.Length, y=Sepal.Width)) + labs(x="Sepal Length", y="Sepal Width") + xlim(c(1, 10)) + ylim(c(1, 10))
ggplot(data=iris) + geom_point(mapping=aes(x=Sepal.Length, y=Sepal.Width)) + labs(x="Sepal Length", y="Sepal Width") + xlim(c(1, 10)) + ylim(c(1, 10)) + theme_linedraw()
library(ggplot2)
ggplot(data=airquality) + geom_histogram(mapping = aes(x=Ozone))
ggplot(data=iris) + geom_histogram(x=Sepal.Length)
ggplot(data=iris) + geom_histogram(x=Petal.Length)
ggplot(data=iris) + geom_histogram(x=Petal.length)
iris
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length))
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 30)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 10)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 0.25)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 0.5)
ggplot(data=iris) + geom_histogram(mapping = aes(x=Sepal.Length), binwidth = 0.25)
c(36, 42, 100, 28, 17, 12, 9, 4, 1)
x <- c(36, 42, 100, 28, 17, 12, 9, 4, 1)
x
sort(x)
x
median(x)
quartile(x)
quantile((x))
IQR(x)
IQR(x)*1.5
36+ IQR(x)*1.5
9 - IQR(x)*1.5
data.frame(myfirstcol=x)
mydata <- data.frame(myfirstcol=x)
mydata
ggplot(data=mydata) + geom_boxplot(mapping = aes(y=myfirstcol))
ggplot(data=airquality) + geom_boxplot(mapping = aes(y=Ozone))
IQR(airquality$Ozone)
quantile(airquality$Ozone, na.rm = TRUE)
IQR(airquality$Ozone, na.rm=TRUE)
18 - IQR(airquality$Ozone)*1.5
18 - IQR(airquality$Ozone, na.rm=TRUE)*1.5
63.25 + IQR(airquality$Ozone, na.rm=TRUE)*1.5
x <- c(8, 11, 17, 36, 25, 24, 1, 20, 64)
data.frame(newcol=x)
newdata <- data.frame(newcol=x)
newdata
ggplot(data=newdata) + geom_boxplot(mapping = aes(y=newcol))
ggplot(data=newdata) + geom_boxplot(mapping = aes(y=newcol))
ggplot(data=iris) + geom_boxplot(mapping=aes(y=Sepal.Width, x=Species))
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class, fill=drv))
ggplot(data=mpg)+ geom_bar(mapping = aes(x=class, fill=drv), position = "dodge")
summary(airquality)
str(airquality)
dim(airquality)
ncol(airquality)
