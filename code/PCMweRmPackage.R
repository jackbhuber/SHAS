# PARTIAL CREDIT MODEL WITH eRm PACKAGE

library(eRm) # For running the Partial Credit Model
items_dc <- items-1 # 
PC_model <- PCM(items_dc)
summary(PC_model)

library(plyr) # For plot the Item characteristic curves
library(WrightMap) # For plot the variable map
WrightMap::plotPIMap(PC_model, ask = FALSE)
plyr::plotICC(PC_model, ask = FALSE)
