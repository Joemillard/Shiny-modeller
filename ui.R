
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
            checkboxGroupInput("variables", "Select columns", inline = FALSE),
            br()
          ),
          mainPanel(
            dataTableOutput("contents")
          )
        )
      ),
    
      # explore data tab
      tabPanel("Explore data"),
    
      # linear regression tab
      tabPanel("Linear regression",
        sidebarLayout(
          sidebarPanel(
            selectInput("x_variables", "X variable", ""),
            selectInput("y_variables", "Y variable", ""),
            br(),
            br(),
            actionButton("plot", "Plot"),
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
