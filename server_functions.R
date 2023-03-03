
portalForecastServer <- function(input, output, session) {

  rv     <- initialReactiveValues( )
  output <- initialOutput(rv     = rv, 
                          output = output)

  observeEvent(eventExpr   = input$forecastTabSpecies,
               handlerExpr = eventReaction(eventName = "forecastTabSpecies", rv = rv, input = input, output = output, session = session))
  observeEvent(eventExpr   = input$forecastTabDataset,
               handlerExpr = eventReaction(eventName = "forecastTabDataset", rv = rv, input = input, output = output, session = session))
  observeEvent(eventExpr   = input$forecastTabModel,
               handlerExpr = eventReaction(eventName = "forecastTabModel", rv = rv, input = input, output = output, session = session))


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
    rv$forecastTabModel   <- input$forecastTabModel

  }
  if (eventName == "forecastTabDataset") {

    rv$forecastTabSpecies <- input$forecastTabSpecies
    rv$forecastTabDataset <- input$forecastTabDataset
    rv$forecastTabModel   <- input$forecastTabModel

  }
  if (eventName == "forecastTabModel") {

    rv$forecastTabSpecies <- input$forecastTabSpecies
    rv$forecastTabDataset <- input$forecastTabDataset
    rv$forecastTabModel   <- input$forecastTabModel

  }

  rv

}

updateOutput <- function (eventName, rv, input, output) {

  if (eventName == "forecastTabSpecies") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)

  }
  if (eventName == "forecastTabDataset") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)

  }
  if (eventName == "forecastTabModel") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)

  }


  output

}

updateInput <- function (eventName, rv, input, output, session) {

  if (eventName == "forecastTabSpecies") {

    updateSelectInput(session  = session, 
                      inputId  = "forecastTabSpecies", 
                      choices  = available_species(rv = rv),
                      selected = selected_species(rv = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabDataset", 
                      choices  = available_datasets(rv = rv),
                      selected = selected_dataset(rv = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabModel", 
                      choices  = available_models(rv = rv),
                      selected = selected_model(rv = rv))

  }
  if (eventName == "forecastTabDataset") {

    updateSelectInput(session  = session,
                      inputId  = "forecastTabDataset", 
                      choices  = available_datasets(rv = rv), 
                      selected = selected_dataset(rv = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabModel", 
                      choices  = available_models(rv = rv),
                      selected = selected_model(rv = rv))
    updateSelectInput(session  = session, 
                      inputId  = "forecastTabSpecies", 
                      choices  = available_species(rv = rv),
                      selected = selected_species(rv = rv))

  }
  if (eventName == "forecastTabModel") {

    updateSelectInput(session  = session,
                      inputId  = "forecastTabModel", 
                      choices  = available_models(rv = rv), 
                      selected = selected_model(rv = rv))
    updateSelectInput(session  = session, 
                      inputId  = "forecastTabSpecies", 
                      choices  = available_species(rv = rv),
                      selected = selected_species(rv = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabDataset", 
                      choices  = available_datasets(rv = rv),
                      selected = selected_dataset(rv = rv))

  }

}


selected_model <- function (rv) {

  available <- available_models(rv = rv)
  model     <- rv$forecastTabModel

  if (!(model %in% available)) {

    model <- available[1]

  }  

  model

}

available_models <- function (rv) {

  possible <- prefab_models()

  if (rv$forecastTabSpecies == "Dipodomys merriami" & 
      rv$forecastTabDataset == "controls") {

    possible <- possible

  } else {


    possible <- possible[!grepl("jags", possible)]

  }

  possible

}


selected_species <- function (rv) {

  available <- available_species(rv = rv)
  species   <- rv$forecastTabSpecies

  if (!(species %in% available)) {

    species <- available[1]

  }  

  species

}


available_species <- function (rv) {

  possible <- rodent_species(set = "base", type = "Latin")
  if (rv$forecastTabDataset == "exclosures") {

    possible <- possible[!grepl("Dipodomys", possible)]

  }
  if (grepl("jags", rv$forecastTabModel)) {

    possible <- "Dipodomys merriami"

  }
  possible

}


selected_dataset <- function (rv) {

  available <- available_datasets(rv = rv)
  dataset   <- rv$forecastTabDataset

  if (!(dataset %in% available)) {

    dataset <- available[1]

  }  

  dataset

}

available_datasets <- function (rv) {

  possible <- prefab_datasets()
  if (grepl("Dipodomys", rv$forecastTabSpecies)) {

    possible <- c("all", "controls")

  }
  if (grepl("jags", rv$forecastTabModel)) {

    possible <- "controls"

  }
  possible

}

initialReactiveValues <- function ( ) {

  reactiveValues(forecastTabSpecies = "Dipodomys merriami", 
                 forecastTabDataset = "all", 
                 forecastTabModel   = "nbsGARCH")

}


initialOutput <- function (rv, output) {

  output

}