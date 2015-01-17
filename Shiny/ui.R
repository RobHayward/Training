shinyUI(fluidPage(
  titlePanel("Training Results"),
  
  sidebarLayout(
    
  sidebarPanel(
  
  selectInput("Prog", "Select Programme:", 
            choices = Programmes, 
            selected = "1A"),
  
  selectInput("Range", "Select dates:", 
              choices = c("All data", "Last 100", "Last 20"),
              selected = "All data"),
              
  selectInput("Metric", "Select metric:", 
                 choices = c("Cal/KM", "Cal/min", 
                             "KM/min"),
                             selected = "Cal/KM")          
  
                ),

  mainPanel(h1("The training"),
    ("The "),
    textOutput("text"), 
    plotOutput("plot"))
    
  ))
  )
# there is some problem here.  The error in tag("form", list(..) means tht 
# there is a commer in this file that should not be there.  )