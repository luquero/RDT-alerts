
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
        p("Main Required Inputs:"),
        sliderInput("det.thresh.fp", label = "Maximum risk of falsely declaring an outbreak",
                    min = 0, max = 1, value = .05),
        sliderInput("det.thresh", label = "Maximum risk of missing a true outbreak",
                    min = 0, max = 1, value = .05),
                    tags$hr(),
        p("Optional Inputs (current values set based on best estimates):"),        
                    numericInput("sens", label = "RDT sensitivity",
                               min = 0, max = 1, value = .9),
                    numericInput("spec", label = "RDT specificity",
                               min = 0, max = 1, value = .7),
                    numericInput("prev", label = "Proportion of suspected cases tested with cholera",
                               min = 0, max = 1, value = .15),
                   numericInput("numbertested",label="Number of tests performed",min=1,value=10),
                   #checkboxInput("kids", label = "Under-fives included in testing?",
                   #            value = FALSE),
                   img(src="dove.jpg", height = 50, width = 200),
        p("Source code can be found ",
        a("here", href="https://github.com/scottyaz/RDT-alerts")),
        br(),  
        p("\n Contact Andrew Azman (azman@jhu.edu) or Francisco Luquero (fluquero@jhu.edu) for any issues or questions related to this.")
      ),
      mainPanel(
        tabsetPanel(
        tabPanel("Main",
        h4("Welcome. This small application allows us to explore the performance of different RDT-based diagnostic algorithms for",
          span("probable outbreaks.",style="font-style:italic")),
        br(),
        p('Deciding on a threshold number of positive RDT tests needed to declare a probable outbreak can be complex, and will be a function of many factors including the performace of the test, the prevalence of true cholera among suspected cases, and the proportion of time we are willing to falsely declare an outbreak. '),
        p('Here in the top plot (blue dots) we show the proportion of times that an outbreak is dectected using different varying thresholds for the required number of positive RDTs. The bottom plot shows the proportion of times that an outbreak is falsely declared with different RDT-based thresholds. The red lines indicate your settings for the maximum risk of an outbreak not being detected and maximum risk for an outbreak being falsely declared.'),
        plotOutput("mainPlot"),
        renderText("test")
        ),
        tabPanel("Methods",
                 p("Will add more details on methods etc. here. Source code available at https://github.com/scottyaz/RDT-alerts")
                 )
      ))
    )
  ))