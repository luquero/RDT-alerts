
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
  shinyUI(fluidPage(
    titlePanel("Cholera RDT Probable Outbreak Alert Algorithms"),
    sidebarLayout(
      sidebarPanel(
                   sliderInput("sens", label = "RDT sensitivity",
                               min = 0, max = 1, value = .9),
                   sliderInput("spec", label = "RDT specificity",
                               min = 0, max = 1, value = .7),
                   sliderInput("prev", label = "Prevalance of cholera among CTC admissions ",
                               min = 0, max = 1, value = .5),
                   numericInput("numbertested",label="Number of tests performed",min=1,value=10),
                   checkboxInput("kids", label = "Under-fives included in testing?",
                              value = FALSE),
                   img(src="dove.jpg", height = 50, width = 200)                  
      ),
      mainPanel(
        p("Welcome. This small application allows us to explore the performance of different RDT-based diagnostic algorithms for",
          span("probable outbreaks",style="font-style:italic")),
        plotOutput("mainPlot")
      )
    )
  ))