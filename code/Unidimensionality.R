# UNIDIMENSIONALITY
library(psych)
library(eRm)
items <- read.csv("data/items_l.csv")
items <- items <- items-1
source("code/ApplyItemLabels.R")
results <- RSM(items)

# PERSON ABUSE ESTIMATES
person.locs <- person.parameter(results)
model.prob <- pmat(person.locs)
responses.without.extremes <- student.locations$X.ex

# GET ITEM PARAMETERS
coef.rsm <- coef(results.rsm, IRTpars=TRUE, simplify=TRUE) # save coefficients
items.rsm <- as.data.frame(coef.rsm$items) # item parameters as data frame
items.rsm2 <- items.rsm[order(items.rsm$c),]
