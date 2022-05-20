# EVALUATING UNIDIMENSIONALITY

# 1- PREP DATA
library(psych)
library(eRm)
items2 <- read.csv("data/items2.csv") # NO MISSING DATA
items2 <- items2[,-1]
# source("code/ApplyItemLabels.R") # apply variable labels
items2 <- items2-1 # subtract 1 from all responses to rescale from 0-4
items2[items2 == 2] <- 0
items2[items2 == 3] <- 1
items2[items2 == 4] <- 1
items2 <- items2[complete.cases(items2), ]

# 2 - ESTIMATE THE MODEL
results <- RM(items2)
# summary(results)

# 3 - GET RESIDUALS
person.locs <- person.parameter(results) # person parameters
model.prob <- pmat(person.locs) # model-predicted probabilities for a correct response for each examinee on each item
responses.without.extremes <- person.locs$X.ex # modified response matrix of no extreme values
resids <- responses.without.extremes - model.prob # residuals = difference between observed responses and model predictions

# 4 - CALCULATE PROPORTION OF VARIANCE FROM RASCH MODEL
## Variance of the observations: VO
observations.vector <- as.vector(responses.without.extremes)
VO <- var(observations.vector)

## Variance of the residuals: VR
residuals.vector <- as.vector(resids)
VR <- var(residuals.vector)

## Raw variance explained by Rasch measures: (VO - VR)/VO
library(knitr)
knitr::kable((VO - VR)/VO)
(VO - VR)/VO

# This came out to .23 which exceeds threshold of 20%

# 5 - PCA OF RESIDUAL CORRELATIONS
# item.fit <- itemfit(person.locs)
# std.resids <- item.fit$st.res
# pca <- pca(std.resids, nfactors = ncol(items), rotate = "none")
# contrasts <- c(pca$values[1], pca$values[2], pca$values[3], pca$values[4], pca$values[5])
# plot(contrasts, ylab = "Eigenvalues for Contrasts", xlab = "Contrast Number", 
#      main = "Contrasts from PCA of Standardized Residual Correlations")
