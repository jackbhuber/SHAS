# DIF ANALYSES

# Prep data
all <- read.csv("data/all.csv") # get whole data set
dif <- all[,-1] # remove first column
dif <- dif[,-c(5,15,28,33,41,46)] # remove these bad items
dif$gender <- dif$Q85 - 1
dif[,1:60] <- dif[,1:60] - 1


# rm(list=ls())

resp.data <- dif[,c(1:60)]
gender <- dif$gender


library(lordif)
Gender.DIF <- lordif(resp.data,group = gender)
print(Gender.DIF)



# Facets analysis
# To conduct a DIF analysis, we set up the variable "gender" as a facet and
# re-run the IRT analysis.
formulaA <- ~item+gender+item*gender # define facets analysis
facets <- as.data.frame(gender) # data frame with student covariates
# facets model for studying differential item functioning
mod2 <- TAM::tam.mml.mfr( resp=scored[,items], facets=facets, formulaA=formulaA )
summary(mod2)
## End(Not run)


### DIF analysis

# Create subgroup classifications:
subgroups <- rep(c(1,2), nrow(pcmdat2)/2)

# Calculate subgroup-specific item difficulty values (#select/highlight code starting here):

#- First, get overall item difficulties specific to each subgroup:

group1_item.diffs.overall <- NULL
group2_item.diffs.overall <- NULL

responses <- pcmdat2 # update this if needed with the responses object
model.results <- PC_model # update this if needed with the model results object

responses.g <- cbind.data.frame(subgroups, responses)
responses.g1 <- subset(responses.g, responses.g$subgroups == 1)
responses.g2 <- subset(responses.g, responses.g$subgroups == 2)

## Compare thresholds between groups:
subgroup_diffs <- Waldtest(PC_model, splitcr = subgroups)

for(item.number in 1:ncol(responses)){
  n.thresholds.g1 <-  length(table(responses.g1[, item.number+1]))-1
  group1_item.diffs.overall[item.number] <- mean(subgroup_diffs$betapar1[((item.number*(n.thresholds.g1))-(n.thresholds.g1-1)): 
                                                                           (item.number*(n.thresholds.g1))])*-1
  n.thresholds.g2 <-  length(table(responses.g2[, item.number+1]))-1
  group2_item.diffs.overall[item.number] <- mean(subgroup_diffs$betapar2[((item.number*(n.thresholds.g2))-(n.thresholds.g2-1)): 
                                                                           (item.number*(n.thresholds.g2))])*-1
}
group1_item.diffs.overall


## Get overall item SE values:

#- First, get overall SEs specific to each subgroup:

group1_item.se.overall <- NULL
group2_item.se.overall <- NULL

responses <- pcmdat2 # update this if needed with the responses object
model.results <- PC_model # update this if needed with the model results object

responses.g <- cbind.data.frame(subgroups, responses)
responses.g1 <- subset(responses.g, responses.g$subgroups == 1)
responses.g2 <- subset(responses.g, responses.g$subgroups == 2)

subgroup_diffs <- Waldtest(PC_model, splitcr = subgroups)

for(item.number in 1:ncol(responses)){
  n.thresholds.g1 <-  length(table(responses.g1[, item.number+1]))-1
  group1_item.se.overall[item.number] <- mean(subgroup_diffs$se.beta1[((item.number*(n.thresholds.g1))-(n.thresholds.g1-1)): 
                                                                        (item.number*(n.thresholds.g1))])
  n.thresholds.g2 <-  length(table(responses.g2[, item.number+1]))-1
  group2_item.se.overall[item.number] <- mean(subgroup_diffs$se.beta2[((item.number*(n.thresholds.g2))-(n.thresholds.g2-1)): 
                                                                        (item.number*(n.thresholds.g2))])
}
group1_item.se.overall