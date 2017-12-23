
library(shiny)
library(ggplot2)
library(shinyjs)

shinyServer(function(input, output, session) {
  
  #values <- reactiveValues(DAT = NULL)
  
  data_file <- eventReactive(input$file, {
    
    read.csv(input$file$datapath)
    
  })

  observeEvent(input$file, {
    
   output$contents <- renderDataTable(data_file())
   
   show("contents")
  
   updateCheckboxGroupInput(session, "variables", choices = colnames(data_file()))
  
  })
  
  observeEvent(input$plot, {
    
    output$linearPlot <- renderPlot({
      
      ggplot(data = data_file(), aes(x = data_file()[,1], y = data_file()[,2])) + geom_point(color = "black") + 
      geom_smooth(method = "lm")
      
    })
  })
  
  observeEvent(input$resetlinear, {
    
    output$linearPlot <- renderPlot({NA
    
    })
  })
})