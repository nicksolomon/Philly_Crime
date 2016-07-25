crime.incidents$DC_DIST <- as.factor(crime.incidents$DC_DIST)
crime.incidents$PSA <- as.factor(crime.incidents$PSA)
crime.incidents$DISPATCH_DATE_TIME <- as.POSIXct(strptime(crime.incidents$DISPATCH_DATE_TIME, "%m/%d/%Y %I:%M:%S %p"))
crime.incidents$DISPATCH_DATE <- as.POSIXct(strptime(crime.incidents$DISPATCH_DATE, "%F"))
crime.incidents$DISPATCH_TIME <- as.POSIXct(strptime(crime.incidents$DISPATCH_TIME, "%T"))
crime.incidents$UCR_GENERAL <- NULL
crime.incidents$TEXT_GENERAL_CODE <- as.factor(crime.incidents$TEXT_GENERAL_CODE)

crime.incidents$LAT <- str_match(crime.incidents$SHAPE, "-75.[0-9]+") %>% as.numeric
crime.incidents$LON <- str_match(crime.incidents$SHAPE, " [0-9]{2}.[0-9]+") %>% as.numeric

crime.incidents$SHAPE <- NULL

points <- crime.incidents

points$YEAR <- as.POSIXlt(points$DISPATCH_DATE) %>%
  .$year + 1900

points$TYPE <- rep(NA, dim(points)[1])

points$TYPE[which(grepl("Homicide", points$TEXT_GENERAL_CODE))] <- "Homicides"
points$TYPE[which(grepl("Assault", points$TEXT_GENERAL_CODE))] <- "Assaults"
points$TYPE[which(grepl("Sex|Rape", points$TEXT_GENERAL_CODE))] <- "Sexual assaults"
points$TYPE <- as.factor(points$TYPE)


save(points, file = "reports/by_year/data/points.RData")
