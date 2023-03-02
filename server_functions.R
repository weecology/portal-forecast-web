
portalForecastServer <- function(input, output, session) {

  rv     <- initialReactiveValues( )
  output <- initialOutput(rv     = rv, 
                          output = output)

  observeEvent(eventExpr   = input$forecastTabSpecies,
               handlerExpr = eventReaction(eventName = "forecastTabSpecies", rv = rv, input = input, output = output, session = session))
#  observeEvent(eventExpr   = input$x,
#               handlerExpr = eventReaction(eventName = "x", rv = rv, input = input, output = output, session = session))


}

eventReaction <- function (eventName, rv, input, output, session) {

  rv     <- updateReactiveValues(eventName = eventName, rv = rv, input = input)
  output <- updateOutput(eventName = eventName, rv = rv, input = input, output = output)

  updateInput(eventName = eventName, rv = rv, input = input, session = session)

}

updateReactiveValues <- function (eventName, rv, input) {

  if (eventName == "forecastTabSpecies") {

    rv$forecastTabSpecies <- input$forecastTabSpecies
    rv$x <- tolower(substr(rv$forecastTabSpecies, 1, 1))

  }

  rv

}

updateOutput <- function (eventName, rv, input, output) {

  if (eventName == "forecastTabSpecies") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)

    output$x <- renderText(rv$x)

  }

}

updateInput <- function (eventName, rv, input, output, session) {

  if (eventName == "forecastTabSpecies") {

    updateSelectInput(session = session, inputId = "forecastTabSpecies", choices = rodent_species(set = "base", type = "Latin"), selected = rv$forecastTabSpecies)
    updateSelectInput(session = session, inputId = "x", choices = letters, selected = rv$x)

  }

}



initialReactiveValues <- function ( ) {

  reactiveValues(forecastTabSpecies = "Dipodomys merriami")

}


initialOutput <- function (rv, output) {

  output

}