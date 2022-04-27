# eRM PACKAGE

items <- read.csv("data/items.csv")
library(eRm)
items_dc <- items-1 #
items_dc$sum <- rowSums(items_dc)
head(items_dc)

#only keep rows in dataframe with all z-scores less than absolute value of 3 
no_outliers <- items_dc[(items_dc$sum < 330), ]
head(no_outliers)
