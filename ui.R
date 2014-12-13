library(shiny)

shinyUI(
      
      fluidPage(
            
            titlePanel("Finishing the Phrase"),
            
            fluidRow(
                  
                  plotOutput(
                        "bubble", "100%", "700px"
                  )
            ),
            
            fluidRow(
                  
                  sidebarPanel(textInput("text", label = h5("Enter an incomplete thought"), 
                                         value = "minimum 2 characters"),
                               br(),
                               actionButton("goButton", "Your next word is...")
                               ),
                   
                  mainPanel(h4("Prediction"),
                            verbatimTextOutput("prediction"),
                            tableOutput("view"))
                  )          
      )
)
