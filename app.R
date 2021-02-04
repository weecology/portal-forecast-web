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

# Get lists of species as both abbreviations and scientific names
species_table <- portalr::load_rodent_data()$species_table
species_abbrev_list <- portalcasting::rodent_species(set = "all")
species_names <- species_table %>%
                 inner_join(data.frame(species = species_abbrev_list), by = "species") %>%
                 select(species, scientificname)
species_list <- c("All", species_names$scientificname)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Portal Project Forecasting"),

    mainPanel(
        tabsetPanel(
            tabPanel("Forecast",
            mainPanel(selectInput("species",
                                  "Species",
                                  species_list,
                                  selected = "Dipodomys merriami"),
                      selectInput("treatment",
                                  "Treatment",
                                  c("All", "Controls", "Exclosures"),
                                  selected = "Controls"),
                      plotOutput("main_plot"),
                      plotOutput("species_summary_plot"))),
            tabPanel("About", includeMarkdown("about.md")),
            tabPanel("Models", includeMarkdown("models.md")),
            tabPanel("Rodent Profiles", includeHTML("profile.html"))
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

output$main_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_ts(data_set = tolower(input$treatment)) 
  } else {
    species <- species_names$species[species_names$scientificname == input$species]
    p <- plot_cast_ts(data_set = tolower(input$treatment), species = toupper(species))
  }
  p
})

output$species_summary_plot <- renderPlot({
    p <- plot_cast_point(data_set = "controls")
})

}

# Run the application 
shinyApp(ui = ui, server = server)
