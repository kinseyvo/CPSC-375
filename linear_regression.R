library(tidyverse)
View(iris)
rm(iris)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length))
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2, intercept = 3)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2, intercept = 1.5)
lm(data=iris, formula=Petal.Length~Petal.Width)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = 2.230, intercept = 1.084, color="red")
m <- lm(data=iris, formula=Petal.Length~Petal.Width)
summary(m)
coef(m)
coef(m)[1]
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = coef(m)[2], intercept = coef(m)[1], color="red")
auto_mpg <- read_csv("autompg.csv")
auto_mpgs
ggplot(data = auto_mpg) + geom_point(mapping = aes(x = displacement, y = mpg))
m_auto <- lm(data = auto_mpg, formula=mpg~displacement)
cf_auto <- coef(m_auto)
ggplot(data = auto_mpg) + geom_point(mapping = aes(x = displacement, y = mpg)) + geom_abline(intercept = coef(m_auto)[1], slope = coef(m_auto)[2], color="red")
ggplot(data = auto_mpg) + geom_point(mapping = aes(displacement, mpg))
n <- lm(data = auto_mpg, formula=mpg~displacement)
summary(n)
coef(n)
ggplot(data=iris) + geom_point(mapping = aes(x=mpg, y=displacement)) + geom_abline(slope = coef(m)[2], intercept = coef(m)[1], color="red")
m <- lm(data=iris, formula=Petal.Length~Sepal.Width)
summary(m)
residuals(m)
iris %>% mutate(resid=residuals(m)) %>% View()
iris <- iris %>% mutate(resid=residuals(m))
ggplot(data=iris) + geom_histogram(mapping = aes(x = resid))
ggplot(data = iris) + geom_point(mapping = aes(x = Petal.Width, y = resid))
rstandard(m)
iris %>% mutate(rstd=rstandard(m)) %>% View()
iris %>% mutate(rstd=rstandard(m)) %>% filter(abs(rstd) > 2) %>% View()
irisOutliers <- iris %>% mutate(rstd=rstandard(m)) %>% filter(abs(rstd) > 2)
ggplot(data = iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_abline(slope = coef(m)[2], intercept = coef(m)[1], color="red") + geom_point(data=irisOutliers, mapping = aes(x=Petal.Width, y=Petal.Length), color="red")

library(tidyverse)
rm(iris)
View(iris)
m <- lm(data = iris, formula = Petal.Length~Petal.Width)
summary(m)
ggplot(iris) + geom_point(aes(x=Petal.Width, y=Petal.Length))
ggplot(iris) + geom_point(aes(x=Petal.Width, y=Petal.Length)) + geom_abline(intercept = coef(m)[1], slope=coef(m)[2], color="red")
predx <- data.frame(Petal.Width=c(0.5, 2.5, 10))
predict(m, predx)
summary(m)
coef(m)
1.083558 + 2.229940*0.5
predict(m, predx)
predict(m, predx, interval = "prediction")
predict(m, predx, interval = "confidence")
?predict
predict(m, predx, interval = "confidence", level=0.95)
predict(m, predx, interval = "confidence", level=0.99)
predict(m, predx, interval = "confidence", level=0.9)
predict(m, predx, interval = "confidence", level=0.9999999)
autompg <- read_csv("autompg.csv")
mod_mpg <- lm(data = autompg, formula = mpg~displacement)
ggplot(auto_mpg) + geom_point(aes(x=displacement, y=mpg))
ggplot(auto_mpg) + geom_point(aes(x=displacement, y=mpg)) + geom_abline(intercept = coef(n)[1], slope = coef(n)[2], color="red")
summary(mod_mpg)
coef(mod_mpg)
predx_mpg250 <- data.frame(displacement=250)
predict(mod_mpg, predx_mpg250)
predx_mpg600 <- data.frame(displacement=600)
predict(mod_mpg, predx_mpg600)
predx_mpg <- data.frame(displacement=c(250, 600))
predict(mod_mpg, predx_mpg, interval="prediction")
predict(mod_mpg, predx_mpg, interval="confidence")
predict(mod_mpg, predx_mpg, interval="prediction", level=0.95)
# linear regression equation slide
m1 <- lm(data = iris, formula = Petal.Length~Petal.Width)
summary(m1)
m2 <- lm(data = iris, formula = Petal.Length~Petal.Width+Sepal.Width)
summary(m2)
m3 <- lm(data = iris, formula = Petal.Length~Petal.Width+Sepal.Width+Sepal.Length)
summary(m3)
runif(10)
rm(iris)
iris <- iris %>% mutate(nonsense=runif(150))
View(iris)
m4 <- lm(data = iris, formula = Petal.Length~Petal.Width+Sepal.Width+Sepal.Length+nonsense)
summary(m4)
m5 <- lm(data = iris, formula = Petal.Length~Petal.Width+Species)
summary(m5)
coef(m5)
library(modelr)
iris <- iris %>% add_predictions(m5)
ggplot(data=iris) + geom_point(mapping = aes(x=Petal.Width, y=Petal.Length)) + geom_line(aes(x=Petal.Width, y=pred, color=Species))

m5 <- lm(data = iris, formula = Petal.Length~Petal.Width+Species)
summary(m5)
ggplot(data = iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length))
library(modelr)
iris %>% add_predictions(m5) %>% View()
iris <- iris %>% add_predictions(m5)
ggplot(data = iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length)) + geom_line(mapping = aes(x = Petal.Width, y = pred, color = Species), width = 2)
ggplot(data = iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length)) + geom_line(mapping = aes(x = Petal.Width, y = pred, color = Species))
ggplot(data = iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length, color = Species)) + geom_line(mapping = aes(x = Petal.Width, y = pred, color = Species))
autompg <- read_csv("autompg.csv")
autompg
View(autompg)
ggplot(data = autompg) + geom_point(mapping = aes(y = mpg, x = displacement))
autompg %>% mutate(displ2 = 1/displacement^2)
autompg <- autompg %>% mutate(displ2 = 1/displacement^2)
m_displ2 <- lm(data = autompg, formula = mpg~displ2)
summary(m_displ2)
autompg <- autompg %>% add_predictions(m_displ2)
ggplot(data = autompg) + geom_point(mapping = aes(y = mpg, x = displacement)) + geom_abline(mapping = aes(x=displacement, y=pred))
ggplot(data = autompg) + geom_point(mapping = aes(y = mpg, x = displacement)) + geom_abline(mapping = aes(x=displacement, y=pred), color = "red")
ggplot(data = autompg) + geom_point(mapping = aes(y = mpg, x = displacement)) + geom_abline(mapping = aes(x=displacement, y=pred), color = "red", size = 2)
ggplot(data = autompg) + geom_point(mapping = aes(y = mpg, x = displacement)) + geom_line(mapping = aes(x=displacement, y=pred), color = "red", size = 2)
# regression equation for 1/(displacement^2) is mpg = 16.5 + 1.232x10^5 x displ2
# or mpg = 16.5 + 1.232 x 10^5 x (1/displacement^2)
#iris classwork slide 57
iris <- iris %>% mutate(PW2 = Petal.Width^2)
lm(data = iris, formula = Petal.Length~PW2)
iris <- lm(data = iris, formula = Petal.Length~PW2)
iris %>% add_predictions(iris.PW2.model) %>% View()
iris %>% iris %>% add_predictions(iris.PW2.model)
ggplot(data= iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length)) + geom_line(mapping = aes(x = Petal.Width, y = pred), color = "red")
ggplot(data= iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length)) + geom_line(mapping = aes(x = Petal.Width, y = pred), color = "red")
iris <- iris %>% add_predictions(iris.PW2.model)
ggplot(data= iris) + geom_point(mapping = aes(x = Petal.Width, y = Petal.Length)) + geom_line(mapping = aes(x = Petal.Width, y = pred), color = "red")
summary(iris)
autompg <- read_csv("autompg.csv")
mod_displ_cyl <- lm(data = autompg, formula = mpg ~ displacement + cylinders)
summary(mod_displ_cyl)
autompg <- autompg %>% add_predictions(mod_displ_cyl)
ggplot(data = autompg) + geom_point(mapping = aes(x = displacement, y = mpg)) + geom_line(mapping = aes(x = displacement, y = pred))
ggplot(data = autompg) + geom_point(mapping = aes(x = displacement, y = mpg)) + geom_line(mapping = aes(x = displacement, y = pred, color = cylinders))
autompg <- autompg %>% mutate(D2 = (1/(displacement^2)))
autompg.D2.model <- lm(data = autompg, formula = mpg~D2)
summary(autompg.D2.model)
autompg <- autompg %>% add_predictions(autompg.D2.model)
ggplot(data = autompg) + geom_point(mapping = aes(y = mpg, x = displacement)) + geom_abline(mapping = aes(x=displacement, y=pred))
ggplot(data = autompg) + geom_point(mapping = aes(x = displacement, y = mpg)) + geom_line(mapping = aes(x = displacement, y = pred), color = "red")
