library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  
  tags$head(
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      
      #myDiv {
        width:700px;
        font-family: 'copperplatw';
        font-weight: 500;
        line-height: 1.1;
        background-color: '#FF0000';
        }

    "))
  ),
   
  # Application title
    titlePanel((
    
      tags$em("NYC Happiness Index Map",style="position:relative; left:250px; top:10px;
              font-size: 25px") 
      
      # tags$i(tags$h6("Aplha Version",style="position:relative; left:710px;top:-32px"))
      )
      
       ,windowTitle = 'Happiness Index'
                ),
    sidebarLayout(position = 'right',
    sidebarPanel(width = 3,
                
                 
                 h4("Please select "),
    
                
                sliderInput("dow", "Choose a Day (09/30 - 10/04)", min = 1, 
                            max = 5, value = 1)
                ,
                sliderInput("tod", "Choose Time of Day:", 1, 5, 4,
                            step = 1, animate=animationOptions(interval = 4500))
                 
                
  ),
   
   mainPanel( 
  plotOutput("plot",height = "750px",width = "100%")
  , 
  plotOutput("wordcloud",height = "450px",width = "100%")
             ))
     
))
  