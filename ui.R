library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram

shinyUI(fluidPage(theme = shinytheme("united"),
                  titlePanel("Final Course Project: Text Prediction"),
                   
                   sidebarPanel(
                       
                       sliderInput('input_number', 'How many suggestions do you want to receive?', min = 1, max = 10,
                                   value = 1, step = ),
                       
                       helpText("Enter a few words to start a prediction"),
                       textInput("input_text", "Enter words here",value = ""),
                       br(),
                       br(),
                       br(),
                       br(),
                       
                       submitButton("Submit New Parameters")
                   ),
                   
                   mainPanel(
                       
                       h1("Respective Word Prediction", align = "center"),
                       verbatimTextOutput("prediction") ,
                       textOutput("result")
                   )
))

