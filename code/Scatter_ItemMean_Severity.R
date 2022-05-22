## Initial Item Analysis

library(psych)
library(ltm)

# LOAD DATA
all <- read.csv("data/all.csv")
all <- all[,-1]
source("code/ApplyAllLabels.R")
items2 <- all[ ,1:66]
items2 <- items2[,-1]
items2 <- items2[,-c(5,15,28,33,41,46)]
descriptives <- as.data.frame(psych::describe(items2))
descriptives <- subset(descriptives, select = -c(vars, trimmed, se, median, mad, min, max, range))
descriptives <- subset(descriptives, select = -c(n, sd, skew, kurtosis))


model.rsm <- 'RATING SCALE MODEL = 1-60'
results.rsm <- mirt(data=items2, model=model.rsm, itemnames = NULL, itemtype="rsm", verbose=FALSE)
coef.rsm <- coef(results.rsm, IRTpars=TRUE, simplify=TRUE)
item.pars.rsm <- as.data.frame(coef.rsm$items)
item.pars.rsm <- subset(item.pars.rsm, select = -c(a1:b4))

# BUILD TABLE
item.table <- cbind(descriptives,item.pars.rsm)
item.table2 <- item.table[order(item.table$mean),]

# CLEAN UP
rm(coef.rsm,items2,results.rsm)
rm(item.pars.rsm)

# SCATTERPLOT
plot(item.table2$c, item.table2$mean,
     xlim=c(-1.5,1) , ylim=c(1.25,3.5), 
     pch=1, 
     cex=.5, 
     col="red",
     xlab="theta", ylab="mean",
     main="A simple scatterplot"
)
