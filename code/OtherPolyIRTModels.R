# OTHER POLYTOMOUS IRT MODELS

### Generalized Partial Credit Model (GPCM)
In the PCM, "the property of ordered threshold parameters is not a requirement in the partial credit or generalized partial credit models" [@EmbretsonReise2000].

```{r gpcm-mod}
# GENERALIZED PCM ESTIMATION
# model.gpcm <- 'SPIRITUAL ABUSE GPCM = 1-66'
# results.gpcm <- mirt(data=items, model=model.gpcm, itemtype="gpcm", verbose=FALSE)
# coef.gpcm <- coef(results.gpcm, IRTpars=TRUE, simplify=TRUE)
# items.gpcm <- as.data.frame(coef.gpcm$items)
# print(results.gpcm)
# #print(items.gpcm)
# knitr::kable(round(items.gpcm,2), caption = "Generalized Partial Credit Model (GPCM) - Item Parameters")
```

```{r gpcm-occs}
# OPTION CHARACTERISTIC CURVES
# plot(results.gpcm, type = 'trace', which.items = c(1,2,3,4),
#      main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
#      auto.key=list(points=FALSE,lines=TRUE, columns=4)) # option curves
```

**Item parameters**.

**Item plots**.

**Model fit**.

### Rating Scale Model (RSM)

```{r rsm-est}
# model.rsm <- 'SPIRITUAL ABUSE RSM = 1-66'
# results.rsm <- mirt(data=items, model=model.rsm, itemtype="rsm", verbose=FALSE)
# coef.rsm <- coef(results.rsm, simplify=TRUE)
# items.rsm <- as.data.frame(coef.rsm$items)
# print(summary(results.rsm))
# #print(items.rsm)
# knitr::kable(round(items.rsm,2), caption = "Rating Scale Model (RSM) - Item Parameters")
```

```{r rsm-plots}
# plot(results.rsm, type = 'trace', which.items = c(1,2,3,4),
#      main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
#      auto.key=list(points=FALSE,lines=TRUE, columns=4)) # option curves
# plot(results.rsm, type = 'itemscore', theta_lim = c(-4,4), lwd=2, facet_items = FALSE) # item scoring traceline

#plot(results.rsm, type = 'infotrace', which.items = c(1,2,3,4),
#     main = "", par.settings = simpleTheme(lwd=2)) # item information functions (IIF)
#plot(results.rsm, type = 'info', theta_lim = c(-4,4), lwd=2) # test information curve
#plot(results.rsm, type = 'SE', theta_lim = c(-4,4), lwd=2) # test standard errors
```


### Graded Response Model (GRM)

```{r}
# model.grm <- 'SPIRITUAL ABUSE GRM = 1-66'
# results.grm <- mirt(data=items, model=model.grm, itemtype="graded", verbose=FALSE)
# coef.grm <- coef(results.grm, simplify=TRUE)
# items.grm <- as.data.frame(coef.grm$items)
# print(summary(results.grm))
# #print(items.grm)
# knitr::kable(round(items.grm,2), caption = "Graded Response Model (GRM) - Item Parameters")
# 
# 
# plot(results.grm, type = 'trace', which.items = c(1,2,3,4),
#      main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
#      auto.key=list(points=FALSE,lines=TRUE, columns=4)) # option curves
# plot(results.grm, type = 'itemscore', theta_lim = c(-4,4), lwd=2, facet_items = FALSE) # item scoring traceline

#plot(results.rsm, type = 'infotrace', which.items = c(1,2,3,4),
#     main = "", par.settings = simpleTheme(lwd=2)) # item information functions (IIF)
#plot(results.rsm, type = 'info', theta_lim = c(-4,4), lwd=2) # test information curve
#plot(results.rsm, type = 'SE', theta_lim = c(-4,4), lwd=2) # test standard errors
```

In the Graded Response Model, between category threshold parameters are ordered.