
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
                   sliderInput("prev", label = "Prevalence of cholera among CTC admissions ",
                               min = 0, max = 1, value = .5),
                   numericInput("numbertested",label="Number of tests performed",min=1,value=10),
                   checkboxInput("kids", label = "Under-fives included in testing?",
                              value = FALSE),
                   sliderInput("det.thresh.fp", label = "Maximum Proportion of False Positive Alerts",
                               min = 0, max = 1, value = .8),
                   sliderInput("det.thresh", label = "Minimum Proportion of True Outbreaks Detected",
                               min = 0, max = 1, value = .9),
                   img(src="dove.jpg", height = 50, width = 200),
                   p("\n Contact Andrew Azman (azman@jhu.edu) for any issues or questions related to this.")
      ),
      mainPanel(
        p("Welcome. This small application allows us to explore the performance of different RDT-based diagnostic algorithms for",
          span("probable outbreaks.",style="font-style:italic")),
        plotOutput("mainPlot")
      )
    )
  ))