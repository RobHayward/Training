# This coems from the google sheets package
# Information at http://htmlpreview.github.io/?https://raw.githubusercontent.com/jennybc/googlesheets/
# master/vignettes/basic-usage.html
library(googlesheets)
# register the sheet that has been made public
Training <- gs_title("Training")
# Now training contains the information about access
da <- gs_read_csv(Training)
# Information in in da
head(da)
str(da)
# The data and time can now be parsed as they were in the previous versions. 