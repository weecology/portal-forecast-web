
rodentTab <- function ( ) {

  tabPanel("Rodent Profiles", 
           includeHTML("profile.html"))

}

pageTitlePanel <- function ( ) {

  titlePanel(title = "Portal Project Forecasting")

}

pageSubtitlePanel <- function ( ) {

  href <- a(href = "http://portal.weecology.org", "The Portal Project")
  p(HTML(paste0("Forecasts for the population and community dynamics of ", href, ".")))

}

source("util.R")

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
