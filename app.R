
library(shiny)
library(portalcasting)


# Render Rmd files
rmarkdown::render("models.Rmd")

# Data setup

# Need to set this up to only run periodically external
# to the shiny app
# setup_production()

# Get lists of species as both abbreviations and scientific names

species_names <- rodent_species(set = "base", type = "table")

model_list <- c(prefab_models(), "Ensemble")
model_list <- model_list[!(model_list %in% c("jags_logistic", "jags_logistic_covariates"))]

# Define UI 
ui <- fluidPage(

    # Application title
    titlePanel("Portal Project Forecasting"),
    p(HTML(paste0('Forecasts for the population and community dynamics of ', a(href = 'http://portal.weecology.org', 'The Portal Project'), '.'))),
    mainPanel(
        tabsetPanel(
          tabPanel("Forecast",
            br(),
            fluidRow(column(width = 4,
                            selectInput("species",
                              "Species",
                              species_names$Latin,
                              selected = "Dipodomys merriami")),
                     column(width = 3,
                            selectInput("treatment",
                              "Treatment",
                              c("All", "Controls", "Exclosures"),
                              selected = "Controls")),
                     column(width = 3,
                            selectInput("model",
                              "Model",
                              model_list,
                              selected = "nbsGARCH"))),
                      plotOutput("main_plot"),
                      plotOutput("species_summary_plot")),
            tabPanel("Evaluation",
              mainPanel(
                h2("Most recent observation vs forecasts"),
                selectInput("treatment_report",
                                  "Treatment",
                                  c("All", "Controls", "Exclosures"),
                                  selected = "Controls"),
                selectInput("model_report",
                            "Model",
                            model_list,
                            multiple = TRUE,
                            selected = "nbsGARCH"),
                plotOutput("report_species_summary_plot"),
                h2("Model Coverage & RMSE (last 3 years of forecasts)"),
                selectInput("species_report",
                                  "Species",
                                  species_names$Latin,
                                  selected = "Dipodomys merriami"),
                plotOutput("RMSE")
                        )),
            tabPanel("About", includeMarkdown("about.md")),
            tabPanel("Models", includeHTML("models.html")),
            tabPanel("Rodent Profiles", includeHTML("profile.html"))
        )
    )
)

# Define server logic required
server <- function(input, output) {

output$main_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_ts(dataset = tolower(input$treatment), model = input$model) 
  } else {
    species <- species_names$abbreviation[species_names$Latin == input$species]
    p <- plot_cast_ts(dataset = tolower(input$treatment), species = toupper(species), model = input$model)
  }
  p
})

output$species_summary_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_point(dataset = tolower(input$treatment),
                         highlight_sp = ("total"))
  } else {
    species <- species_names$abbreviation[species_names$Latin == input$species]
    p <- plot_cast_point(dataset = tolower(input$treatment),
                         highlight_sp = toupper(species))
  }
  p
})

output$report_main_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_ts(dataset = tolower(input$treatment))
  } else {
    species <- species_names$abbreviation[species_names$Latin == input$species]
    p <- plot_cast_ts(dataset = tolower(input$treatment),
                      species = toupper(species))
  }
  p
})

output$report_species_summary_plot <- renderPlot({
  p <- plot_cast_point(dataset = tolower(input$treatment_report), model = input$model_report,
                       with_census = TRUE) 
})

output$RMSE <- renderPlot({
  species_report <- species_names$abbreviation[species_names$Latin == input$species_report]
  p <- plot_casts_cov_RMSE(models = input$model_report,
         species = toupper(species_report),
         ensemble = TRUE)
})

}

# Run the application 
shinyApp(ui = ui, server = server)
