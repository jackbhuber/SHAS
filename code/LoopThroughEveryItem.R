# LOOP TO GENERATE PLOT FOR EVERY ITEM
# I can't get it to work

library(directlabels)
for (item.number in 1:ncol(items)){
  plt <- plot(results.pcm, type = 'trace', which.items = item.number,
              main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
              auto.key=list(points=FALSE,lines=TRUE, columns=4)) # option curves
  direct.label(plt, 'top.points')
}
