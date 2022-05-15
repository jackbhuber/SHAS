# DEAL WITH MISSING DATA
library(naniar)
library(tidyverse)
miss <- miss_case_summary(all1)
miss <- miss[order(miss$case),]
all2 <- cbind(all1, miss)
all <- subset(all2, pct_miss <= 50)
nonresp <- subset(all2, pct_miss > 50)
rm(all1,all2,miss,nonresp,shas)