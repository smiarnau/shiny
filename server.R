
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

diabetesRisk<-function(glucose, gen){
    if (gen == 'm')
        glucose / 100
    else
        glucose / 200
}

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    x <- runif(1000, 1, 100)

    # draw the histogram with the specified number of bins
    hist(x, breaks = 20, col = 'darkgray', border = 'white', main="Diabetes population in Old Town by age")

  })
  
  output$inputValue <- renderPrint({input$glucose})
  output$prediction <- renderPrint({diabetesRisk(input$glucose, input$gender)})

})
