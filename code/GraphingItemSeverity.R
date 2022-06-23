CODE FOR GRAPHING DISTRIBUTION OF ITEM DIFFICULTY

# delta_tau_rsm <- mod_rsm$item_irt
# delta_tau_r <- delta_tau_rsm %>%
#   mutate(d1 = beta + tau.Cat1,
#          d2 = beta + tau.Cat2,
#          d3 = beta + tau.Cat3,
#          d4 = beta + tau.Cat4) %>% 
#   select(item, beta, d1, d2, d3, d4) %>% 
#   mutate(beta_diff = beta) %>% 
#   pivot_longer(cols = c(beta, d1, d2, d3, d4), names_to = "Parameter" ) %>% 
#   mutate(type_delta = as.factor(if_else(Parameter == "beta", "beta", "delta"))) %>% 
#   arrange(beta_diff)

# delta_tau_r

# library(ggplot2)
# pcmp <- ggplot(delta_tau_r, aes(x = reorder(item, beta_diff),  # ordering difficulties by beta
#                         y = value, #what's on the y-axis
#                         group = item, # the line segments need to "know" where to connect
#                         fill=type_delta, # what to fill on
#                         shape = type_delta, # only some shapes are fillable
#                         )) + 
#   geom_point(size = 2)+ # making points a little big
#   theme_bw() + 
#   scale_fill_manual(values = c("black", "white")) + #have to do this manually - so, two fill colors
#   scale_shape_manual(values = c(21, 21)) + # http://www.cookbook-r.com/Graphs/Shapes_and_line_types/
#   geom_line(aes(x=item, y=value)) + # add the lines
#   coord_flip() + #flip so the x-axis is on the y axist
#   ggtitle("Plot item difficulties in delta_tau for the PCM") +
#   xlab("Item") +
#   ylab("Difficulties in logits")
# 
# pcmp