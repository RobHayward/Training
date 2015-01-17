library(shiny)
library(RCurl)
options(RCurlOptions = list(capath = system.file("CurlSSL",                                              
                                                 "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv")
da <- read.csv(textConnection(myCsv), stringsAsFactors = FALSE)
# Combine the date and time to one column 
da$DT <- as.POSIXct(paste(da[,1], da[,2]), format = "%d/%m/%Y%H:%M:%S")
da[,1] <- as.POSIXct(da[,1], format = "%d/%m/%Y")
da[,1] <- as.POSIXct(da[,2], format = "%H:%M:%S") 

Programmes <- da[, "Prog"]
length <-dim(da)[1] 
