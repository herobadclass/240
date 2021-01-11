library(shiny)

load('2a.RData')

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("GDP by region"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("region", "Region:", 
                  colnames(y)),
      hr(),
      helpText("Data from Statistics Canada.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("Plot")  
    )
    
  )
)