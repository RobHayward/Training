#Some tests with dplyr
#Roger Penn on dplyr
#https://www.youtube.com/watch?v=aywFompr1F4&list=TLmZovpghOuEo


library(RCurl)
library(dplyr)
library(lubridate)
options(RCurlOptions = list(capath = system.file("CurlSSL",                                              
                      "cacert.pem", package = "RCurl"), ssl.verifypeer = FALSE))
myCsv <- getURL("https://docs.google.com/spreadsheet/pub?key=0AjqT5C2L9dEldG0yME8zN0JoNVF2V1d2YnBoTmlVZXc&single=true&gid=1&output=csv")
myCav <- getURL("https://docs.google.com/spreadsheets/d/1ae3hpCqqiCqugDwb01HWWZX2WlhgnYzXu9l40RYUBA0/pub?single=true&amp;gid=1&amp;output=csv")