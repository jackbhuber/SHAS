# PARTIAL CREDIT MODEL
library(mirt) # load package
items <- read.csv("data/items.csv") # read data
names(items) <- c(
  # EXTERNAL EVENTS ITEMS
  Q7  = "EQ7 - Pastor speaking on God's behalf",
  Q10 = "EQ10 - Asked to give up personal goals by pastor",
  Q11 = "EQ11 - Disagree w/pastor portrayed as evil",
  Q16 = "EQ16 - Church/community abandoning me in difficult time",
  Q17 = "EQ17 - Treated as less than b/c my sexual orientation",
  Q18 = "EQ18 - Church/pastor discourage critical thinking",
  Q19 = "EQ19 - Behavior excessively monitored by pastor/group",
  Q20 = "EQ20 - Members pressured to give money despite financial hardship",
  Q21 = "EQ21 - Taught I would risk Hell if left my church/group",
  Q22 = "EQ22 - Expected to follow pastor/leader rules re: dating/marriage/sex",
  Q23 = "EQ23 - Prayer replacing needed medical interventions",
  Q24 = "EQ24 - Expected to consult pastor/leader before making non-religious decisions",
  Q25 = "EQ25 - Feeling unable to raise questions and issues",
  Q26 = "EQ26 - Pressured to forgive abuser while abuse was ongoing",
  Q27 = "EQ27 - Denied opportunities to serve b/c of my gender",
  Q28 = "EQ28 - Leadershi/group protecting abusive individuals",
  Q29 = "EQ29 - Feeling special when in pastor’s good graces; otherwise ignored",
  Q30 = "EQ30 - Deterred from seeking mental health treatment/counseling/medication",
  Q31 = "EQ31 - Shunned/ignored by pastor/church/group",
  Q32 = "EQ32 - Feeling unable to express unhappiness",
  Q34 = "EQ34 - Scripture used to justify physical punishment/severe discipline",
  Q35 = "EQ35 - Taught to distrust my emotions",
  Q36 = "EQ36 - Mental/physical problems interpreted as spiritual/moral weakness",
  Q37 = "EQ37 - Made to feel less spiritually mature than pastor/leadership",
  Q38 = "EQ38 - Unrealistic demands placed on my moral/religious behavior",
  Q39 = "EQ39 - Made to feel shame over natural sexual desires (not actions)",
  Q40 = "EQ40 - Threatening Divine punishment to keep group members in line",
  Q41 = "EQ41 - Denied opportunities to serve because of my sexual orientation",
  Q42 = "EQ42 - Seeing others shamed/shunned by pastor/leader/group",
  Q43 = "EQ43 - Shamed by pastor/group for poor spiritual/moral performance",
  Q44 = "EQ44 - Love/acceptance offered only for high spiritual/moral performance",
  Q45 = "EQ45 - Developmentally-inappropriate/anxious Hell/Satan/demons taught to young children",
  Q46 = "EQ46 - Treated as less than because of my skin color",
  Q47 = "EQ47 - Medical care being postponed/withheld for religious reasons",
  Q49 = "EQ49 - Leadership/group protecting and elevating abusive individuals",
  Q50 = "EQ50 - Treated as less than because of my gender",
  Q51 = "EQ51 - Extreme pressure to be pastor/missionary/spiritual leader",
  Q52 = "EQ52 - Blamed for harm I suffered rather than blaming who harmed me",
  Q53 = "EQ53 - Scripture used to justify abusive parent-child behavior",
  Q54 = "EQ54 - Being explicitly taught to distrust my intuitions",
  Q55 = "EQ55 - Hearing cultural references in sermons unfamiliar to my race/eth. subculture",
  Q56 = "EQ56 - Being made to feel I was crazy/weird for doubts/questions",
  Q57 = "EQ57 - Developing mental/physical ailments from conforming to group/leader’s expectation",
  Q58 = "EQ58 - Terror/horror used to motivate religious decisions",
  Q59 = "EQ59 - Pastor/group blame victim for their abuse",
  Q60 = "EQ60 - Encouraged by leader to stay in abusive marriage",
  Q61 = "EQ61 - Developmentally-inappropriate/anxious end times taught to young children",
  Q62 = "EQ62 - Scripture used to justify physical violence",
  Q63 = "EQ63 - Shamed by pastor/group for raising questions or concerns",
  Q64 = "EQ64 - Witnessing women pressured to stay in unfaithful/abusive marriages",
  Q65 = "EQ65 - Cut off/shunned by more religious family members",
  Q66 = "EQ66 - Others treated as less than due to their sexual orientation",

  # VARIABLE LABELS: INTERNAL STATES ITEMS
  Q68 = "IQ68 - Anxiety attacks triggered by religious stimuli",
  Q69 = "IQ69 - Lack of spiritual direction/purpose",
  Q70 = "IQ70 - Feeling betrayed by God",
  Q71 = "IQ71 - Avoiding religious activities/settings to reduce distressing feelings",
  Q72 = "IQ72 - Feeling as if God harmed me directly",
  Q73 = "IQ73 - Self-hatred or self-loathing",
  Q74 = "IQ74 - Sadness over the loss of my faith/religious community",
  Q76 = "IQ76 - Feeling I wasted years of my life in a church/set of beliefs",
  Q77 = "IQ77 - Anger upon reflecting on negative religious experiences",
  Q78 = "IQ78 - A lack of self-worth",
  Q79 = "IQ79 - Distrust of God",
  Q80 = "IQ80 - Feeling isolated",
  Q81 = "IQ81 - Nightmares about my negative religious experiences",
  Q82 = "IQ82 - Having trouble navigating life outside my church/community")


