#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# Define UI for application that draws a histogram
library(shiny)
library(DT)


shinyUI(fluidPage(
    
    titlePanel("Clase 2: pruebas con funcionalidad de tablas"),
    tabsetPanel(
        tabPanel("Cargar Archivo y dataFrames",
                 sidebarLayout(
                     sidebarPanel(
                         h2("Subir Archivo"),
                         fileInput("upload_file_1",
                                   "Archivo",
                                   buttonLabel = "Cargar", 
                                   accept = c(".csv", ".tsv"))
                     ),
                     mainPanel(
                         tableOutput("contenido_archivo_1")
                     )
                 )
        ),
        tabPanel("Cargar Archivo DT",
                 sidebarLayout(
                     sidebarPanel(
                         h2("Subir Archivo"),
                         fileInput("upload_file_2",
                                   "Archivo",
                                   buttonLabel = "Cargar", 
                                   accept = c(".csv", ".tsv"))
                         
                     ),
                     mainPanel(
                         DT::dataTableOutput("contenido_archivo_2")
                     )
                 )
                 
                ),
        tabPanel("DT Option",
                 
                 h2("Tabla 1"),
                 hr(),
                 fluidRow(column(width = 12,
                                 DT::dataTableOutput("tabla1")
                                 )
                          ),
                 h2("Tabla 2"),
                 hr(),
                 fluidRow(column(width = 12,
                                DT::dataTableOutput("tabla2")
                                )
                         ),
                 h2("Tabla 3"),
                 hr(),
                 fluidRow(column(width = 12,
                                 DT::dataTableOutput("tabla3")
                                )
                         )
                ),
        tabPanel("Clicks en tabla",
                 fluidRow(
                     column(width=12,
                            h2("Click en una fila"),
                            dataTableOutput("tabla4"),
                            verbatimTextOutput("tabla4_single_click")
                     )
                     
                 ),
                 fluidRow(
                     column(width=12,
                            h2("Click en varias fila"),
                            dataTableOutput("tabla5"),
                            verbatimTextOutput("tabla5_multi_click")
                     )
                 ),
                 fluidRow(
                     column(width=12,
                            h2("Click en una columna"),
                            dataTableOutput("tabla6"),
                            verbatimTextOutput("tabla6_single_click")
                     )
                     
                 ),
                 fluidRow(
                     column(width=12,
                            h2("Click en varias columnas"),
                            dataTableOutput("tabla7"),
                            verbatimTextOutput("tabla7_multi_click")
                            
                     )
                 ),
                 fluidRow(
                     column(width=12,
                            h2("Click en una celda"),
                            dataTableOutput("tabla8"),
                            verbatimTextOutput("tabla8_single_click")
                     )
                     
                 ),
                 fluidRow(
                     column(width=12,
                            h2("Click en varias celdas"),
                            dataTableOutput("tabla9"),
                            verbatimTextOutput("tabla9_multi_click")
                            
                     )
                 )
        
        )
    )
)
)
