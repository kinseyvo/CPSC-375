# Group Members: Angela DeLeo, Roman Saddi, Kinsey Vo
library(tidyverse)
mydata <- read_csv("breast-cancer-wisconsin.csv")
mydata
View(mydata)
nrow(mydata)
sum(mydata$Class == "B")
sum(mydata$Class == "M")
mydatameans <- kmeans(mydata[,2:10], centers = 2, nstart = 10)
mydatameans
mydatameans$centers
table(mydata$Class, mydatameans$cluster)
load("myvec.RData")
my_acf <- acf(myvec, lag.max = 100)
my_acf
seasonal_frequency <- 25
my_ts <- ts(myvec, frequency = seasonal_frequency)
my_ts
decomposed_ts <- decompose(my_ts)
seasonal <- decomposed_ts$seasonal
trend <- decomposed_ts$trend
random <- decomposed_ts$random
plot(seasonal)
plot(random)
plot(trend)
dtw <- function (A, B) {
M <- nrow(A)
N <- nrow(B)
Cost <- matrix(0,M,N) # Initialize with zeros
for (i in 1:M) {
for (j in 1:N) {
Cost[i,j] <- as.numeric((A[i,1] - B[j,1])^2 + (A[i,2] - B[j,2])^2) # distance function
}
}
C <- matrix(0,M,N) # Initialize with zeros
C[1,1] <- Cost[1,1] # Value for top left cell
for (i in 2:M) { # Values for first column
C[i,1] <- C[i-1,1] + Cost[i,1]
}
for (j in 2:N) { # Values for first row
C[1,j] <- C[1,j-1] + Cost[1,j]
}
# Values for other rows and columns
for (i in 2:M) {
for (j in 2:N) {
C[i, j] <- Cost[i, j] + min(C[i-1, j], C[i, j-1], C[i-1, j-1])
}
}
return (C[M,N])
}
A <- tibble("x" = c(2, 0, 2, 4), "y" = c(2, 4, 6, 5))
A
B <- tibble("x" = c(1, 0, 4), "y" = c(1, 6, 4))
dtw(A, B)
char1_A <- read_csv("char1_A.csv")
char1_E <- read_csv("char1_E.csv")
char1_M <- read_csv("char1_M.csv")
char1_O <- read_csv("char1_O.csv")
char4_ <- read_csv("char4_.csv")
dist_A <- dtw(char4_, char1_A)
dist_E <- dtw(char4_, char1_E)
dist_M <- dtw(char4_, char1_M)
dist_O <- dtw(char4_, char1_O)
dist_A
dist_E
dist_M
dist_O
if (dist_A == min(dist_A, dist_E, dist_M, dist_O)) {
cat("char4_.csv represents character: A")
} else if (dist_E == min(dist_A, dist_E, dist_M, dist_O)) {
cat("char4_.csv represents character: E")
} else if (dist_M == min(dist_A, dist_E, dist_M, dist_O)) {
cat("char4_.csv represents character: M")
} else {
cat("char4_.csv represents character: O")
}
ggplot() + geom_path(data = char4_, aes(x = X1, y = X2), color = "blue") + labs(title = "Visualization of Characters: CHAR4_")
ggplot() + geom_path(data = char1_A, aes(x = X1, y = X2), color = "red") + labs(title = "Visualization of Characters: CHAR1_A")
ggplot() + geom_path(data = char1_E, aes(x = X1, y = X2), color = "green") + labs(title = "Visualization of Characters: CHAR1_E")
ggplot() + geom_path(data = char1_M, aes(x = X1, y = X2), color = "purple") + labs(title = "Visualization of Characters: CHAR1_M")
ggplot() + geom_path(data = char1_O, aes(x = X1, y = X2), color = "orange") + labs(title = "Visualization of Characters: CHAR1_O")
