library(ggplot2)
library(ggmap)
library(stringr)
library(dplyr)

source("helpers.R")

shinyServer(function(input,output){
  output$map <- renderPlot({
    
    makemap(input$years, input$type, input$view)
    
  }, width = 900, height = 700)
})