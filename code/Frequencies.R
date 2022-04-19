#{r fig.width=10, fig.height=7, fig.cap="Frequencies of Well-Being Items", # fig.align='center'}

# FREQUENCIES
# peacecounts <- table(items$sense.peace)
# wondercounts <- table(items$sense.wonder)
# gratitudecounts <- table(items$sense.gratitude)
# purposecounts <- table(items$sense.purpose)
# labs <- c("1 Never", "2 Seldom", "3 Several times a year", "4 Once or twice a month", "5 At least once a week")
# par(mfrow=c(2,2))
# barplot(peacecounts, main="Deep Sense of Peace", horiz=FALSE, col='red', ylim = c(0,8000),
#         names.arg=labs)
# barplot(wondercounts, main="Deep Sense of Wonder", horiz=FALSE, col='blue', ylim = c(0,8000),
#         names.arg=labs)
# barplot(gratitudecounts, main="Strong Sense of Gratitude", horiz=FALSE, col='purple', ylim = c(0,8000),
#         names.arg=labs)
# barplot(purposecounts, main="Wonder about Meaning and Purpose", horiz=FALSE, col='green', ylim = c(0,8000),
#         names.arg=labs)