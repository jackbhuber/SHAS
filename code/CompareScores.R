# SCORE ANALYSIS

# LOAD DATA
items <- read.csv("data/items_l.csv")

# TOTAL RAW SCORE
items2$totalraw <- rowSums(items[ , c(1:66)])

# IRT TRAIT SCORES
load("data/results.rsm.RData")
load("data/results.pcm.RData")
load("data/results.gpcm.RData")
load("data/results.grm.RData")
library(mirt)
rsmscores <- fscores(results.rsm)
pcmscores <- fscores(results.pcm)
gpcmscores <- fscores(results.gpcm)
grmscores <- fscores(results.grm)

# BIND COLUMNS
items2 <- cbind(items, rsmscores, pcmscores, gpcmscores, grmscores)

# SHORTEN VARIABLE NAMES
names(scores) <- c(RATINGSCALEMODEL = "RSM",
                   PARTIALCREDITMODEL = "PCM",
                   GENERALIZEDPARTIALCREDITMODEL = "GPCM",
                   GRADEDRESPONSEMODEL = "GRM",
                   totalraw = "TOTAL")

# JUST THE SCORES
scores <- items2[,67:71]

# CALCULATE CORRELATIONS
corrs <- cor(scores, method = c("pearson"))
round(corrs,3)

# VISUAL CORRELATION MATRIX
library(corrplot)
corrplot(cor(scores), order = "original", tl.col='black', tl.cex=.75) # visual correlation matrix
corrplot(cor(scores), order = "original", tl.col='black') # visual correlation matrix



