
library(shiny)
library(shinyjs)
library(ggplot2)

shinyUI(fluidPage(
  useShinyjs(),
  div(
    id = "form",
  
  # Application title
  titlePanel("R Shiny modelling platform"),
  
  # nav bar
  navbarPage("Menu", 
    
    # introduction tab
    tabPanel("Introduction",
      sidebarLayout(
        sidebarPanel(),
        mainPanel()
        )
      ),
    
    # data viewer tab
    tabPanel("Data viewer",
      sidebarLayout(
        sidebarPanel(
          fileInput("file", "Upload file"),
          br(),
          br()
        ),
        mainPanel(
          tableOutput("contents")
        )
      )
    ),
    
    tabPanel("Explore data"),
    
    # linear regression tab
    tabPanel("Linear regression",
      sidebarLayout(
        sidebarPanel(
          actionButton("plot", "Plot"),
          br(),
          br(),
          actionButton("resetlinear", strong("Reset plot"))
        ),
    
    # plot linear regression
        mainPanel(
          plotOutput("linearPlot")
        )))
      )
    )
  )
)
