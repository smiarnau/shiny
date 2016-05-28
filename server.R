
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

diabetesRisk<-function(glucose, gen, age){
    if (gen == 'm')
       gl <-  glucose / 200
    else
       gl <-  glucose / 300
    
     gl + age*gl/100
}

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate random data to draw the instagram
    x <- runif(1000, 1, 100)

    # draw the histogram with the previous data
    hist(x, breaks = 20, col = 'darkgray', border = 'white', main="Diabetes population in Old Town by age")

  })
  
  output$inputValue <- renderPrint({input$glucose}); renderPrint({input$age}) 
  output$prediction <- renderPrint({diabetesRisk(input$glucose, input$gender, input$age)})

})
