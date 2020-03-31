#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2) 
shinyServer(function(input, output) {
  
   part2 <- reactive ({ 
      switch(input$variable,
            "wt" = "Weight",
            "hp" = "Horse Power",
            "cyl"= "Number of Cylinders")
  })
  
  formulaText <- reactive ({paste ("Miles per Gallon vs ", part2())})
  
  output$plotTitle <- renderText({formulaText()
  })
  
  output$myPlot <- renderPlot({
    ggplot(mtcars, aes_string(x=input$variable, y="mpg")) + 
      geom_point(aes(color = as.factor(mtcars$cyl)), size = 3) +
      geom_smooth(method = "lm", colour = "firebrick")+
      scale_color_manual(name = "Cylinders",
                           labels = c("Four","Six","Eight"),
                           values = c("4" = "blue","6" = "red","8" = "green") 
                         ) 
  })
  
})


