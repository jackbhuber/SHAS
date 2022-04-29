# I couldn't figure out how to make this work
library(ltm)
mult.choice(data, correct) # It converts multiple choice items to a matrix of binary responses

# I couldn't figure out how to make this work
library(mirt)
key <- c(2,3,4,5)
key2binary(items, key, score_missing = FALSE)

# this is easy enough
items[items == 2] <- 1
items[items == 3] <- 1
items[items == 4] <- 1
