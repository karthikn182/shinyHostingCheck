rm(list=ls())
library(ggmap)
library(ggplot2)

setwd('P:\\School\\Data Science Hackathon\\shiny attempt')

# Reading data for base US map
inputd <- read.csv('partOne.csv',stringsAsFactors = F,header = T)
inputd$timeHour <- substr(inputd$time,0,2)
inputd$timeHour <- as.integer(inputd$timeHour)
inputd$timeFlag <- ifelse(inputd$timeHour<=8,"1",
                        ifelse(inputd$timeHour > 8 & inputd$timeHour <= 12, "2",
                               ifelse(inputd$timeHour > 12 & inputd$timeHour <= 16, "3",
                                      ifelse(inputd$timeHour > 16 & inputd$timeHour <= 20,"4",
                                             ifelse(inputd$timeHour > 20,"5" ,"kdjd")))))

inputd$dayFlag <- ifelse(inputd$date == "2015-09-30",1,
                       ifelse(inputd$date == "2015-10-01",2,
                              ifelse(inputd$date == "2015-10-02",3,
                                     ifelse(inputd$date == "2015-10-03",4,5))))
                                            

colnames(inputd)[17] <- 'lon'
colnames(inputd)[18] <- 'lat'

mapData <- aggregate(score~lon+lat+dayFlag+timeFlag,data = inputd,sum)
names(mapData) <- c('lon', 'lat','dayFlag','timeFlag','score')
mapData$dayFlag <- as.integer(mapData$dayFlag)
mapData$timeFlag <- as.integer(mapData$timeFlag)

# mapData <- subset(mapData, score > 0)

mapData$sat <- ifelse(mapData$score < 0,"Negative",ifelse(mapData$score > 0,"Positive","Neutral"))
mapData$size <- ifelse(mapData$score < 0,150,ifelse(mapData$score > 0,150,50))

# word cloud
# d <- read.csv('cloud.csv',header = T,stringsAsFactors = F)
