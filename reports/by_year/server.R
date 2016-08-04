library(ggplot2)
library(ggmap)
#library(stringr)
library(dplyr)
library(leaflet)

#source("helpers.R")

load("data/points.RData")
load("data/bb.RData")

shinyServer(function(input,output){
  
  points_filter <- reactive({
    filter(points, DISPATCH_DATE >= as.POSIXct(input$dates[1]) & DISPATCH_DATE <= as.POSIXct(input$dates[2]) & TYPE %in% input$type)
  })
  
  type_pal <- reactive({
    colorFactor(topo.colors(3), points$TYPE)
  })
  
  output$map <- renderLeaflet({
    leaflet(points) %>% 
      addProviderTiles("Stamen.TonerLite") %>% 
      fitBounds(~min(LAT), ~min(LON), ~max(LAT), ~max(LON))
  })
  
  observe({
    pal <- type_pal()
    leafletProxy("map", data = points_filter()) %>% 
      clearShapes() %>% 
      addCircleMarkers(~LAT, ~LON, color = ~pal(TYPE), radius = 3, opacity = 1) %>%
      clearControls() %>% 
      addLegend("bottomright", pal, ~TYPE, title = "Crime type")
  })
  
  
})