# MODEL SPECIFICATION/ESTIMATION
model.pcm <- 'SPIRITUAL ABUSE = 1-66'
results.pcm <- mirt(data=items, model=model.pcm, itemtype="Rasch", verbose=FALSE)
coef.pcm <- coef(results.pcm, IRTpars=TRUE, simplify=TRUE)
items.pcm <- as.data.frame(coef.pcm$items)
items.pcm$deltab1b2 <- items.pcm$b2 - items.pcm$b1
items.pcm$deltab2b3 <- items.pcm$b3 - items.pcm$b2
items.pcm$deltab3b4 <- items.pcm$b4 - items.pcm$b3
items.pcm
print(results.pcm)
print(round(items.pcm),2)
knitr::kable(round(items.pcm,2), caption = "Partial Credit Model (PCM) - Item Parameters")

do <- as.data.frame(items.pcm) # save item parameters as data frame
rv <- subset(do, deltab1b2 < 0 | deltab2b3 < 0 | deltab3b4 <0) # subset the item fit data to find the misfitting items
print(rv,2)
knitr::kable(rv, "simple", digits = 2)



# PCM ITEM PLOTS
itemplot(results.pcm, 1, type='infotrace')
# use the directlabels package to put labels on tracelines
library(directlabels)
plt <- itemplot(results.pcm, 3)
direct.label(plt, 'top.points')
plt1 <- plot(results.pcm, type = 'trace', which.items = 1,
     main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
     auto.key=list(points=FALSE,lines=TRUE, columns=4)) # option curves
direct.label(plt, 'top.points')

plt2 <- plot(results.pcm, type = 'trace', which.items = 2,
             main = "", par.settings = simpleTheme(lty=1:4,lwd=2),
             auto.key=list(points=FALSE,lines=TRUE, columns=4)) # option curves
direct.label(plt, 'top.points')


# ITEM FIT
itemfit(results.pcm, na.rm = TRUE, 'infit') # item fit function
i <- as.data.frame(itemfit(results.pcm, na.rm = TRUE, 'infit')) # save item fit stats as data frame
misfits <- subset(i, outfit > 1.5 | outfit < 0.5 | infit > 1.5 | infit < 0.5) # subset the item fit data to find the misfitting items
misfits

ifit <- mirt::itemfit(results.pcm, 'infit')
# i <- as.data.frame(itemfit(results.pcm, 'infit'))
i <- as.data.frame(ifit)
misfits <- subset(i, outfit > 1.5 | outfit < 0.5 | infit > 1.5 | infit < 0.5)

knitr::kable(misfits, digits = 2, "simple", caption = 'Partial Credit Model (PCM) - Misfitting Items', row.names = FALSE)






# PCM MODEL FIT
itemplot(results.pcm, 1, type = 'score')
empirical_plot(items, c(1,2,3,4), main = 'Empirical Plots') # multiple items
empirical_plot(items, 1, main = 'Empirical Plots') # one item
pcmfit <- as.data.frame(itemfit(results.pcm, na.rm=TRUE))
print(pcmfit, caption = 'Partial Credit Model (PCM) - Item Fit Statistics')
knitr::kable(pcmfit, caption = 'Partial Credit Model (PCM) - Item Fit Statistics')
itemfit(results.pcm, empirical.plot=1)
itemfit(results.pcm, 'infit', na.rm=TRUE)

results.pcm

