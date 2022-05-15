# MORE CLASSICAL ITEM STATISTICS

# CLASSICAL ITEM ANALYSIS
# library(CTT)
# CTT::itemAnalysis(all[,1:66], itemReport=TRUE, NA.Delete=TRUE, rBisML=FALSE, easyFlag, pBisFlag, bisFlag, flagStyle = c("X",""))
# CTT::itemAnalysis(all[,1:66], itemReport=TRUE, NA.Delete=TRUE, rBisML=FALSE, flagStyle = c("X",""))

library(pastecs)
item_stats <- pastecs::stat.desc(items.tbl) # use the stat.desc() to render data frame of item stats
item_stats
item_stats <- t(item_stats) # transpose the data frame
item_stats <- data.frame(item_stats)
item_stats[order(item_stats$mean), ] # order by mean
item_stats[order(item_stats$nbr.val), ] # order by N cases