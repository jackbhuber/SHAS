# EVALUATING UNIDIMENSIONALITY: RASCH PRINCIPAL COMPONENT ANALYSIS OF RESIDUALS (PCAR)

# 1- PREP DATA
library(psych)
library(eRm)
items <- read.csv("data/items_l.csv") # NO MISSING DATA
source("code/ApplyItemLabels.R") # apply variable labels
items <- items <- items-1 # subtract 1 from all responses to rescale from 0-4
items[items == 2] <- 0
items[items == 3] <- 1
items[items == 4] <- 1

# 2 - ESTIMATE THE MODEL
results <- RM(items)

# 3 - PCA OF RESIDUAL CORRELATIONS
person.locs <- person.parameter(results) # person parameters
item.fit <- itemfit(person.locs)
std.resids <- item.fit$st.res
pca <- pca(std.resids, nfactors = ncol(items), rotate = "none")
contrasts <- c(pca$values[1], pca$values[2], pca$values[3], pca$values[4], pca$values[5])
plot(contrasts, ylab = "Eigenvalues for Contrasts", xlab = "Contrast Number", 
     main = "")
