```{r}
# DETERMINE NUMBER OF FACTORS TO EXTRACT
library(nFactors)
ev <- eigen(cor(items_l)) # get eigenvalues
ap <- parallel(subject=nrow(items_l),var=ncol(items_l),
               rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)
```

```{r}
# MAXIMUM LIKELIHOOD FACTOR ANALYSIS
# entering raw data and extracting 3 factors,
# with varimax rotation
fit <- factanal(items_l, 6, rotation="varimax")
print(fit, digits=2, cutoff=.3, sort=TRUE)


# # plot factor 1 by factor 2
# load <- fit$loadings[,1:2]
# plot(load,type="n") # set up plot
# text(load,labels=names(items),cex=.7) # add variable names

```