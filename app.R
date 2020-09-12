library(shiny)
library(shinythemes)

# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  
                  "My first app",
                  tabPanel("Addition",
                           sidebarPanel(
                             tags$h3("Input:"),
                             numericInput("num1", "Number one", value = 0, min = 0, max = 100),
                             numericInput("num2", "Number two", value = 0, min = 0, max = 100),
                             
                           ), # sidebarPanel
                           mainPanel(
                             h1("Addition"),
                             
                             h4("Result"),
                             verbatimTextOutput("value"),
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("Navbar 2", ""),
                  tabPanel("Navbar 3", "")
                  
                ) 
) # fluidPage

# Define server function  
server <- function(input, output) {
  
  output$value<- renderText({paste(input$num1 + input$num2)})
}

# Create Shiny object
shinyApp(ui = ui, server = server)