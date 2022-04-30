# Q3 STATISTIC
library(sirt)
items <- read.csv("data/ditems_l.csv")

# 1 - ESIMATE THE RASCH MODEL
mod <- sirt::rasch.mml2(items)
mod$item

# 2 - ESTIMATE WLEs
mod.wle <- sirt::wle.rasch( dat=items, b=mod$item$b )

# 3 - CALCULATE Q3
mod.q3 <- sirt::Q3( dat=items, theta=mod.wle$theta, b=mod$item$b )
mod.q3


# plot Q3 statistics
I <- ncol(data.read)
image( 1:I, 1:I, mod.q3$q3.matrix, col=gray( 1 - (0:32)/32),
       xlab="Item", ylab="Item")
abline(v=c(5,9)) # borders for testlets
abline(h=c(5,9))