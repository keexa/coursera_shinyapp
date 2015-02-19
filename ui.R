library(shiny)
n <- 8

shinyUI(pageWithSidebar(
  headerPanel("Some statistics on a set of numbers"),
  sidebarPanel(
    selectInput("select",
                label = "Select calculation", 
                choices = list("Mean" = 1,
                               "Variance" = 2,
                               "Standard deviation" = 3,
                               "Max" = 4,
                               "Min" = 5),
                selected = 1),
    
    lapply(1:n, function(i) {
      uiOutput(paste0('n', i))
    }),
    
    actionButton("goButton", "Update plot")
  ),
  mainPanel(
    h3("Calculating"),
    textOutput("select_label"),
    verbatimTextOutput("value"),

    plotOutput("plot")
  )
))
