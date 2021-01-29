library(shiny)
library(ggplot2)
library(fs)
library(vroom)
library(purrr)
library(tidyverse)
library(magrittr)
library(ggmap)
library(maps)
library(lubridate)
library(reshape2)

source("C:/Users/michael/Desktop/1pylearning/r_project/myfns.R")
source("global_vars.R")

# file.path joins paths together
sitenames <- read_csv(file.path(data_dir, "Sites.csv"))
UK <-map("world", "UK")

shinyServer(function(input, output, session) {
    sitesdata <- reactive({
        df <- numextractor(input$sites) 
        selected_sites <- readert(df)
        selected_sites2 <- inner_join(sitenames,  selected_sites, by= c("Site_ID"="Site")) %>% 
            group_by(Site_Name) 
        return( selected_sites2)
    })
    observeEvent(input$sites, {
        input$sites
    })
  
    observe({
        updateSelectInput(session, "weather_var", choices = colnames(sitesdata()[8:12]))
        updateSelectInput(session, "axis", choices = colnames(sitesdata()))
    })
    
    output$plot1 <-  renderPlot(
       
         ggplot(data= sitesdata())+ 
               aes_string(x=input$axis, y=input$weather_var, color=factor(input$sites))+
               geom_point() 
        
    )
    output$map1 <- renderPlot(
        ggplot(data = UK)+
            points(sitenames$Longitude, sitenames$Latitude, pch=16, col="red")
    )
})