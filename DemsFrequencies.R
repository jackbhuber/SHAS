# FREQUENCIES OF DEMOGRAPHICS

# Load packages
library(epiDisplay)
library(kableExtra)

# Load data
dems.itms <- read.csv("data/dems.itms.csv")

# Gender
gender <- as.data.frame(tab1(dems.itms$Gender, sort.group = "decreasing", cum.percent = TRUE))
gender2 <- gender[,-c(1,4,5,6)]
names(gender2) <- c("N","%")
rownames(gender2) <- c("Cisgender Female","Cisgender Male","NA","Other","Prefer not to say","Transgender Female","Transgender Male","Total")
# gender2 %>%
#   kbl() %>%
#   kable_styling()

# Sexual Orientation
SO <- as.data.frame(tab1(dems.itms$Sexual.orientation, sort.group = "decreasing", cum.percent = TRUE))
SO2 <- SO[,-c(1,4,5,6)]
names(SO2) <- c("N","%")
rownames(SO2) <- c("Straight","Bisexual","NA","Gay/Lesbian","Queer","Don't know","Asexual","Total")
# SO2 %>%
#   kbl() %>%
#   kable_styling()

# Race
Race <- as.data.frame(tab1(dems.itms$Race, sort.group = "decreasing", cum.percent = TRUE))
Race2 <- Race[,-c(1,4,5,6)]
names(Race2) <- c("N","%")
rownames(Race2) <- c("White/European American","NA","Other","Ethnically of Hispanic/Latino Origin",
                     "Black/African American",
                     "Asian",
                     "American Indian/Alaska Native",
                     "Native Hawaiian/Pacific Islander",
                     "Total")
# Race2 %>%
#   kbl() %>%
#   kable_styling()

# Generation
Gen <- as.data.frame(tab1(dems.itms$Generation, sort.group = "decreasing", cum.percent = TRUE))
Gen2 <- Gen[,-c(1,4,5,6)]
names(Gen2) <- c("N","%")
Gen2
rownames(Gen2) <- c(
  X1 = "Gen Z (Ages 16-23)",
  X2 = "Millennial (Ages 24-39)",
  X3 = "Gen X (Ages 40-55)",
  X4 = "Boomers (Ages 56-74)",
  X5 = "WWII (Ages 75-88)",
  NA. = "NA",
  X..Total = "Total")
# Gen2 %>%
#   kbl() %>%
#   kable_styling(bootstrap_options = "condensed")

# Most abusive denomination
Den <- as.data.frame(tab1(dems.itms$Denomination.of.most.abuse, sort.group = "decreasing", cum.percent = TRUE))
Den2 <- Den[,-c(1,4,5,6)]
names(Den2) <- c("N","%")
rownames(Den2) <- c(
  Non.denominational = "Non-denominational",
  Baptist = "Baptist",
  Charismatic.Pentecostal = "Charismatic/Pentecostal",
  Mainline = "Mainline",
  Christian.other.than.above = "Christian other than above",
  NA. = "NA",
  Mormon = "Mormon",
  Christian.school.or.university = "Christian school or university",
  Catholic = "Catholic",
  Evangelistic.Missions.organization = "Evangelistic missions organization",
  College.Christian.organization = "College Christian organization",
  Christian.group.other.than.the.above = "Christian group other than the above",
  Local.Bible.study.or.small.group = "Local Bible study or small group",
  Christian.Youth.Organization = "Christian youth organization",
  Orthodox.Christian = "Orthodox Christian",
  Christian.media.company = "Christian media company",
  Christian.political.activist.group = "Christian political activist group",
  X..Total = "Total"
)
# Den2 %>%
#   kbl() %>%
#   kable_styling(bootstrap_options = "condensed")

big.table <- rbind (gender2, SO2, Race2, Gen2)
big.table %>%
  kbl() %>%
  kable_styling(bootstrap_options = "condensed")




library(gmodels)
CrossTable(dems$Age, dems$Generation)