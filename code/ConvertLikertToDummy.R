library(ltm)
mult.choice(data, correct) # It converts multiple choice items to a matrix of binary responses

library(mirt)
key <- c(2,3,4,5)
key2binary(items, key, score_missing = FALSE)