#title: 3) Data Preparation
#description: Organizing the raw data for analysis
#input(s): The inputs required by the script are the raw data CSV files. One CSV file is avaliable for each player 
#output(s): The outputs created when running the script are the summaries of each player, summay of all five player, and a csv file that contains all player data in a table. It is saved in pdf formart and also in png format.

#setwd("/Users/dunia/desktop/workout01/code")
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
klay <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)

iguodala$player <- "Andre iguodala"
green$player <- "Draymond Green"
durant$player <- "Kevin Durant"
thompson$player <- "Klay Thompson"
curry$player <- "Stephen Curry"

head(curry)
curry$shot_made_flag[curry$shot_made_flag=="y"]<-"shot_yes"
curry$shot_made_flag[curry$shot_made_flag=="n"]<-"shot_no"
head(curry)

head(green)
curry$shot_made_flag[green$shot_made_flag=="y"]<-"shot_yes"
curry$shot_made_flag[green$shot_made_flag=="n"]<-"shot_no"
head(green)

head(durant)
durant$shot_made_flag[durant$shot_made_flag=="y"]<-"shot_yes"
durant$shot_made_flag[durant$shot_made_flag=="n"]<-"shot_no"
head(durant)

head(thompson)
thompson$shot_made_flag[thompson$shot_made_flag=="y"]<-"shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag=="n"]<-"shot_no"
head(thompson)

head(iguodala)
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"]<-"shot_yes"
iguodala$shot_made_flag[iguodala$shot_made_flag=="n"]<-"shot_no"
head(iguodala)

curry$minute <-(curry$period -1)*12 + (12-curry$minutes_remaining)
green$minute <-(green$period-1)*12 + (12-green$minutes_remaining)
durant$minute <-(durant$period-1)*12 + (12-durant$minutes_remaining)
thompson$minute <-(thompson$period-1)*12 + (12-thompson$minutes_remaining)
iguodala$minute <-(iguodala$period-1)*12 + (12-iguodala$minutes_remaining)

sink("../output/stephen-curry-summary.txt")
summary(curry)
sink()

sink("../output/graymond-green-summary.txt")
summary(green)
sink()

sink("../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink("../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink("../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

shots_data<- rbind(iguodala, green, durant, thompson, curry)
shots_data

write.csv(shots_data, file = "../data/summary.csv")


sink("../output/shots-data-summary.txt")
summary(shots_data)
sink()
