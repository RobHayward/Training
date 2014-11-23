# http://onetipperday.blogspot.co.uk/2014/01/access-google-
#spreadsheet-directly-in.html
# http://blog.revolutionanalytics.com/2009/09/how-to-use-a-google-
# spreadsheet-as-data-in-r.html
# Next 2 lines my be necessary (not sure)
options(RCurlOptions = list(capath = system.file("CurlSSL", 
"cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
options(RCurlOptions = list(capath = system.file("CurlSSL", 
"cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
link <- getURL("https://docs.google.com/spreadsheet/pub?
               key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single
               =true&gid=1&range=a1%3Al200&output=csv")
require(RCurl)
# Does not work.
da <- read.table(textConnection(link))
head(da)
===============
TableURL="https://docs.google.com/spreadsheet/pub?
key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=
true&gid=1&output=CSV"
require(RCurl)
Table <- read.csv(textConnection(getURL(TableURL)), header = F)
colnames(Table) <- c("Date", "Hour", "Prog", "Time", "Calories", "Distance", 
"Fix", "Cal-KM", "30Dav", "KM/Min", "30Dav2", "Cal/Min", "Note")
	Table$Date <- as.Date(Table$Date, format = "%d/%m/%Y")
head(Table)
str(Table)
TableURL="https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=txt"
require(RCurl)
Table=read.table(textConnection(getURL(URL)), header=T, sep = ",")
 head(covarianceTable)
URL <- "https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8z
N0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv"

google_ss <- function(gid = NA, key = NA) 
{
if (is.na(gid)) {stop("\nWorksheetnumber (gid) is missing\n")}
if (is.na(key)) {stop("\nDocumentkey (key) is missing\n")}
require(RCurl)
url <- getURL(paste("https://docs.google.com/spreadsheet/pub?key=", key,
"&single=true&gid=", gid, "&output=csv", sep = ""),
cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
read.csv(textConnection(url), header = T, sep = ",")
}
da <- read.table(textConnection(getURL(URL)), header = T, sep = ",")
head(da)
?read.table
(data <- google_ss(gid = 0,
key = "0AjqT5C2L9dEldG0yME8z
N0JoNVF2V1d2YnBoTmlVZXc"))
library(RCurl)
options(RCurlOptions = list(capath = system.file("CurlSSL", "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE)) 
sochi.medals.URL = "https://docs.google.com/spreadsheets/d/1f30Mqlv1O6Cu9f-06vE_uaTXEA-5BczYL_HhLJfjfI4/export?format=csv&grid=0"
medals <- read.csv(textConnection(getURL(sochi.medals.URL)), 
                   header = TRUE)
str(medals)
url = "https://docs.google.com/spreadsheets/d/1f30Mqlv1O6Cu9f-06vE_uaTXEA-5BczYL_HhLJfjfI4/export?format=csv&grid=0"
da <- read.csv(textConnection(getURL(link)))
head(medals)
da
?read.table
------------------
# This works.
require(RCurl)
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv")
da <- read.csv(textConnection(myCsv), stringsAsFactors = FALSE)
da[,1] <- as.Date(da[,1], format = "%d/%m/%Y")
da[,DT] <- c
da[,2] <- as.POSIXct(da[,2], format = "%H:%M:%S") 
da$DT <- cbind(da[,1], da[,2])
da$DT <- as.POSIXct(da$DT)
head(da$DT)
str(da)
da2 <- subset(da, subset = da[,3] == "1")
plot(da2[,10] ~ da2[,1], type = 'l')
head(da2[,10])
