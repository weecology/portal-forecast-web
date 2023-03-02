

portalForecastServer <- function (input, output, session) {


}


updateInput <- function (rv,
                         input, 
                         session) {

  updateSelectizeInput(session  = session,
                       inputId  = "forecastTabSpecies",
                       choices  = species_names$Latin,
                       selected = rv$forecastTabSpecies)


}




updateOutput <- function (output,
                          input) {

  output$forecastTabSpecies <- renderText(input$forecastTabSpecies)

  output

}

