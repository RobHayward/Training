library(dplyr)
# Not sure what this does. Need for comments. 
# This will test the Shiny app
i <- c("2014-11-01","2014-11-5")
da2 <- subset(da, da$date == i[1]:i[2])
da$date <- format(as.POSIXct(da$DT), "%Y-%m-%d")
da2 <- select(da2, da2$date == i)
head(da2)
class(i)
da$date <- format(as.POSIXct(da$DT), "%Y-%m-%d")
head(da$year)
da$DT
tail(da)
str(da)
i
