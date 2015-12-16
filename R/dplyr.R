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
head(da[,2])
tail(da[,2])
class(da[,2])
str(da)
da
# converto data.frame so that as.POSIXct will work. 
da <- as.data.frame(da)
# at the moment, the as.POSIXct does not work.  Not sure why.  Not factors. 
da$DT <- as.POSIXct(strptime(paste(da[,1], da[,2]), format = "%d/%m/%Y%H:%M:%S"))
head(da$DT)
#da[,1] <- as.POSIXct(da[,2], format = "%d/%m/%Y")
#da[,1] <- as.POSIXct(da[,3], format = "%H:%M:%S") 
str(da)
head(da)
tail(da)
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
  summarise(round(mean(km.min), 4), round(sd(km.min), 4))
#------total distance per month
mutate(da, as.POSIXlt(da$DT)$mon)%>%
  group_by(as.POSIXlt(da$DT)$mon)%>%
  summarise(sum(Distance..KM.))
#----Actions----------
mutate(da, month = as.POSIXlt(da$DT)$mon)%>%
  filter(month == 6)%>%
  select(km.min, DT, Prog)%>%
  head(5)
  

#---More actions
mutate(da, month = as.POSIXlt(da$DT)$mon)%>%
  filter(month == 6)%>%
  select(km.min, DT, Prog)%>%
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
end <- (dim(da)[1])
miss <- -diff(da$DT) 
da2 <- da[-end,]
da2$miss <- miss
?difftime
hist(as.numeric(da2$miss))
which(da2,max(as.numeric(da2$miss)))
da2[c(1:10),c(14,18)]
plot(da2$miss, da2$km.min)
summary(lm(da2$km.min ~ da2$miss))
plot(lm(da2$km.min ~ da2$miss))
# The beta has a negative coefficient.  Need to find the outlyer and exclude. 


# from http://www.statmethods.net/stats/rdiagnostics.html
library(car)
fit <- lm(da2$km.min[-190] ~ da2$miss[-190])
summary(fit)
outlierTest(fit)
qqPlot(fit)
leveragePlots(fit)
avPlots(fit)
plot(fit, which = 4, cook.levels = cutoff)
influencePlot(fit, id.method = "identify")
ncvTest(fit)
spreadLevelPlot(fit)
vif(fit)
# Lots of useful diagnostic checks. 
fit2 <- lm(da2$km.min ~ da2$miss + as.factor(da2$Prog))

summary(fit2)
head(da2)
require(plm)

#---------------

