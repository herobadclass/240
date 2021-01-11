function(input, output, session) {
  load('1a.RData')
  
  SCZ = NULL
  CTRL = NULL
  for(i in 1:length(y)){
    if(y[i] == 1){
      SCZ = cbind(SCZ,x[,i])
    }
    else{
      CTRL = cbind(CTRL,x[,i])
    }
  }
  
  selectedDataSCZ <- reactive({
    SCZ[input$xcol,]
  })
  selectedDataCTRL <- reactive({
    CTRL[input$xcol,]
  })

  
  output$plot1 <- renderPlot({
    par(mfrow = c(1,2))
    plot(density(selectedDataSCZ()), main = "Schizophrenic Subjects")
    plot(density(selectedDataCTRL()), main = "Control Subjects")
  })
}