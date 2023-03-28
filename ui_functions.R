portalForecastUI <- function ( ) {

  fluidPage(pageTitlePanel( ),
            pageSubtitlePanel( ),
            pageMainPanel( ))

}




pageMainPanel <- function ( ) {

  mainPanel(tabsetPanel(forecastTab( ),
                        evaluationTab( ),
                        aboutTab( ),
                        modelsTab( ),
                        profilesTab( )))

}



aboutTab <- function ( ) {

  tabPanel(title = "About", 
           includeMarkdown("about.md"))

}

modelsTab <- function ( ) {

  tabPanel(title = "Models", 
           includeHTML("models.html"))

}

profilesTab <- function ( ) {

  tabPanel(title = "Rodent Profiles", 
           includeHTML("profile.html"))

}


forecastTab <- function ( ) {


  tabPanel(title = "Forecast", 
           br( ), 
           forecastTabInputSelectionRow( ), 
           #forecastTabInputSelectionChecksRow( ),   # used for checking reactive inputs in dev
           plotOutput("forecastTabTSPlot"),
           br( ),
           plotOutput("forecastTabSSPlot"),
           br( ))

}


forecastTabInputSelectionChecksRow <- function ( ) {
  fluidRow(textOutput("forecastTabSpecies"), 
           textOutput("forecastTabDataset"), 
           textOutput("forecastTabModel"))
}


evaluationTab <- function ( ) {


  tabPanel(title = "Evaluation", 
           br( ), 
           evaluationTabInputSelectionRow( ),
           h2("Most recent observation vs. forecasts"),
           #evaluationTabInputSelectionChecksRow( ),   # used for checking reactive inputs in dev
           plotOutput("evaluationTabSpPlot"),
           br( ),
           h2("Model Coverage & RMSE (last 3 years of forecasts)"),
           plotOutput("evaluationTabRMSEPlot"),
           br( ))

}

evaluationTabInputSelectionChecksRow <- function ( ) {
  fluidRow(textOutput("evaluationTabSpecies"), 
           textOutput("evaluationTabDataset"), 
           textOutput("evaluationTabModel"))
}

forecastTabInputSelectionRow <- function ( ) {


  fluidRow(forecastTabInputSelectionRowSpecies( ),
           forecastTabInputSelectionRowDataset( ),
           forecastTabInputSelectionRowModel( ))



}


forecastTabInputSelectionRowSpecies <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "forecastTabSpecies",
                     label    = "Species",
                     choices  = species_list(),
                     selected = "DM"))

}

forecastTabInputSelectionRowDataset <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "forecastTabDataset",
                     label    = "Dataset",
                     choices  = prefab_datasets(),
                     selected = "controls"))

}


forecastTabInputSelectionRowModel <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "forecastTabModel",
                     label    = "Model",
                     choices  = model_list(),
                     selected = "AutoArima"))

}


evaluationTabInputSelectionRow <- function ( ) {


  fluidRow(evaluationTabInputSelectionRowSpecies( ),
           evaluationTabInputSelectionRowDataset( ),
           evaluationTabInputSelectionRowModel( ))



}


evaluationTabInputSelectionRowSpecies <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "evaluationTabSpecies",
                     label    = "Species",
                     choices  = species_list( ), 
                     selected = "DM"))

}

evaluationTabInputSelectionRowDataset <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "evaluationTabDataset",
                     label    = "Dataset",
                     choices  = prefab_datasets(),
                     selected = "controls"))

}


evaluationTabInputSelectionRowModel <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "evaluationTabModel",
                     label    = "Model",
                     choices  = model_list(),
                     selected = "AutoArima"))

}




model_list <- function ( ) {

  out <- prefab_models()
  names(out) <- unlist(mapply(getElement, prefab_model_controls(), "metadata")["print_name", ])

  out
}

species_list <- function ( ) {

  out <- rodent_species(set = "forecasting", type = "code", total = TRUE)
  names(out) <- rodent_species(set = "forecasting", type = "Latin", total = TRUE)

  out
}


pageTitlePanel <- function ( ) {

  titlePanel(title = "Portal Project Forecasting")

}

pageSubtitlePanel <- function ( ) {

  href <- a(href = "http://portal.weecology.org", "The Portal Project", target = "_blank")
  p(HTML(paste0("Forecasts for the population and community dynamics of ", href, ".")))

}