#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Histogram of each covariate"),
  
  # Sidebar to select covariate 
  sidebarLayout(
    sidebarPanel(
      uiOutput("select_variable")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      plotOutput("plot2"),
    )
  ),
  fluidRow(column(12,
                  dataTableOutput("table")
  )
  )
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  data0 <- read.csv("../data_clean/bmx_bpx_for_histograms.csv")
  
  output$distPlot <- renderPlot({
    x    <- data0[, as.character(input$selectedCovariate)]
    
    # draw the histogram for the specified covariate
    hist(x, col = 'darkgray', border = 'white',
         xlab = as.character(input$selectedCovariate),
         main = 'Histogram')
  })
  output$select_variable <- renderUI({
    selectInput("selectedCovariate","Please select a covariate",colnames(data0))
    
  })
  output$table <- renderDataTable(data0)
  
}

# Run the application 
shinyApp(ui = ui, server = server)