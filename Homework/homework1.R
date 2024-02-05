install.packages("ggplot2")
library(ggplot2)
mtcars
nrow(mtcars)
ncol(mtcars)
class(mtcars$disp)
help(disp)
help(mtcars)
mtcars[1:10,]
help(seq())
mtcars[seq(1, nrow(mtcars), by=2), ]
mean(mtcars$mpg)
mtcars[which(mtcars$cyl==6),]
mtcars[which(mtcars$mpg < mean(mtcars$mpg)),]
mtcars[which(mtcars$mpg==max(mtcars$mpg)), "hp"]
help(mpg)
mpg
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=cty))
help(mpg)
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=cty)) + labs(x="Displacement (litres)", y="City (miles per gallon)", title="Angela, Roman, Kinsey") + xlim(c(0, 10)) + ylim(c(0, 40))
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=cty, color=year))
help("geom_point")
ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=cty, color=class, alpha=year))
