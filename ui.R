library(shiny)
n <- 8

shinyUI(pageWithSidebar(
  headerPanel("Some statistics on a set of numbers"),
  sidebarPanel(
    conditionalPanel(condition="input.conditionedPanels==1",

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
    )
  ),
  mainPanel(
    tabsetPanel(id="conditionedPanels",
      tabPanel("Display results", value=1,
               h3("Calculating"),
               textOutput("select_label"),
               verbatimTextOutput("value"),
               
               plotOutput("plot")
               
      ),
      tabPanel("Documentation",
               h1("Welcome to my project!"),
               p("Here is my personal project for the Coursera course \"Developing data products\""),
               p("It is quite simple and it should work without problems"),
               
               h3("Instructions"),
               p("Here are the instructions to play with my project, just follow them:"),
               br(),
               p("1 - Insert 8 numbers in the fields provided"),
               p("2 - Choose the type of statistics you want to produce in the combo box at the top of the sidebar"),
               p("3 - See the results!"),
               br(),
               p("The results are automatically updated and calculated using R functions."),
               p("You also have the possibility of displaying a simple barplot and update it whenever you want, just press the \"Update plot\" button"),
               
               h3("A short description of my work"),
               p("I have tried to play with the following widgets and features: numericInput, selectInput, button, images, tabPanels, conditionalPanels"),
               p("I also tried to make the UI dynamically allocated (depending on the variable n set in the code it is easy to change the number of input fields)"),
               p("I have used some reactive functions to create the vector of numbers inserted in the fields and to produce some \"switch\" condition in the code in a more flexible and nice way
                 ")
               )
    )
  )
))
