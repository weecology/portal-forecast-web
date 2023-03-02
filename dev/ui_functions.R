portalForecastUI <- function ( ) {

  fluidPage(pageTitlePanel( ),
            pageSubtitlePanel( ),
            pageMainPanel( ))

}

pageMainPanel <- function ( ) {

  mainPanel(tabsetPanel(forecastTab( )))
}

forecastTab <- function ( ) {

  tabPanel("Forecast",
           br(),
           inputSelectionRow( ), 
           outputTestRow( ))

}

outputTestRow <- function ( ) {

  textOutput("forecastTabSpecies")

}

inputSelectionRow <- function ( ) {

  fluidRow(column(width = 4,
                  selectInput(inputId  = "forecastTabSpecies",
                              label    = "Species",
                              choices  = rodent_species(set = "base", type = "Latin"),
                              selected = "Dipodomys merriami")))

}


pageTitlePanel <- function ( ) {

  titlePanel(title = "Portal Project Forecasting")

}

pageSubtitlePanel <- function ( ) {

  href <- a(href = "http://portal.weecology.org", "The Portal Project", target = "_blank")
  p(HTML(paste0("Forecasts for the population and community dynamics of ", href, ".")))

}