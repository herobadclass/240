load('2a.RData')

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$Plot <- renderPlot({
    
    # Render a barplot
    barplot(y[,input$region], 
            main=input$region,
            ylab="GDP in millions",
            xlab="Year")
  })
}