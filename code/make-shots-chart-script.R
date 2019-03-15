#Title: Make shots chart script 
#Description: Aggregating data to plot shots on a digital court
#Inputs: The data sets of nba players
#Outputs: Charts

library(grImport)
library(jpeg)
library(ggplot2)

###4.1
classes =  c("character","character","real","real","real","real","character","character","character","real","character","real","real","character","real")
shotsdata = read.csv("../data/shots-data.csv", stringsAsFactors = FALSE, sep=",", colClasses =classes)

#Kevin Durant
durant = shotsdata[shotsdata$name=="Kevin Durant",]
courtfile = "../images/nba-court.jpg"

courtimage = rasterGrob(
  readJPEG(courtfile),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)
durant_shot_chart = ggplot(data=durant)+
  annotation_custom(courtimage,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Kevin Durant')+
  theme_minimal() 

ggsave("../images/durant_shot_chart.pdf",width = 6.5, height = 5)

#Stephen Curry
curry = shotsdata[shotsdata$name=="Stephen Curry",]
courtfile = "../images/nba-court.jpg"

courtimage = rasterGrob(
  readJPEG(courtfile),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)
curry_shot_chart = ggplot(data=curry)+
  annotation_custom(courtimage,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry')+
  theme_minimal() 

ggsave("../images/curry_shot_chart.pdf",width = 6.5, height = 5)

#Draymond Green
green = shotsdata[shotsdata$name=="Draymond Green",]
courtfile = "../images/nba-court.jpg"

courtimage = rasterGrob(
  readJPEG(courtfile),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)
green_shot_chart = ggplot(data=green)+
  annotation_custom(courtimage,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Draymond Green')+
  theme_minimal() 

ggsave("../images/green_shot_chart.pdf",width = 6.5, height = 5)

#Klay Thompson
thompson = shotsdata[shotsdata$name=="Klay Thompson",]
courtfile = "../images/nba-court.jpg"

courtimage = rasterGrob(
  readJPEG(courtfile),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)
thompson_shot_chart = ggplot(data=thompson)+
  annotation_custom(courtimage,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Klay Thompson')+
  theme_minimal() 

ggsave("../images/thompson_shot_chart.pdf",width = 6.5, height = 5)

#Andre Iguodala
iguodala = shotsdata[shotsdata$name=="Andre Iguodala",]
courtfile = "../images/nba-court.jpg"

courtimage = rasterGrob(
  readJPEG(courtfile),
  width = unit(1,"npc"),
  height = unit(1,"npc")
)
iguodala_shot_chart = ggplot(data=iguodala)+
  annotation_custom(courtimage,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Andre Iguodala')+
  theme_minimal() 

ggsave("../images/iguodala_shot_chart.pdf",width = 6.5, height = 5)

###4.2

shot_chart = ggplot(data=shotsdata)+
  annotation_custom(courtimage,-250,250,-50,420)+
  geom_point(aes(x=x,y=y,color=shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart')+
  theme_minimal()+
  facet_grid(~name)
ggsave("../images/gsw-shot_chart.pdf",width = 8, height = 7)
ggsave("../images/gsw-shot_chart.png",width = 8, height = 7)

