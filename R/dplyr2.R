library(RCurl)
library(dplyr)
# http://blog.rstudio.org/2014/01/17/introducing-dplyr/
# New verbs: distinct(), slice(), rename() and transmute()
options(RCurlOptions = list(capath = system.file("CurlSSL",                                              
                                                 "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv")
da <- read.csv(textConnection(myCsv), stringsAsFactors = FALSE)
# Combine the date and time to one column 
da$DT <- as.POSIXct(paste(da[,1], da[,2]), format = "%d/%m/%Y%H:%M:%S")
str(da)
da %>%
  group_by(Prog)%>%
  arrange(desc(km.min))%>%
  select(km.min)%>%
  slice(1)

