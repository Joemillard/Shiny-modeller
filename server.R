
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
   
   updateSelectInput(session, "x_variables", choices = colnames(data_file()))
   
   updateSelectInput(session, "y_variables", choices = colnames(data_file()))
  
  })
  
  observeEvent(input$variables, {
    
    output$contents <- renderDataTable(data_file()[,input$variables])
    
  })
  
  observeEvent(input$plot, {
    
    output$linearPlot <- renderPlot({
      
      ggplot(data = data_file(), aes(x = data_file()[,input$x_variables], y = data_file()[,input$y_variables])) + 
      geom_point(color = "black") + 
      labs(x = input$x_variables, y = input$y_variables) +
      geom_smooth(method = "lm")
      
    })
  })
  
  observeEvent(input$resetlinear, {
    
    output$linearPlot <- renderPlot({NA})
    
    updateCheckboxGroupInput(session, "plot_variables", choices = NA)
    
  })
})