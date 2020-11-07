
library(shiny)
library(ggplot2)
library(dplyr)
library(DT)

out_click <- NULL
out_brush <- NULL
out_hover <- NULL
out_df <- mtcars



shinyServer(function(input, output) {
    
    puntos <- reactive({
        if(!is.null(input$clk$x)){
            df <- nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
            out_click <<- rbind(out_click,df) %>% distinct()
            out_df <<- df
        }
        
        if(!is.null(input$mhover$x)){
            df <- nearPoints(mtcars,input$mhover,xvar='wt',yvar='mpg')
            out_hover <<- df
        }
        
        if(!is.null(input$dclk$x)){
            df <- nearPoints(mtcars,input$dclk,xvar='wt',yvar='mpg')
            out_click <<- setdiff(out_click,df)
            out_brush <<- setdiff(out_brush,df)
        }
        
        if(!is.null(input$mbrush)){
            df<-brushedPoints(mtcars,input$mbrush,xvar='wt',yvar='mpg')
            out_brush <<- rbind(out_brush,df) %>% distinct()
            out_df <<- df
        }
        
    })
    
    
    scatter_plot <- reactive({
        plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="mpg")
        puntos <-puntos()
        if(!is.null(out_hover)){
            points(out_hover[,'wt'],
                   out_hover[,'mpg'],
                   col = 'gray',
                   pch = 16,
                   cex = 2)}
        if(!is.null(out_click)){
            points(out_click[,'wt'],
                   out_click[,'mpg'],
                   col = 'green',
                   pch = 16,
                   cex= 2)}
        if(!is.null(out_brush)){
            points(out_brush[,'wt'],
                   out_brush[,'mpg'],
                   col = 'red',
                   pch = 16,
                   cex = 2)}
    })
    
    
    output$scatter_plot = renderPlot({
        scatter_plot()

    })
    
    
    click_table <- reactive({
        input$clk
        input$dclk
        input$mbrush
        if((!is.null(out_brush)&!is.null(out_click))) {
            out_df <<- rbind(out_brush,out_click)
            }
        out_df 
    })
    
    
    output$DT_mtcars = renderDataTable({
        click_table() %>% datatable()
    })
    
})