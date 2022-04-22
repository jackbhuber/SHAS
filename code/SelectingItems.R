# SELECT DATASETS FOR ANALYSIS
all <- shas[ ,14:97] # select items, dems from columns 14-79
items <- shas[ ,14:79] # all Likert items
ext_items <- shas[ ,14:35] # External Events items
int_items <- shas[ ,66:79] # Internal States items

# REMOVE SELECTED COLUMNS
all <- subset(all, select = -c(Ext_Avg:Global_Avg)) # remove columns for now
