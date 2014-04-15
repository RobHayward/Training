# http://onetipperday.blogspot.co.uk/2014/01/access-google-
#spreadsheet-directly-in.html
# http://blog.revolutionanalytics.com/2009/09/how-to-use-a-google-
# spreadsheet-as-data-in-r.html
# This works.
require(RCurl)
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv")
da <- read.csv(textConnection(myCsv), stringsAsFactors = FALSE)
# Combine the date and time to one column 
da$DT <- as.POSIXct(paste(da[,1], da[,2]), format = "%d/%m/%Y%H:%M:%S")
head(da)
str(da)
par(mfrow = c(2,3))
for(i in c(1, 4, 5, 6, 1.1, 6.1))
  {da2 <- subset(da, subset = da[,3] == i)
plot(da2$km.min ~ da2$DT, type = 'l', main = paste(c("Times for Level ",
              i)), xlab = "Time", ylab = "KM-Min")
}
dev.off()
