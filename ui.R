
library(shiny)
library(shinyjs)
library(ggplot2)

shinyUI(fluidPage(
  useShinyjs(),
  div(
    id = "form",
  
  # Application title
  titlePanel("Linear model plotter"),
  
  # Sidebar 
  sidebarLayout(
    sidebarPanel(
      fileInput("file","Upload file"),
      actionButton("plot","Plot"),
      br(),
      br(),
      tableOutput("contents"),
      actionButton("resetAll", strong("Reset"))
    ),
    
    # Show a plot
    mainPanel(
       plotOutput("distPlot")
    )
  )
)))
