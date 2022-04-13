# CODE SOMETHING AS MISSING (IF NECEESARY)
# pew$qi4a[pew$qi4a==9] <- NA # code 9 as missing

# REVERSE CODE (IF NECESSARY)
# pew$sense.peace <- 6-pew$qi4a # reverse code so that higher value indicates higher frequency

# RECODES (IF NECESSARY)
# pew$sense.peace2[pew$sense.peace == 1] <- 1
# pew$sense.peace2[pew$sense.peace == 2] <- 2
# pew$sense.peace2[pew$sense.peace == 3] <- 2
# pew$sense.peace2[pew$sense.peace == 4] <- 2
# pew$sense.peace2[pew$sense.peace == 5] <- 3
# 


library(sjmisc)
data(miss_set)
rec(miss_set$Q68, rec = "1:5=1;NA=0") # recode 1-5=1, NA=0
rec(miss_set$Q70, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q71, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q72, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q73, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q74, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q76, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q77, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q78, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q79, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q80, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q81, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
rec(miss_set$Q82, rec = "1:5=1;NA=0") # recode 1:5=1, NA=0
miss_set

data(miss_set)
replace_na(miss_set[ , c(53,66)], value = 0)