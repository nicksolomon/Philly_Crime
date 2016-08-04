load("data/points.RData")
load("data/bb.RData")

points <- filter(points, !is.na(LAT) & !is.na(LON) & LAT > bb["left"] & LAT < bb["right"] & LON > bb["bottom"] & LON < bb["top"] & !is.na(TYPE)) %>%
  select(., LAT, LON, DISPATCH_DATE, TEXT_GENERAL_CODE, TYPE)

makemap <- function(years = c("2016-01-01", "2016-07-24"), type = c("Homicide"), view = "side"){
  if(is.null(type)) leaflet()
  else {
    map_out <- map + 
    geom_point(aes(LAT, LON, color = DISPATCH_DATE, shape = TYPE),
              filter(points, DISPATCH_DATE >= as.POSIXct(years[1]) & DISPATCH_DATE <= as.POSIXct(years[2]) & TYPE %in% type),
              size = 4, alpha = .6) +
    geom_jitter() +
    labs(x = "", y = "", color = "Date", shape = "Type of crime") +
    theme(text = element_text(size = 16))
    
    if(view == "Overlay") map_out
    else map_out + facet_wrap("TYPE")
  }
}

