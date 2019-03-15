#Title: Make shots data script
#Description: Aggregating data to create a csv containing all relevent data. 
#Inputs: The data sets of nba players
#Outputs: Aggregated csv file
classes =  c("character","character","real","real","real","real","character","character","character","real","character","real","real")
curry = read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE, sep=",", colClasses =classes)
thompson = read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE, sep=",", colClasses =classes)
durant = read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE, sep=",", colClasses =classes)
green = read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE, sep=",", colClasses =classes)
iguodala = read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE, sep=",", colClasses =classes)

curry$name = "Stephen Curry"
thompson$name = "Klay Thompson"
durant$name = "Kevin Durant"
green$name = "Draymond Green"
iguodala$name = "Andre Iguodala"

curry[curry$shot_made_flag =="y",]$shot_made_flag = "shot_yes"
curry[curry$shot_made_flag =="n",]$shot_made_flag = "shot_no"
thompson[thompson$shot_made_flag =="y",]$shot_made_flag = "shot_yes"
thompson[thompson$shot_made_flag =="n",]$shot_made_flag = "shot_no"
durant[durant$shot_made_flag =="y",]$shot_made_flag = "shot_yes"
durant[durant$shot_made_flag =="n",]$shot_made_flag = "shot_no"
green[green$shot_made_flag =="y",]$shot_made_flag = "shot_yes"
green[green$shot_made_flag =="n",]$shot_made_flag = "shot_no"
iguodala[iguodala$shot_made_flag =="y",]$shot_made_flag = "shot_yes"
iguodala[iguodala$shot_made_flag =="n",]$shot_made_flag = "shot_no"

curry$minute = (curry$period-1)*12+(12-curry$minutes_remaining)
thompson$minute = (thompson$period-1)*12+(12-thompson$minutes_remaining)
durant$minute = (durant$period-1)*12+(12-durant$minutes_remaining)
green$minute = (green$period-1)*12+(12-green$minutes_remaining)
iguodala$minute = (iguodala$period-1)*12+(12-iguodala$minutes_remaining)

sink(file="../output/stephen-curry-summary.txt", append = FALSE)
summary(curry)
sink()
sink(file="../output/klay-thompson-summary.txt", append = FALSE)
summary(thompson)
sink()
sink(file="../output/kevin-durant-summary.txt", append = FALSE)
summary(durant)
sink()
sink(file="../output/kdraymond-green-summary.txt", append = FALSE)
summary(green)
sink()
sink(file="../output/andre-iguadala-summary.txt", append = FALSE)
summary(iguodala)
sink()

shotsdata = rbind(curry,thompson,durant,green,iguodala)
write.csv(x=shotsdata, file = "../data/shots-data.csv",row.names = F)

sink(file="../output/shots-data-summary.txt",append = F)
summary(shotsdata)
sink()
