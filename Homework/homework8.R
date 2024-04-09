# Group Members: Angela DeLeo, Roman Saddi, Kinsey Vo
library(tidyverse)
library(class)
pima_indians <- data.frame(read_csv("pima-indians-diabetes-resampled.csv"))
View(pima_indians)
pima_indians <- pima_indians %>% filter(Glucose > 0)
normalize <- function(x) { return ((x - min(x)) / (max(x) - min(x)) )}
pima_indians <- pima_indians %>% mutate(normPreg = normalize(Preg)) %>% mutate(normPedigree = normalize(Pedigree)) %>% mutate(normGlucose = normalize(Glucose))
trainIndex <- 1:500
trainFeatures <- pima_indians[trainIndex, c(3:6, 8, 10:12)]
trainLabels <- pima_indians[trainIndex, 9]
testIndex <- 501:763
testFeatures <- pima_indians[testIndex, c(3:6, 8, 10:12)]
testLabels <- pima_indians[testIndex, 9]
trainIndex <- 1:500
trainFeatures <- pima_indians[trainIndex, c(10, 11)]
trainLabels <- pima_indians[trainIndex, 9]
testIndex <- 501:763
testFeatures <- pima_indians[testIndex, c(10, 11)]
testLabels <- pima_indians[testIndex, 9]
predicted <- knn(train = trainFeatures, test = testFeatures, cl = trainLabels, k = 1)
table(testLabels, predicted)
trainIndex <- 1:500
trainFeatures <- pima_indians[trainIndex, c(10:12)]
trainlabels <- pima_indians[trainIndex, 9]
testIndex <- 501:763
testFeatures <- pima_indians[testIndex, c(10:12)]
testLabels <- pima_indians[testIndex, 9]
predicted <- knn(train = trainFeatures, test = testFeatures, cl = trainlabels, k = 1)
table(testLabels, predicted)
trainIndex <- 1:500
trainFeatures <- pima_indians[trainIndex, c(10:12)]
trainLabels <- pima_indians[trainIndex, 9]
testIndex <- 501:763
testFeatures <- pima_indians[testIndex, c(10:12)]
testLabels <- pima_indians[testIndex, 9]
predicted <- knn(train = trainFeatures, test = testFeatures, cl = trainLabels, k = 11)
table(testLabels, predicted)
trainIndex <- 1:500
trainFeatures <- pima_indians[trainIndex, c(10:12)]
trainLabels <- pima_indians[trainIndex, 9]
testIndex <- 501:763
testFeatures <- pima_indians[testIndex, c(10:12)]
testLabels <- pima_indians[testIndex, 9]
predicted <- knn(train = trainFeatures, test = testFeatures, cl = trainLabels, k = 5)
table(testLabels, predicted)
