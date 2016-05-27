
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Diabetes prediction"),
  
  sidebarPanel(
      #sliderInput("glucoseSlider", "Number of people with diabetes by year ", min = 1950, max = 2015, value = 1990),
      h4("Insert your index of glucose and your gender to calculate your diabetes risk: "),
      numericInput("glucose", "Glucose mg/dl", 90, min=50, max=200, step=5),
      radioButtons("gender", "Indicate your gender", c("Male" = "m", "Female"="f"), selected='m') ,
      
      submitButton("Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h3("Results of prediction"),
      h4("You entered"),
      verbatimTextOutput("inputValue"),
      h4("Which resulted in a prediction of"),
      verbatimTextOutput("prediction"),
      hr(),
      h4("Diabetes population in Old Town"),
      plotOutput("distPlot")
    )
))
