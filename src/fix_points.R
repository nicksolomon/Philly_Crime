points$temp <- points$LAT
points$LAT <- points$LON
points$LON <- points$temp
points$temp <- NULL
save(points, file = "data/points.RData")