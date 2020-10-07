#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    
    output$text.slider <- renderText(paste("Slider input: ",input$slider_number))
    
    output$text.slider_animated <- renderText(paste("Slider input animado: ",input$slider_number_animated))
    
    output$text.numeric <- renderText(input$numeric_input)
    
    output$text.select <- renderText(input$select_input)
    
    output$text.select_multiple <- renderText(input$select_input_multiple)
    
    output$text.checkbox_group <- renderText(input$checkbox_group_input)
    
    output$text.checkbox_simple <- renderText(input$checkbox_input)
    
    output$text.date_simple <- renderText(input$date_input_simple)
    
    output$text.date_range <- renderText(input$date_input_range)
    
    output$text.radio_button <- renderText(input$radio_button_input)
    
    output$text.text <- renderText(input$text_input)
    
    output$text.paragraph <- renderText(input$paragraph_input)
    
    output$text.password <- renderText(input$password_input)
    
    output$text.action <- renderText(input$action_input)
    
    output$text.link <- renderText(input$link_input)
    
    output$table <- renderTable(input$file_upload)

    })

