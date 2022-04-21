# this has lots of potential but doesn't quite work

ext_items_l <- read.csv("data/ext_items_l.csv")
library(corrplot)
corrplot(cor(ext_items_l), order = "original", tl.col='black', tl.cex=.75) # visual correlation matrix

# this is a basic matrix of numbers - would work best with a small dataset
corrs <- cor(ext_items_l, method = c("pearson")) # correlation matrix
knitr::kable(round(corrs,2), caption = "Correlation Matrix") # fancy kable version of correlation matrix

# CORRELATION MATRIX (LOWER HALF)
lowerCor(ext_items_l) # the correlation matrix, rounded to 2 decimals

# corr.test(ext_items_l) # p-values and such


# this is cool
# library(corrplot)
# corrplot(cor(ext_items_l), method = 'ellipse', order = 'AOE')
