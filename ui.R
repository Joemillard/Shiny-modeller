
library(shiny)
library(shinyjs)
library(ggplot2)

shinyUI(fluidPage(
  useShinyjs(),
  div(
    id = "form",
  
  # Application title
  
  titlePanel("R Shiny modelling platform"),
  navbarPage("Menu", 
    tabPanel("Introduction",
        sidebarPanel()),
    tabPanel("Linear regression",
  
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
        )))
      )
    )
  )
)
