# GRADED RESPONSE MODEL

# ESTIMATE GRM MODEL
library(stats4)
library(lattice)
library(mirt)
items <- read.csv("data/items_l.csv")
source("code/ApplyItemLabels.R")
model.grm <- 'SPIRITUAL ABUSE GRADED RESPONSE MODEL = 1-66'
results.grm <- mirt(data=items, model=model.grm, itemtype="graded", SE=TRUE,  technical = list(NCYCLES = 10000), verbose=FALSE) # estimate model

# GET ITEM PARAMETERS
coef.grm <- coef(results.grm, IRTpars=TRUE, simplify=TRUE) # save coefficients
items.grm <- as.data.frame(coef.grm$items) # item parameters as data frame

# ITEM FIT
ifit <- mirt::itemfit(results.grm, 'infit')
i <- as.data.frame(ifit)
i2 <- i[,-1]
items.tbl <- cbind(items.grm,i2)

# i <- as.data.frame(itemfit(results.grm, 'infit'))
# i2 <- i[order(i$outfit),]
# misfits <- subset(i2, outfit > 1.5 | outfit < 0.5 | infit > 1.5 | infit < 0.5)
# i <- items.grm[order(items.grm$a),]
# items.pcm$deltab1b2 <- items.pcm$b2 - items.pcm$b1 # look for reversals b1 to b2
# items.pcm$deltab2b3 <- items.pcm$b3 - items.pcm$b2 # look for reversals b2 to b3
# items.pcm$deltab3b4 <- items.pcm$b4 - items.pcm$b3 # look for reversals b3 to b4
# items.pcm$avg <- rowMeans(items.pcm[ ,6:8])
# rv <- subset(items.pcm, deltab1b2 < 0 | deltab2b3 < 0 | deltab3b4 <0) # subset items with reversals
# rv <- rv[order(rv$avg),]
# rv2 <- subset(rv, select = -c(deltab1b2:deltab3b4))

library(kableExtra)
items.tbl %>%
  kable(digits = 3, align = "ccccc", caption = 'Graded Response Model Item Statistics') %>%
  kable_styling(bootstrap_options = "condensed", font_size = 14, fixed_thead = T)


# PCM ITEM PLOTS
library(directlabels)
a <- plot(results.grm, type = 'trace', which.items = c(41,37,42),
          main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
          auto.key=list(points=FALSE,lines=TRUE, columns=4))
direct.label(a, 'top.points')


# MODEL FIT
M2(results.grm, type = "C2", calcNULL = FALSE) %>%
  kable(digits = 3, align = "ccccc", caption = 'Graded Response Model Fit Statistics') %>%
  kable_styling(bootstrap_options = "condensed", font_size = 14, fixed_thead = T)

# knitr::kable(M2(results.grm, type = "C2", calcNULL = FALSE), digits =3, align = "lcccccccccc", caption = "GRM Model Fit")


