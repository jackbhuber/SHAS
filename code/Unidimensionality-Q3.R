# Q3 STATISTIC
library(sirt)
items <- read.csv("data/ditems_l.csv") # grab the data
mod <- sirt::rasch.mml2(items) # estimate the Rasch model
mod.wle <- sirt::wle.rasch(dat=items, b=mod$item$b) # estimate WLEs
mod.q3 <- sirt::Q3(dat=items, theta=mod.wle$theta, b=mod$item$b ) # estimate Q3

# plot Q3 statistics
I <- ncol(items)
image( 1:I, 1:I, mod.q3$q3.matrix, col=gray( 1 - (0:32)/32),
       xlab="Item", ylab="Item")
abline(v=c(53,66)) # borders for testlets
abline(h=c(53,66))

rm(list=ls())