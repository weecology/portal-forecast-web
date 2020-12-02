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
library(portalr)
library(stats)
library(lubridate)
library(forecast)
library(portalcasting)

# Data setup

# Need to set this up to only run periodically external
# to the shiny app
# setup_production()

species_list <- portalcasting::rodent_species(set = "all")

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Portal Project Forecasting"),

    mainPanel(
        tabsetPanel(
            tabPanel("Forecast",
            sidebarPanel(selectInput("species",
                                     "Species",
                                     species_list,
                                     selected = "DM")),
            mainPanel(plotOutput("main_plot"))),
            tabPanel("About", includeMarkdown("about.md")),
            tabPanel("Models", includeMarkdown("models.md"))
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

output$main_plot <- renderPlot({
  print(input$species)
  p <- plot_cast_ts(data_set = "controls", species = toupper(input$species))
  p
})

}

# Run the application 
shinyApp(ui = ui, server = server)
