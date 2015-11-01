library(shiny)
library(ggplot2)
source('P:\\School\\Data Science Hackathon\\shiny attempt\\dataInput.R')

shinyServer(function(input, output) {
  
  observe({
  
    
    datasetInput <- reactive({
      
      mapData[which(mapData$dayFlag == as.numeric(input$dow)
                    & mapData$timeFlag == as.numeric(input$tod)),]})
    
    output$plot <- renderPlot({
    
  
    nyc <- get_map(location = 'nyc', zoom = 12)
    
    p <- ggmap(nyc) + geom_point(data=datasetInput(),aes(x=lon,y=lat,colour=as.factor(sat),size = size))  +theme(axis.title.y = element_blank(), axis.title.x = element_blank())+scale_colour_brewer(palette="Set1")
    
    
          grid()
          print(p)
          
        })
    
#     datasetInputWC <- reactive({
#       path <- system.file("xkcd", package = "RXKCD")
#       datafiles <- list.files(path)
#       xkcd.df <- read.csv(file.path(path, datafiles))
#        
#       # temp <- 
#       xkcd.corpus <- Corpus(DataframeSource(data.frame(inputd[which(inputd$dayFlag == as.numeric(input$dow)  & inputd$timeFlag == as.numeric(input$tod)),19])))
#       xkcd.corpus <- tm_map(xkcd.corpus, removePunctuation)
#       xkcd.corpus <- tm_map(xkcd.corpus, content_transformer(tolower))
#       xkcd.corpus <- tm_map(xkcd.corpus, function(x) removeWords(x, stopwords("english")))
#       tdm <- TermDocumentMatrix(x = xkcd.corpus)
#       m <- as.matrix(tdm)
#       v <- sort(rowSums(m),decreasing=TRUE)
#       data.frame(word = names(v),freq=v)
#       })
#     
#     output$wordcloud <- renderPlot({
#       
#       pal <- brewer.pal(8, "Dark2")
#       pal <- pal[-(1:2)]
#       
#       wordcloud(datasetInputWC(), scale=c(8,.3),min.freq=2,max.words=100, random.order=T, rot.per=.35, colors=pal)
#       
#       })
#        

  })
})
  
