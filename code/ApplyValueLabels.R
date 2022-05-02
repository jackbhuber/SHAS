# APPLY VALUE LABELS
library(expss)
data = expss::apply_labels(data,
                            data$Gender = c("Cisgender Male"=1, "Cisgender Female"=2, "Transgender Male"=3, "Transgender Female"=4, "Other"=5, "Prefer not to say"=6),
                            data$`Sexual orientation` = c("Straight"=1, "Gay/Lesbian"=2, "Bisexual"=3, "Asexual"=4, "Queer"=5, "Don\'t know"=6),
                            data$Race = c("Ethnically of Hispanic/Latino Origin"=1, "Black/African American"=2, "White/European American"=3, "Asian"=4, "American Indian/Alaska Native"=5, "Native Hawaiian/Pacific Islander"=6, "Other"=7),
                            data$`Raised in Christian home` = c("Yes"=1, "No"=2),
                            data$`Most abusive group` = c("Catholic"=1, "Charismatic/Pentecostal"=2, "Baptist"=3, "Mainline"=4, "Non-denominational"=5, "Orthodox Christian"=6, "Mormon"=7, "Christian other than above"=8, "Evangelistic/Missions organization"=9, "College Christian organization"=10, "Christian Youth Organization"=11, "Christian media company"=12, "Christian school or university"=13, "Christian political/activist group"=14, "Christian aid/social services group"=15, "Local Bible study or small group"=16, "Christian group other than the above"=17),
                            data$`Current religious identification` = c("Protestant"=1, "Catholic"=2, "Mormon"=3, "Orthodox Christian"=4, "Other religious tradition"=5, "Atheist"=6, "Agnostic"=7, "Nothing in particular"=8),
)
