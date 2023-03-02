
portalForecastServer <- function(input, output, session) {

  rv     <- initialReactiveValues( )
  output <- initialOutput(rv     = rv, 
                          output = output)

  observeEvent(eventExpr   = input$forecastTabSpecies,
               handlerExpr = eventReaction(eventName = "forecastTabSpecies", rv = rv, input = input, output = output, session = session))
  observeEvent(eventExpr   = input$forecastTabDataset,
               handlerExpr = eventReaction(eventName = "forecastTabDataset", rv = rv, input = input, output = output, session = session))


}

eventReaction <- function (eventName, rv, input, output, session) {

  rv     <- updateReactiveValues(eventName = eventName, rv = rv, input = input)
  output <- updateOutput(eventName = eventName, rv = rv, input = input, output = output)

  updateInput(eventName = eventName, rv = rv, input = input, session = session)

}

updateReactiveValues <- function (eventName, rv, input) {

  if (eventName == "forecastTabSpecies") {

    rv$forecastTabSpecies <- input$forecastTabSpecies
    rv$forecastTabDataset <- input$forecastTabDataset

  }
  if (eventName == "forecastTabDataset") {

    rv$forecastTabSpecies <- input$forecastTabSpecies
    rv$forecastTabDataset <- input$forecastTabDataset

  }

  rv

}

updateOutput <- function (eventName, rv, input, output) {

  if (eventName == "forecastTabSpecies") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)

  }
  if (eventName == "forecastTabDataset") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)

  }

  output

}

updateInput <- function (eventName, rv, input, output, session) {

  if (eventName == "forecastTabSpecies") {

    updateSelectInput(session = session, inputId = "forecastTabSpecies", choices = rodent_species(set = "base", type = "Latin"), selected = rv$forecastTabSpecies)
    updateSelectInput(session = session, inputId = "forecastTabDataset", choices = available_datasets(species = rv$forecastTabSpecies), selected = selected_dataset(species = rv$forecastTabSpecies, dataset = rv$forecastTabDataset))

  }
  if (eventName == "forecastTabDataset") {

    updateSelectInput(session = session, inputId = "forecastTabSpecies", choices = rodent_species(set = "base", type = "Latin"), selected = rv$forecastTabSpecies)
    updateSelectInput(session = session, inputId = "forecastTabDataset", choices = available_datasets(species = rv$forecastTabSpecies), selected = selected_dataset(species = rv$forecastTabSpecies, dataset = rv$forecastTabDataset))

  }

}

selected_dataset <- function (species, dataset) {

  available <- available_datasets(species = species)

  if (!(dataset %in% available)) {

    dataset <- available[1]

  }  

  dataset

}

available_datasets <- function (species) {

  possible <- prefab_datasets()
  if (grepl("Dipodomys", species)) {

    possible <- c("all", "controls")

  }
  possible

}

initialReactiveValues <- function ( ) {

  reactiveValues(forecastTabSpecies = "Dipodomys merriami", 
                 forecastTabDataset = "all")

}


initialOutput <- function (rv, output) {

  output

}