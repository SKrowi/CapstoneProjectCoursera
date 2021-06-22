# df_trigrams <- readRDS("df_trigrams_slimmed.rds")
df_trigrams <- read.csv("df_trigrams_slimmed.csv")

## Libraries
suppressWarnings(library(tidyverse))
suppressWarnings(library(stringi))
suppressWarnings(library(tm))
library(shiny)

PredictionFunction <- function(input_text, input_number){
    input_text <- str_to_lower(input_text);
    input_altered <-  paste(tail(strsplit(input_text, split=" ")[[1]],2), collapse = ' ');
    input_prediction <- df_trigrams[grep(paste("^", input_altered, " ", sep = ""), df_trigrams[, 1]),];
    output_prediction <- removeWords(input_prediction, input_altered);
    output_prediction <- head(str_squish(output_prediction), n = input_number);
    output_prediction <- as.data.frame(output_prediction, col.names = c("test"));
    result <- ifelse(nrow(output_prediction) < 1, "Sorry, no match has been found..", output_prediction)
    return(result)}

# Define server logic required to draw a histogram
shinyServer(
    function(input, output) {
        
        output$prediction <-renderPrint({
            result <-  PredictionFunction(input$input_text, input$input_number)
            result})
    }
)
