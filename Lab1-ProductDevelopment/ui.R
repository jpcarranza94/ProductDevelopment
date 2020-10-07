#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Inputs en ShinyApps"),

    # Sidebar with a slider input for number of bins
    tabsetPanel(
        tabPanel( "Tab 1",
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider_number",
                        "Seleccione valor",
                        min = 1,
                        max = 100,
                        value = 50),
            sliderInput("slider_number_animated",
                        "Seleccione valor",
                        min = 1,
                        max = 100,
                        value = c(25,75),
                        animate = TRUE,
                        post = "%",
                        dragRange = TRUE),
            numericInput("numeric_input",
                        "Seleccione un valor entre 0 y 100",
                        min = 1,
                        max = 100,
                        value = 50,
                        step = 1),
            selectInput("select_input",
                        "Seleccione un auto de la lista",
                        row.names(mtcars)),
            selectInput("select_input_multiple",
                        "Seleccione varios autos de la lista",
                        row.names(mtcars), multiple = TRUE),
            checkboxGroupInput("checkbox_group_input",
                               "Seleccione varios nombre de la lista",
                               c("Maria", "Daniel", "Pablo", "Luisa", "Victoria")),
            
            checkboxInput("checkbox_input",
                               "Hoy es un buen dia"),
        
            dateInput("date_input_simple", "Seleccione una fecha"),
            
            dateRangeInput("date_input_range", "Seleccione una fecha"),
            
            radioButtons("radio_button_input", "Seleccione un nombre de la lista",
                         c("Maria", "Daniel", "Pablo", "Luisa", "Victoria")),
            
            textInput("text_input", "Escriba el siguiente espacio"),
            
            textAreaInput("paragraph_input", "Escriba cualquier texto"),
            
            passwordInput("password_input", "Escriba su password"),
            
            actionButton("action_input", "Presione el boton"),
            
            actionLink("link_input", "Presione el link"),
            
            submitButton("Aplicar cambios")
            
        ),
    
        

        # Show a plot of the generated distribution
        mainPanel(
            
            h3("Slider"),
            verbatimTextOutput(outputId = "text.slider"),
            
            h3("Slider animated"),
            verbatimTextOutput(outputId = "text.slider_animated"),
            
            h3("Numeric input"),
            verbatimTextOutput(outputId = "text.numeric"),
            
            h3("Select input"),
            verbatimTextOutput(outputId = "text.select"),
            
            h3("Select input multiple"),
            verbatimTextOutput(outputId = "text.select_multiple"),
            
            h3("Checkbox Group Input"),
            verbatimTextOutput(outputId = "text.checkbox_group"),
            
            h3("Checkbox Input"),
            verbatimTextOutput(outputId = "text.checkbox_simple"),
            
            h3("Date Simple Input"),
            verbatimTextOutput(outputId = "text.date_simple"),
            
            h3("Date Range Input"),
            verbatimTextOutput(outputId = "text.date_range"),
            
            h3("Radio Button Input"),
            verbatimTextOutput(outputId = "text.radio_button"),
            
            h3("Text Input"),
            verbatimTextOutput(outputId = "text.text"),
            
            h3("Paragraph Input"),
            verbatimTextOutput(outputId = "text.paragraph"),
            
            h3("Password Input"),
            verbatimTextOutput(outputId = "text.password"),
            
            h3("Action Button"),
            verbatimTextOutput(outputId = "text.action"),
            
            hr(),
            verbatimTextOutput(outputId = "text.link")
            
            
        )
    )
        ),
    tabPanel("Tab 2",
        sidebarLayout(
            sidebarPanel(fileInput("file_upload", "Cargue un archivo .csv")),
            mainPanel(shiny::tableOutput(outputId = "table"))
        )
    )
    )
))
