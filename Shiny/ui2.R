shinyUI(fluidPage(
  titlePanel("Training Results"),
  
  sidebarLayout(
    
  sidebarPanel(
  
  selectInput("Prog", "Select Programme:", 
            choices = Programmes, 
            selected = "1.2", ), 
  
  selectInput("Range", "Select dates:", 
              choices = c("All data", "Last year", "Last month"),
              selected = "All data",
            
  
                )),

  mainPanel(h1("The training"),
    ("The "),
    textOutput("text"), 
    plotOutput("plot")
    
  ))
  ))
