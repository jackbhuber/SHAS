# RESULTS BY SEXUALITY

data <- read.csv("data/all.csv")
source("code/ApplyItemLabels.R")
source("code/ApplyValueLabels.R")

# PARTIAL CREDIT MODEL
model.pcm <- 'PCM = 1-66'
results.pcm <- mirt(data[,1:66], model=model.pcm, itemtype="Rasch", verbose=FALSE) 

# PARTIAL CREDIT MODEL
model.rsm <- 'RSM = 1-66'
results.rsm <- mirt(data[,1:66], model=model.rsm, itemtype="rsm", verbose=FALSE) 

# ATTACH FACTOR SCORES
pcmscores <- fscores(results.pcm)
rsmscores <- fscores(results.rsm)
data2 <- cbind(data, pcmscores, rsmscores)

# HISTOGRAMS
hist(data2$PCM, breaks=12, col="red")

# SIMPLE SCATTERPLOT
plot(data2$PCM, data2$RSM, main="",
     xlab="RSM", ylab="PCM")

plot(data2$Age, data2$PCM, main="",
     xlab="Age", ylab="PCM")

# SIMPLE BOXPLOT
boxplot(data2$PCM ~ data2$`Sexual orientation`, data=data2, main="",
        xlab="Sexual Orientation", ylab="PCM theta", col = 'red')

boxplot(data2$PCM ~ data2$`Sexual orientation`, data=data2, main="",
        xlab="Sexual Orientation", ylab="PCM theta", col = 'red')

boxplot(data2$PCM ~ data2$`Sexual orientation`, data=data2, main="",
        xlab="Sexual Orientation", ylab="PCM theta", col = 'red')



# One Way Anova (Completely Randomized Design)
fit <- aov(data2$PCM ~ data2$`Sexual orientation`, data=data2)
fit
