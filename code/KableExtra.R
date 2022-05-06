# KABLE EXTRA TABLES
library(kableExtra)
items.tbl %>%
  kable(digits = 3, align = "ccccc", caption = 'Graded Response Model Item Statistics') %>%
  kable_styling(bootstrap_options = "condensed", font_size = 14, fixed_thead = T)
