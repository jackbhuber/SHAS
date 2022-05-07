# ESTIMATE RSM MODEL
library(mirt)
items <- read.csv("data/items_l.csv")
source("code/ApplyItemLabels.R")
model.rsm <- 'RATING SCALE MODEL = 1-66'
results.rsm <- mirt(data=items, model=model.rsm, itemtype="rsm", verbose=FALSE) # estimate model

# GET ITEM PARAMETERS
coef.rsm <- coef(results.rsm, IRTpars=TRUE, simplify=TRUE) # save coefficients
item.pars.rsm <- as.data.frame(coef.rsm$items) # item parameters as data frame

# ATTACH FIT STATISTICS
item.fits.rsm <- as.data.frame(mirt::itemfit(results.rsm, 'infit'))
item.fits.rsm <- item.fits.rsm[,-1]
items.tbl.rsm <- cbind(item.pars.rsm,item.fits.rsm)

library(dplyr)
library(kableExtra)

head(items.tbl.rsm[c("a1","b1","b2","b3","b4","c","outfit","z.outfit","infit","z.infit")]) %>%
  mutate(
    outfit = cell_spec(outfit, background = ifelse(outfit > 1, "red","transparent"))) %>%
  kable(escape = FALSE) %>%
  kable_styling(font_size = 12, fixed_thead = T) %>%
  column_spec(7, color = "black")

items.tbl.rsm[, 1:8] %>%
  mutate(outfit = cell_spec(outfit, background=ifelse(outfit > 1, "red", "green"))) %>% 
  kbl(booktabs = T, linesep = "", escape=FALSE) %>% 
  kable_paper(full_width = F) %>%
  column_spec(6, color = "white")


head(iris[c("Species","Sepal.Length")]) %>%
  mutate(
    Sepal.Length = cell_spec(Sepal.Length, color = ifelse(Sepal.Length > 5, "green","red"))) %>%
  kable(escape = FALSE) %>%
  kable_styling(position = "left", full_width = FALSE) %>%
  column_spec(1, bold = TRUE, border_right = TRUE, color = "black", background = "lightgrey")
