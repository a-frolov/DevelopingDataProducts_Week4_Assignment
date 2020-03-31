#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

data(mtcars)

# Define UI for application that draws a plot
shinyUI(
  fluidPage(

    # Application title
    titlePanel( "Miles per Gallon Linear Regression Model . Data 'mtcars'."),

    sidebarPanel(
      
      selectInput("variable", "Variable:", 
                  c("Weight" = "wt",
                    "Horse Power" = "hp",
                    "Number of Cylinders" = "cyl"))
    ),
    
    mainPanel(
      # Output: Formatted text for plot title ----
      h3(textOutput("plotTitle")),
      
      # Output: Plot of mpg against the requested variable ----
      plotOutput("myPlot")
    )
  )
)
