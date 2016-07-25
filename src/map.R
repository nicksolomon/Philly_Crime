mapbase <- get_map(c( -75.182579, 40.058039), zoom = 12, maptype = "roadmap", force = TRUE)
map <- ggmap(mapbase)

bb <- bb2bbox(attr(mapbase, "bb"))

points <- filter(crime.incidents, !is.na(LAT) & !is.na(LON) & LAT > bb["left"] & LAT < bb["right"] & LON > bb["bottom"] & LON < bb["top"] & grepl("Homicide", crime.incidents$TEXT_GENERAL_CODE)) %>%
          select(., LAT, LON, DISPATCH_DATE)
points$YEAR <- as.POSIXlt(points$DISPATCH_DATE) %>% 
               .$year + 1900

map + geom_point(aes(x= LAT, y=LON, color = YEAR), points)

