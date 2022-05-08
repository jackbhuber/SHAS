# KABLE EXTRA TABLES
# this works
library(kableExtra)
library(dplyr)
round(items.tbl,2) %>%
  mutate(
    outfit = cell_spec(outfit, color = ifelse(outfit > .5 & outfit < 1.5 ,"black",c("red",bold=TRUE))),
    infit = cell_spec(infit, color = ifelse(infit > .5 & infit < 1.5 , "black","red"))
  ) %>%
  kbl(escape = F, align = "rrrrrrrrr", caption = 'Rating Scale Model Item Parameters and Fit Statistics') %>%
  kable_styling("condensed", font_size = 12, fixed_thead = T, full_width = TRUE)
