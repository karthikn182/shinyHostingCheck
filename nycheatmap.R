rm(list=ls())
setwd('P:\\School\\Data Science Hackathon\\shiny attempt')
input <- read.csv('partOne.csv',header = T,stringsAsFactors = F)

library(ggmap)
library(ggplot2)

nyc <- get_map(location = 'nyc', zoom = 12)

colnames(input)[17] <- 'lon'
colnames(input)[18] <- 'lat'


mapData <- aggregate(score~lon+lat,data = input,sum)
names(mapData) <- c('lon', 'lat', 'score')
# mapData <- subset(mapData, score > 0)

mapData$sat <- ifelse(mapData$score < 0,"Negative",ifelse(mapData$score > 0,"Positive","Neutral"))
mapData$size <- ifelse(mapData$score < 0,15,ifelse(mapData$score > 0,10,5)) 


ggmap(nyc) + geom_point(data=mapData,aes(x=lon,y=lat,colour=as.factor(sat),size = size))  +theme(axis.title.y = element_blank(), axis.title.x = element_blank())

