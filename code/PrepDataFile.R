# LOAD ORIGINAL DATA
library(readxl) # for reading the source Excel file
shas <- read_excel("data/data.xlsx") # load Excel file

# SELECT ITEMS
all <- shas[ ,14:97] # select items, dems from columns 14-79
all <- subset(all, select = -c(Ext_Avg:Global_Avg)) # remove columns for now
write.csv(all,"data/all.csv")
rm(shas,all)