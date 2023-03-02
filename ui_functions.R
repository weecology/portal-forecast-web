portalForecastUI <- function ( ) {

  fluidPage(pageTitlePanel( ),
            pageSubtitlePanel( ),
            pageMainPanel( ))

}




pageMainPanel <- function ( ) {

  mainPanel(tabsetPanel(forecastTab( )))

}

forecastTab <- function ( ) {


  tabPanel(title = "Forecast", 
           br( ), 
           forecastTabInputSelectionRow ( ), 
           textOutput("forecastTabSpecies"),
           textOutput("forecastTabDataset"),
           textOutput("forecastTabModel"))

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
                     choices  = rodent_species(set = "base", type = "Latin"),
                     selected = "Dipodomys merriami"))

}

forecastTabInputSelectionRowDataset <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "forecastTabDataset",
                     label    = "Dataset",
                     choices  = prefab_datasets( ),
                     selected = "control"))

}

forecastTabInputSelectionRowModel <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "forecastTabModel",
                     label    = "Model",
                     choices  = prefab_models( ),
                     selected = "nbsGARCH"))

}



pageTitlePanel <- function ( ) {

  titlePanel(title = "Portal Project Forecasting")

}

pageSubtitlePanel <- function ( ) {

  href <- a(href = "http://portal.weecology.org", "The Portal Project", target = "_blank")
  p(HTML(paste0("Forecasts for the population and community dynamics of ", href, ".")))

}