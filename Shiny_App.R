shiny_compiled.R
Cameron Willliams
2020-04-04
library(shiny)
library(ggplot2)
library(ggmap)
## Google's Terms of Service: https://cloud.google.com/maps-platform/terms/.
## Please cite ggmap if you use it! See citation("ggmap") for details.
ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      
      selectInput(inputId = "y", label = "Y - axis:",
                  choices = c("Census", "Estimates", "Pop2010", "Pop2011"),
                  selected = "Census"),
      selectInput(inputId = "x", label = "X - axis:",
                  choices = c("Census", "Estimates", "Pop2010", "Pop2011"),
                  selected = "Census"),
      selectInput(inputId = "size", label = "Size:",
                  choices = c("Census", "Estimates", "Pop2010", "Pop2011"),
                  selected = "Census")
    ),
    
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
    
  )
)

server <- function(input, output){
  output$scatterplot <- renderPlot({
    ggplot(data = dfStates, aes_string(x = input$x, y = input$y)) +
      geom_point(aes(colour = factor(stateName)))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
Shiny applications not supported in static R Markdown documents