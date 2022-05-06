# COMPARE IRT MODELS

library(mirt)
# items <- read.csv("data/items_l.csv")
# 
# # Rating Scale Model
# model.rsm <- 'RATING SCALE MODEL = 1-66'
# results.rsm <- mirt(data=items, model=model.rsm, itemtype="rsm", verbose=FALSE)
# 
# # Partial Credit Model
# model.pcm <- 'PARTIAL CREDIT MODEL = 1-66'
# results.pcm <- mirt(data=items, model=model.pcm, itemtype="Rasch", verbose=FALSE)
# 
# # Generalized Partial Credit Model
# model.gpcm <- 'GENERALIZED PARTIAL CREDIT MODEL = 1-66'
# results.gpcm <- mirt(data=items, model=model.gpcm, itemtype="gpcm", technical = list(NCYCLES = 10000), verbose=FALSE) # estimate model
# 
# # Graded Response Model
# model.grm <- 'GRADED RESPONSE MODEL = 1-66'
# results.grm <- mirt(data=items, model=model.grm, itemtype="graded", SE=TRUE,  technical = list(NCYCLES = 10000), verbose=FALSE) # estimate model

models <- rbind(rsm.model.fit,pcm.model.fit,gpcm.model.fit,grm.model.fit)

# ANOVA
anova(results.rsm, results.pcm, results.gpcm, results.grm) %>%
  kable(digits = 3, align = "cccccccc", caption = "Comparison of IRT Model Fit") %>%
  kable_styling(bootstrap_options = "condensed", font_size = 14, fixed_thead = T)