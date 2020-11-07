#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Laboratorio 2"),
    tabsetPanel(
        tabPanel("Laboratorio 2", 
                 plotOutput("scatter_plot",
                            click = 'clk',
                            dblclick = 'dclk',
                            hover = 'mhover',
                            brush = 'mbrush'),
                 dataTableOutput("DT_mtcars")
        )
    )
    
    
))

