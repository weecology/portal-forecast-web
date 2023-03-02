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
           textOutput("x"))

}


forecastTabInputSelectionRow <- function ( ) {


  fluidRow(forecastTabInputSelectionRowSpecies( ),
           forecastTabInputSelectionRowx( ))



}


forecastTabInputSelectionRowSpecies <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "forecastTabSpecies",
                     label    = "Species",
                     choices  = rodent_species(set = "base", type = "Latin"),
                     selected = "Dipodomys merriami"))

}

forecastTabInputSelectionRowx <- function ( ) {

  column(width = 4,
         selectInput(inputId  = "x",
                     label    = "TESTX",
                     choices  = letters,
                     selected = "d"))

}



pageTitlePanel <- function ( ) {

  titlePanel(title = "Portal Project Forecasting")

}

pageSubtitlePanel <- function ( ) {

  href <- a(href = "http://portal.weecology.org", "The Portal Project", target = "_blank")
  p(HTML(paste0("Forecasts for the population and community dynamics of ", href, ".")))

}