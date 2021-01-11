library(shiny)

load('1a.RData')
vars <- rownames(x)

pageWithSidebar(
  headerPanel('GSE21935 kernel density estimates'),
  sidebarPanel(
    selectInput('xcol', 'gene expression', vars)
    ),
  mainPanel(
    plotOutput('plot1')
  )
)