# EXPORT DATA FRAME
library("writexl")
write_xlsx(item_stats,"data/item_stats.xlsx")
write_csv(item_stats,"data/item_stats.csv")