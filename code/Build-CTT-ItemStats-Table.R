# LOAD DATA
all <- read.csv("data/all.csv")
all <- all[,-1]
source("code/ApplyAllLabels.R")
library(psych)
library(ltm)

# DESCRIPTIVES
descriptives <- as.data.frame(psych::describe(all[,1:66]))
descriptives <- subset(descriptives, select = -c(vars, trimmed, se, median, mad, min, max, range))

# CATEGORY FREQUENCIES
catfreqs <- ltm::descript(all[,1:66])
catfreqs <- as.data.frame(catfreqs[["perc"]])
#names(catfreqs) <- c('1' = "Never", '2' = "Once or twice", '3' = "Sometimes", '4' = "Often", '5' = "All the time")

# ITEM TOTAL CORRELATIONS
a <- psych::alpha(all[,1:66])
item.totals <- as.data.frame(a[["item.stats"]][["raw.r"]])
names(item.totals) <- c('a[["item.stats"]][["raw.r"]]'= "Item-total correlation")

# BUILD TABLE
item.table <- cbind(catfreqs, descriptives, item.totals)
item.table$flag <- with(item.table, ifelse(item.table$skew > 2 | item.table$skew < -2 | item.table$kurtosis < -7 | item.table$kurtosis > 7 | item.table$'Item-total correlation' < .5, "*", ""))
item.table2 <- item.table[order(item.table$mean),]

# CLEAN UP
rm(all,descriptives,catfreqs,a,item.totals,item.table)
