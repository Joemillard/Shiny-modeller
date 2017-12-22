
library(shiny)
library(ggplot2)
library(shinyjs)

shinyServer(function(input, output) {
  
  values <- reactiveValues(DAT = NULL)
  
  observeEvent(input$file, {
    
    values$DAT <- read.csv(input$file$datapath)
    
    #show("variables")
    
    show("contents")
    
    output$contents <- renderTable(values$DAT)
    
  })
  
  observeEvent(input$plot, {
    
    # show('linearplot')
    
    output$linearPlot <- renderPlot({
      
      ggplot(data = values$DAT, aes(x = values$DAT[,1], y = values$DAT[,2])) + geom_point(color = "black") + 
      geom_smooth(method = "lm")
      
    })
  })
  
  observeEvent(input$resetlinear, {
    
    output$linearPlot <- renderPlot({NA
    
    })
  })
})