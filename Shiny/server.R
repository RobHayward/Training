# load libraries, scripts and data
#These are in global.R

shinyServer(function(input, output){
    output$text <- renderText({
         paste("Km-min for programme ", input$Prog, sep = "")
    })
    
    output$plot <- renderPlot({
    
      range <- switch(input$Range, 
                      "All data" = 1:length, 
                      "Last year" = 1:100,
                      "Last month" = 1:20)
      
      metric <- switch(input$Metric, 
                      "Cal/KM" = "Calories.KM", 
                      "Cal/min" = "Cal.min",
                      "KM/min" = "km.min")
      
      
    da2 <- subset(da[range,], da[,3] == input$Prog)
    plot(da2[,metric] ~ da2$DT, type = 'l', main = paste(c("Times for Level ",
                    input$Prog)), xlab = "Time", ylab = metric)
 
    })
    
    })
  
  