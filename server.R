library(shiny)
library(ggplot2)
source('nextword.R')
require(stylo);require(data.table)

shinyServer(function(input, output) {
      
      tabble<-reactive({
            input$goButton
            nextword(paste0(isolate(input$text)))
      })
      
      output$prediction <- renderPrint({
            tabble <- tabble()
            cat(as.character(tabble[,.(Word)][1,]))
      })
      
      output$view <- renderTable({
            tabble()
      })
      
      output$bubble <- renderPlot({
            tb<-tabble()
            x<-rnorm(10,5,3)
            y<-rnorm(10,5,1)
            radius <- sqrt(tb$confidence/pi)
            par(bty='n', col.lab='white', xaxt='n', yaxt='n')
            symbols(x,y, circles=radius, inches=1.6, fg="white", bg=colors()[round(rnorm(1,329,190))], xlab=NULL, ylab=NULL)
            text(x,y,labels=tb[,Word], cex=1)
      })

})

