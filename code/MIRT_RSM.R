# RSM WITH MIRT PACKAGE

# LOAD PACKAGES
library(dplyr)
library(knitr)
library(kableExtra)
library(stats4)
library(lattice)
library(mirt)
library(TAM)

# PREP DATA
items2 <- read.csv("data/items2.csv")
items2 <- items2[,-1]
items2 <- items2[complete.cases(items2),]
# items2 <- items2 - 1
source("code/ApplyItemLabels2.R")

# ESTIMATE MODEL
model.rsm <- 'RATING SCALE MODEL = 1-60'
results.rsm <- mirt(data=items2, model=model.rsm, itemnames = NULL, itemtype="rsm", verbose=FALSE)

# ITEM PARAMETERS
coef.rsm <- coef(results.rsm, IRTpars=TRUE, simplify=TRUE)
item.pars.rsm <- as.data.frame(coef.rsm$items)
item.pars.rsm <- within(item.pars.rsm, rm(a1))

# FIT STATISTICS
item.fits.rsm <- as.data.frame(mirt::itemfit(results.rsm, 'infit'))
item.fits.rsm <- item.fits.rsm[,-1]
items.tbl.rsm <- cbind(item.pars.rsm,item.fits.rsm)
items.tbl.rsm <- round(items.tbl.rsm,2)
items.tbl.rsm$flag <- with(items.tbl.rsm, ifelse(items.tbl.rsm$infit > 1.5 | items.tbl.rsm$infit < 0.5 | items.tbl.rsm$outfit < 0.5 | items.tbl.rsm$outfit > 1.5, "*", ""))
items.tbl.rsm <- items.tbl.rsm[order(items.tbl.rsm$c),]

# RSM ITEM PLOTS
library(directlabels)
a <- plot(results.rsm, type = 'trace', which.items = c(30,9),
          main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
          auto.key=list(points=FALSE,lines=TRUE, columns=4))
direct.label(a, 'top.points')

# BUILD ITEMS TABLE
items.tbl.rsm <- cbind(xsi_rsm, fit_rsm)
items.tbl.rsm <- round(items.tbl.rsm,2)
items.tbl.rsm$flag <- with(items.tbl.rsm, ifelse(items.tbl.rsm$Infit > 1.5 | items.tbl.rsm$Infit < 0.5 | items.tbl.rsm$Outfit < 0.5 | items.tbl.rsm$Outfit > 1.5, "*", ""))
items.tbl.rsm <- items.tbl.rsm[order(items.tbl.rsm$xsi),]
remove <- c("Cat1","Cat2","Cat3","Cat4")
items.tbl.rsm <- items.tbl.rsm[!(row.names(items.tbl.rsm) %in% remove),]

# MODEL FIT
library(kableExtra)
rsm.model.fit <- as.data.frame(M2(results.rsm, type = "C2"))
rsm.model.fit <- round(rsm.model.fit,3)
row.names(rsm.model.fit)[row.names(rsm.model.fit) == "stats"] <- "RSM"
round(rsm.model.fit,3) %>%
  kable(align = "cccccccc", booktabs = T, caption = 'Model Fit Statistics for the Rating Scale Model') %>%
  kable_styling(latex_options = "scale_down")

