a <- c(5, 0, -1)
b <- c(7, 3, 5)
(a-b)^2
sum((a-b)^2)
sqrt(sum((a-b)^2))
library(tidyverse)
a-b %>% .^(2) %>% sum() %>% sqrt()
a-b %>% .^(2)
a-b %>% .^(2) %>% sum()
a-b %>% .^(2) %>% sum() %>% sqrt()
(a-b) %>% .^2
(a-b) %>% .^2 %>% sum()
(a-b) %>% .^2 %>% sum() %>% sqrt()
a <- c(4, 0, 2)
b <- c(5, 0, 1)
(a-b) %>% .^2 %>% sum() %>% sqrt()
install.packages("class")
library(class)
View(iris)
sample(1:10, 3)
sample(1:10, 3)
sample(1:150, 100)
trainindex <- sample(1:150, 100)
#1:4 represent first 4 columns and 5 is the last one for iris
trainfeatures <- iris[trainindex, 1:4]
trainlabels <- iris[trainindex, 5]
testfeatures <- iris[-trainindex, 1:4]
testlabels <- iris[-trainindex, 5]
knn(train = trainfeatures, test = testfeatures, cl = trainlabels, k = 1)
predicted <- knn(train = trainfeatures, test = testfeatures, cl = trainlabels, k = 1)
data.frame(testlabels, predicted)
data.frame(testlabels, predicted) %>% View()
table(testlabels, predicted)
# 3 mistakes here (not on the diagonal)
x <-c(16, 100, 37, 50)
(x - min(x)) / (max(x) - min(x))
x <- c(100, 100000, 50000)
(x - min(x)) / (max(x) - min(x))
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
normalize(x)
normalize(c(10, 20, 40))
iris %>% mutate(Sepal.Length.norm = normalize(Sepal.Length)) %>% View()
