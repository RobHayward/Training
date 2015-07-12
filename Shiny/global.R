library(shiny)
# This coems from the google sheets package
# Information at http://htmlpreview.github.io/?https://raw.githubusercontent.com/jennybc/googlesheets/
# master/vignettes/basic-usage.html
library(googlesheets)
library(dplyr)
# register the sheet that has been made public
Training <- gs_title("Training")
# Now training contains the information about access
da <- gs_read_csv(Training)
# Information in in da
# converto data.frame so that as.POSIXct will work. 
da <- as.data.frame(da)
# at the moment, the as.POSIXct does not work.  Not sure why.  Not factors. 
da$DT <- as.POSIXct(strptime(paste(da[,1], da[,2]), format = "%d/%m/%Y%H:%M:%S"))
da[,1] <- as.POSIXct(da[,1], format = "%d/%m/%Y")
da[,1] <- as.POSIXct(da[,2], format = "%H:%M:%S") 

Programmes <- da[, "Prog"]
length <-dim(da)[1] 

