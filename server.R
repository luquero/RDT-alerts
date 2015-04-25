
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$mainPlot <- renderPlot({
    library(RColorBrewer)
    ## to make it easier we will just simulate rather than try to work out the probabilities themselves
    n.sims = 10000
    true.infs = matrix(sample(0:1,input$numbertested*n.sims,replace=T,prob=c((1-input$prev),input$prev)),
           nrow=input$numbertested)
    
    test.res = true.infs
    test.res[test.res == 1] <- try(sample(0:1,length(which(test.res == 1)),replace=T,
                                      prob=c(1-input$sens,input$sens)))
    test.res[test.res == 0] <- try(sample(0:1,length(which(test.res == 0)),replace=T,
                                      prob=c(input$spec,1-input$spec)))
    test.res.null <- matrix(sample(0:1,input$numbertested*n.sims,replace=T,
                                   prob=c(input$spec,1-input$spec)),
                                   nrow=input$numbertested)
  
    threshs = seq(1,input$numbertested,by=1)
    ## probability of at least threash true case testing positive
    apply(test.res,2,function(x) sum(x))
    
    prob.correct.detect =  sapply(threshs,function(y) mean(apply(test.res,2,function(x) sum(x))>=y))
    prob.incorrect.detect = sapply(threshs,function(y) mean(apply(test.res.null,2,function(x) sum(x))>=y))

    palette(brewer.pal(8,"Set1"))
    par(mfrow=c(2,1),oma=c(3,1,3,1),mar=c(1.5,3,0,2),mgp=c(1.5,.4,0),tck=-.02)
    plot(threshs,prob.correct.detect,type="p",lwd=2,col=2,xaxt="n",ylab="True Detection Prob.",xlab="")
    grid()
    axis(3,at=1:input$numbertested,labels=1:input$numbertested)
    abline(h=input$det.thresh,col=1)
    plot(threshs,prob.incorrect.detect,type="p",lwd=2,col=3,xaxt="n",ylab="False Detection Prob.")
    axis(2,at=1:input$numbertested,labels=1:input$numbertested)
    abline(h=input$det.thresh.fp,col=1)
    grid()
    mtext("Threshold Number Testing Positive to Declare Probable Outbreak",side=1,outer=T,line=0)
  })

})
