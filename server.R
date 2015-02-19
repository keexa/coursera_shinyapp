library(shiny)
n <- 8
shinyServer(
  function(input, output) { 
    vect <- reactive({
      vect <- c()
      
      for (i in 1:n) {
        vect[i] <- input[[paste("n", i, sep="")]]
      }
      vect
    })
    
    dataLabel <- reactive({
      switch(input$select,
             "1" = "Mean",
             "2" = "Variance",
             "3" = "Standard deviation",
             "4" = "Max",
             "5" = "Min")
    })
    dataValue <- reactive({
      switch(input$select,
             "1" = mean(vect()),
             "2" = var(vect()),
             "3" = sd(vect()),
             "4" = max(vect()),
             "5" = min(vect()))
    })
    
    lapply(1:n, function(i) {
      output[[paste0('n', i)]] <- renderUI({
        numericInput(inputId=paste("n", i, sep=""),
                     value = 0,
                     label = paste("N. ", i, sep=""))      })
    })
    
    output$select_label <- renderText(dataLabel())
    output$value <- renderText(dataValue())
    output$plot <- renderPlot({
      input$goButton
      isolate({
        if (input$goButton >0) {
          barplot(vect(), xlab="Number", ylab="Value")
          title("Barplot of your numbers")
        }
      })
    })
  }
)