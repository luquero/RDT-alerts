
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
        sliderInput("det.thresh.fp", label = "Maximum Proportion of False Positive Alerts",
                    min = 0, max = 1, value = .05),
        sliderInput("det.thresh", label = "Minimum Proportion of True Outbreaks Detected",
                    min = 0, max = 1, value = .95),
                    tags$hr(),
                   sliderInput("sens", label = "RDT sensitivity",
                               min = 0, max = 1, value = .9),
                   sliderInput("spec", label = "RDT specificity",
                               min = 0, max = 1, value = .7),
                   sliderInput("prev", label = "Prevalence of cholera among CTC admissions ",
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
        p("Welcome. This small application allows us to explore the performance of different RDT-based diagnostic algorithms for",
          span("probable outbreaks.",style="font-style:italic")),
        plotOutput("mainPlot"),
        renderText("test")
        ),
        tabPanel("Methods",
                 p("Will add more details on methods etc. here. Source code available at https://github.com/scottyaz/RDT-alerts")
                 )
      ))
    )
  ))