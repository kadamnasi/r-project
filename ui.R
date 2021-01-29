source("global_vars.R")

library(shiny)

tabsetPanel(
    tabPanel("summary statistics",
             fluidPage(
                 # Application title
                 titlePanel("Meteorological Data for several UK locations between January and November 2020"),
                 fluidRow(
                     column(3,
                            fluidRow(column(12,
                                            wellPanel(
                                                h4("Statistics"),
                                                selectInput(inputId = "parameters",
                                                            label ="Aggregation Plot",
                                                            choices = aggregation_plot_choices,
                                                            selected = c("Daily Mean")),
                                                selectInput(inputId = "weather_var", 
                                                            label="Weather Variables",
                                                            choices = NULL)                                                            )
                            ),
                            fluidRow(column(12,
                                            wellPanel(
                                                h5("Select x-axis"),
                                                selectInput( inputId = "axis",
                                                             label = NULL,
                                                             choices = x_axis_choices),
                                                conditionalPanel(condition = "input.axis=='hour'",
                                                                 numericInput("month", "Month Input", value=11, min=1, max=11, step = 1),
                                                                 numericInput("hour", "Input hour of day", value=14, min=0, max=24,  step=1))
                                            ))),
                            fluidRow(column(12,
                                            wellPanel(
                                                h6("stations"),
                                                selectizeInput(inputId = "sites", 
                                                               label="Select (up to five) Sites to highlight:",
                                                               choices= sitenames$Site_Name,
                                                               selected="Shawbury", 
                                                               multiple=FALSE, 
                                                               options = list(maxOptions = 20, maxItems = 5)
                                                ))
                            )  
                            ))),
                     column(9,      
                            wellPanel(
                                h4("Plots"),
                                plotOutput("plot1"))),
                     column(9,
                            wellPanel(
                                h4("maps"),
                                plotOutput("map1"),
                                dataTableOutput("table1"),
                                downloadButton("button1")))
                     
                 )
             )
    ),
    
    tabPanel("Hutton Criteria")
)        
