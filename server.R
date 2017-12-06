
library(shiny)
library(ggplot2)
library(shinyjs)

shinyServer(function(input, output) {
   
  values <- reactiveValues(DAT = NULL)
  
  observeEvent(input$file, {
    
    values$DAT <- read.csv(input$file$datapath)
    
    show("contents")
    
    output$contents <- renderTable(values$DAT)
    
  })
  
  
  observeEvent(input$plot, {
    
    #show("distplot")
    
    output$distPlot <- renderPlot({
    
      ggplot(data = values$DAT, aes(x = x, y = y)) + 
        geom_point(color = 'black') +
        geom_smooth(method = "lm")
    
    })
    
  })
  
  observeEvent(input$resetAll, {
    
    reset("form")
    
    values$DAT <- data.frame()
    
    hide("contents")
    
    #hide("distplot")
    
    })
  
})
