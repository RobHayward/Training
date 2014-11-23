#Some tests with dplyr
library(RCurl)
library(dplyr)
library(lubridate)
options(RCurlOptions = list(capath = system.file("CurlSSL",                                              
                      "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv")
da <- read.csv(textConnection(myCsv), stringsAsFactors = FALSE)
# Combine the date and time to one column 
da$DT <- as.POSIXct(paste(da[,1], da[,2]), format = "%d/%m/%Y%H:%M:%S")
da[,1] <- as.POSIXct(da[,1], format = "%d/%m/%Y")
da[,1] <- as.POSIXct(da[,2], format = "%H:%M:%S") 
str(da)
head(da)
# Get fastest for Prog 1===== 
filter(da, Prog == 1)%>% 
arrange(desc(km.min))%>%
select(DT, km.min)%>%
  head(10)
#=Get afternoon
da$hour <- as.integer(as.POSIXlt(da$DT)$hour)
  filter(da, da$hour >= 12)%>%
  arrange(desc(km.min))%>%
  select(DT, km.min, Prog)%>%
  head(5)
# Look at average speed per program--------------------
group_by(da, Prog)%>%
  summarise(mean(km.min))
group_by(da, Prog)%>%
  summarise(mean(Calories))
#----average speed per day
da$wday <- as.POSIXlt(da$DT)$wday
group_by(da, wday)%>%
summarise(mean(km.min))
#~----aveage speed per month
mutate(da, as.POSIXlt(da$DT)$mon)%>%
  group_by(as.POSIXlt(da$DT)$mon)%>%
  summarise(mean(km.min))
#------total distance per month
mutate(da, as.POSIXlt(da$DT)$mon)%>%
  group_by(as.POSIXlt(da$DT)$mon)%>%
  summarise(sum(Distance..KM.))
#----Actions----------
mutate(da, month = as.POSIXlt(da$DT)$mon)%>%
  filter(month == 9)%>%
  select(km.min, DT)%>%
  head(5)

#---More actions
mutate(da, month = as.POSIXlt(da$DT)$mon)%>%
  filter(month == 0)%>%
  select(km.min, DT)%>%
  arrange(desc(km.min))%>%
  head(5)


#------------------
da%>%
  select(Prog, km.min, DT)%>%
  group_by(Prog)%>%
  summarise_each(funs(min(., na.rm = TRUE), max(.,na.rm = TRUE)))
             

#---calculate the days between workouts
da$day <- as.POSIXlt(da$DT)$yday
#calculate the length of dataframe
end <- -(dim(da)[1])
da$miss <- diff(da$day) 
head(da, 10)
# This does not work.  Need to  sort the dataframe out.  

str(da)
