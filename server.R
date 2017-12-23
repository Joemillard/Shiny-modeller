
library(shiny)
library(ggplot2)
library(shinyjs)

shinyServer(function(input, output) {
  
  values <- reactiveValues(DAT = NULL)
  
  data <- eventReactive(input$file, {
    
    read.csv(input$file$datapath)
    
  })
  
  
  observeEvent(input$file, {
    
   output$contents <- renderDataTable(data())
   
   show("contents")
  
  })
  
  
  observeEvent(input$plot, {
    
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