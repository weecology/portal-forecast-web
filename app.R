#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shiny)
library(dplyr)
library(ggplot2)
remotes::install_github("weecology/portalr")
library(portalr)
library(stats)
library(lubridate)
library(forecast)

# Data setup
portal_data <- load_rodent_data()
abundances <- abundance(shape = "long", time = "period", clean = FALSE) %>% 
    inner_join(portal_data$species_table, by = "species") %>%
    left_join(portal_data$newmoons_table, by = "period") %>%
    mutate(censusdate = as.Date(censusdate))
species_list <- unique(abundances$scientificname)
species_list <- sort(species_list)
min_date <- min(abundances$censusdate)
max_date <- max(abundances$censusdate)

ndvi_dat <- ndvi(level = "monthly", fill = FALSE) %>%
    mutate(year = year(date), month = month(date)) 

weath_dat <- weather(level = "monthly", fill = FALSE) %>%
    full_join(ndvi_dat, by = c("year", "month")) %>%
    select(year, month, mintemp, maxtemp, meantemp, precipitation, ndvi, 
           warm_days, cool_precip, warm_precip) %>%
    mutate(date = ymd(paste(year,month,01)))

full_dat <- abundances %>%
    mutate(censusdate = ymd(censusdate)) %>%
    mutate(year = year(censusdate), month = month(censusdate)) %>%
    left_join(weath_dat, by = c("year", "month")) %>%
    select(-"date") %>%
    rename(date = censusdate)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Portal Project Forecasting"),

    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput("plot")),
            tabPanel("About", includeMarkdown("about.md")),
            tabPanel("Models", includeMarkdown("models.md"))
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
