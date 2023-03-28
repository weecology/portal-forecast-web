
portalForecastServer <- function(main = ".", input, output, session) {

  rv     <- initialReactiveValues( )
  output <- initialOutput(rv     = rv, 
                          output = output)

  observeEvent(eventExpr   = input$forecastTabSpecies,
               handlerExpr = eventReaction(main      = main, 
                                           eventName = "forecastTabSpecies", 
                                           rv        = rv, 
                                           input     = input, 
                                           output    = output, 
                                           session   = session))
  observeEvent(eventExpr   = input$forecastTabDataset,
               handlerExpr = eventReaction(main      = main, 
                                           eventName = "forecastTabDataset", 
                                           rv        = rv, 
                                           input     = input, 
                                           output    = output, 
                                           session   = session))
  observeEvent(eventExpr   = input$forecastTabModel,
               handlerExpr = eventReaction(main      = main, 
                                           eventName = "forecastTabModel", 
                                           rv        = rv, 
                                           input     = input, 
                                           output    = output, 
                                           session   = session))

  observeEvent(eventExpr   = input$evaluationTabSpecies,
               handlerExpr = eventReaction(main      = main, 
                                           eventName = "evaluationTabSpecies", 
                                           rv        = rv, 
                                           input     = input, 
                                           output    = output, 
                                           session   = session))
  observeEvent(eventExpr   = input$evaluationTabDataset,
               handlerExpr = eventReaction(main      = main, 
                                           eventName = "evaluationTabDataset", 
                                           rv        = rv, 
                                           input     = input, 
                                           output    = output, 
                                           session   = session))
  observeEvent(eventExpr   = input$evaluationTabModel,
               handlerExpr = eventReaction(main      = main, 
                                           eventName = "evaluationTabModel", 
                                           rv        = rv, 
                                           input     = input, 
                                           output    = output, 
                                           session   = session))

}

eventReaction <- function (main, eventName, rv, input, output, session) {

  rv     <- updateReactiveValues(eventName = eventName, 
                                 rv        = rv, 
                                 input     = input)


  output <- updateOutput(main      = main, 
                         eventName = eventName, 
                         rv        = rv, 
                         input     = input, 
                         output    = output)

  updateInput(eventName = eventName, 
              rv        = rv, 
              input     = input, 
              session   = session)

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

  if (eventName == "evaluationTabSpecies") {

    rv$evaluationTabSpecies <- input$evaluationTabSpecies
    rv$evaluationTabDataset <- input$evaluationTabDataset
    rv$evaluationTabModel   <- input$evaluationTabModel

  }
  if (eventName == "evaluationTabDataset") {

    rv$evaluationTabSpecies <- input$evaluationTabSpecies
    rv$evaluationTabDataset <- input$evaluationTabDataset
    rv$evaluationTabModel   <- input$evaluationTabModel

  }
  if (eventName == "evaluationTabModel") {

    rv$evaluationTabSpecies <- input$evaluationTabSpecies
    rv$evaluationTabDataset <- input$evaluationTabDataset
    rv$evaluationTabModel   <- input$evaluationTabModel

  }

  rv

}

updateOutput <- function (main, eventName, rv, input, output) {

  species_names <- rodent_species(set = "base", type = "table")

  if (eventName == "forecastTabSpecies") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)
    output$forecastTabTSPlot  <- renderPlot(plot_cast_ts(main    = main,
                                                         dataset = rv$forecastTabDataset,
                                                         species = toupper(species_names$abbreviation[species_names$Latin == rv$forecastTabSpecies]),
                                                         model   = rv$forecastTabModel))
    output$forecastTabSSPlot  <- renderPlot(plot_cast_point(main         = main,
                                                            dataset      = rv$forecastTabDataset,
                                                            highlight_sp = toupper(species_names$abbreviation[species_names$Latin == rv$forecastTabSpecies]),
                                                            model        = rv$forecastTabModel))

  }
  if (eventName == "forecastTabDataset") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)
    output$forecastTabTSPlot  <- renderPlot(plot_cast_ts(main    = main,
                                                         dataset = rv$forecastTabDataset,
                                                         species = toupper(species_names$abbreviation[species_names$Latin == rv$forecastTabSpecies]),
                                                         model   = rv$forecastTabModel))
    output$forecastTabSSPlot  <- renderPlot(plot_cast_point(main         = main,
                                                            dataset      = rv$forecastTabDataset,
                                                            highlight_sp = toupper(species_names$abbreviation[species_names$Latin == rv$forecastTabSpecies]),
                                                            model        = rv$forecastTabModel))

  }
  if (eventName == "forecastTabModel") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)
    output$forecastTabTSPlot  <- renderPlot(plot_cast_ts(main    = main,
                                                         dataset = rv$forecastTabDataset,
                                                         species = toupper(species_names$abbreviation[species_names$Latin == rv$forecastTabSpecies]),
                                                         model   = rv$forecastTabModel))
    output$forecastTabSSPlot  <- renderPlot(plot_cast_point(main         = main,
                                                            dataset      = rv$forecastTabDataset,
                                                            highlight_sp = toupper(species_names$abbreviation[species_names$Latin == rv$forecastTabSpecies]),
                                                            model        = rv$forecastTabModel))

  }

  if (eventName == "evaluationTabSpecies") {

    output$evaluationTabSpecies <- renderText(rv$evaluationTabSpecies)
    output$evaluationTabDataset <- renderText(rv$evaluationTabDataset)
    output$evaluationTabModel   <- renderText(rv$evaluationTabModel)
    output$evaluationTabSpPlot  <- renderPlot(plot_cast_point(main        = main,
                                                             dataset      = rv$evaluationTabDataset,
                                                             highlight_sp = toupper(species_names$abbreviation[species_names$Latin == rv$evaluationTabSpecies]),
                                                             model        = rv$evaluationTabModel,
                                                             with_census  = TRUE))
    output$evaluationTabRMSEPlot  <- renderPlot(plot_casts_cov_RMSE(main     = main,
                                                                    dataset  = rv$evaluationTabDataset,
                                                                    species  = toupper(species_names$abbreviation[species_names$Latin == rv$evaluationTabSpecies]),
                                                                    models   = rv$evaluationTabModel,
                                                                    ensemble = FALSE))
  }
  if (eventName == "evaluationTabDataset") {

    output$evaluationTabSpecies <- renderText(rv$evaluationTabSpecies)
    output$evaluationTabDataset <- renderText(rv$evaluationTabDataset)
    output$evaluationTabModel   <- renderText(rv$evaluationTabModel)
    output$evaluationTabSpPlot  <- renderPlot(plot_cast_point(main        = main,
                                                             dataset      = rv$evaluationTabDataset,
                                                             highlight_sp = toupper(species_names$abbreviation[species_names$Latin == rv$evaluationTabSpecies]),
                                                             model        = rv$evaluationTabModel,
                                                             with_census  = TRUE))
    output$evaluationTabRMSEPlot  <- renderPlot(plot_casts_cov_RMSE(main     = main,
                                                                    dataset  = rv$evaluationTabDataset,
                                                                    species  = toupper(species_names$abbreviation[species_names$Latin == rv$evaluationTabSpecies]),
                                                                    models   = rv$evaluationTabModel,
                                                                    ensemble = FALSE))

  }
  if (eventName == "evaluationTabModel") {

    output$evaluationTabSpecies <- renderText(rv$evaluationTabSpecies)
    output$evaluationTabDataset <- renderText(rv$evaluationTabDataset)
    output$evaluationTabModel   <- renderText(rv$evaluationTabModel)
    output$evaluationTabSpPlot  <- renderPlot(plot_cast_point(main        = main,
                                                             dataset      = rv$evaluationTabDataset,
                                                             highlight_sp = toupper(species_names$abbreviation[species_names$Latin == rv$evaluationTabSpecies]),
                                                             model        = rv$evaluationTabModel,
                                                             with_census  = TRUE))
    output$evaluationTabRMSEPlot  <- renderPlot(plot_casts_cov_RMSE(main     = main,
                                                                    dataset  = rv$evaluationTabDataset,
                                                                    species  = toupper(species_names$abbreviation[species_names$Latin == rv$evaluationTabSpecies]),
                                                                    models   = rv$evaluationTabModel,
                                                                    ensemble = FALSE))

  }


  output

}

updateInput <- function (eventName, rv, input, output, session) {

  if (eventName == "forecastTabSpecies") {

    updateSelectInput(session  = session, 
                      inputId  = "forecastTabSpecies", 
                      choices  = available_species(eventName = eventName,
                                                   rv        = rv),
                      selected = selected_species(eventName  = eventName,
                                                  rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabDataset", 
                      choices  = available_datasets(eventName = eventName,
                                                    rv        = rv),
                      selected = selected_dataset(eventName  = eventName,
                                                   rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabModel", 
                      choices  = available_models(eventName = eventName,
                                                  rv        = rv),
                      selected = selected_model(eventName  = eventName,
                                                rv         = rv))

  }
  if (eventName == "forecastTabDataset") {

    updateSelectInput(session  = session,
                      inputId  = "forecastTabDataset", 
                      choices  = available_datasets(eventName = eventName,
                                                    rv        = rv),
                      selected = selected_dataset(eventName  = eventName,
                                                  rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabModel", 
                      choices  = available_models(eventName = eventName,
                                                  rv        = rv),
                      selected = selected_model(eventName  = eventName,
                                                rv         = rv))
    updateSelectInput(session  = session, 
                      inputId  = "forecastTabSpecies", 
                      choices  = available_species(eventName = eventName,
                                                   rv        = rv),
                      selected = selected_species(eventName  = eventName,
                                                  rv         = rv))

  }
  if (eventName == "forecastTabModel") {

    updateSelectInput(session  = session,
                      inputId  = "forecastTabModel", 
                      choices  = available_models(eventName = eventName,
                                                  rv        = rv),
                      selected = selected_model(eventName  = eventName,
                                                rv         = rv))
    updateSelectInput(session  = session, 
                      inputId  = "forecastTabSpecies", 
                      choices  = available_species(eventName = eventName,
                                                   rv        = rv),
                      selected = selected_species(eventName  = eventName,
                                                  rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "forecastTabDataset", 
                      choices  = available_datasets(eventName = eventName,
                                                    rv        = rv),
                      selected = selected_dataset(eventName  = eventName,
                                                  rv         = rv))

  }

  if (eventName == "evaluationTabSpecies") {

    updateSelectInput(session  = session, 
                      inputId  = "evaluationTabSpecies", 
                      choices  = available_species(eventName = eventName,
                                                   rv        = rv),
                      selected = selected_species(eventName  = eventName,
                                                  rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "evaluationTabDataset", 
                      choices  = available_datasets(eventName = eventName,
                                                    rv        = rv),
                      selected = selected_dataset(eventName  = eventName,
                                                   rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "evaluationTabModel", 
                      choices  = available_models(eventName = eventName,
                                                  rv        = rv),
                      selected = selected_model(eventName  = eventName,
                                                rv         = rv))

  }
  if (eventName == "evaluationTabDataset") {

    updateSelectInput(session  = session,
                      inputId  = "evaluationTabDataset", 
                      choices  = available_datasets(eventName = eventName,
                                                    rv        = rv),
                      selected = selected_dataset(eventName  = eventName,
                                                  rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "evaluationTabModel", 
                      choices  = available_models(eventName = eventName,
                                                  rv        = rv),
                      selected = selected_model(eventName  = eventName,
                                                rv         = rv))
    updateSelectInput(session  = session, 
                      inputId  = "evaluationTabSpecies", 
                      choices  = available_species(eventName = eventName,
                                                   rv        = rv),
                      selected = selected_species(eventName  = eventName,
                                                  rv         = rv))


  }
  if (eventName == "evaluationTabModel") {

    updateSelectInput(session  = session,
                      inputId  = "evaluationTabModel", 
                      choices  = available_models(eventName = eventName,
                                                  rv        = rv),
                      selected = selected_model(eventName  = eventName,
                                                rv         = rv))
    updateSelectInput(session  = session, 
                      inputId  = "evaluationTabSpecies", 
                      choices  = available_species(eventName = eventName,
                                                   rv        = rv),
                      selected = selected_species(eventName  = eventName,
                                                  rv         = rv))
    updateSelectInput(session  = session,
                      inputId  = "evaluationTabDataset", 
                      choices  = available_datasets(eventName = eventName,
                                                    rv        = rv),
                      selected = selected_dataset(eventName  = eventName,
                                                   rv         = rv))


  }

}





selected_model <- function (eventName, 
                            rv) {

  available <- available_models(eventName = eventName, 
                                rv        = rv)

  if (grepl("forecastTab", eventName)) {
    model     <- rv$forecastTabModel
  }
  if (grepl("evaluationTab", eventName)) {
    model     <- rv$evaluationTabModel
  }

  if (!(model %in% available)) {

    model <- available[1]

  }  

  model

}

available_models <- function (eventName, 
                              rv) {

  possible <- model_list()

    if (grepl("forecastTab", eventName)) {

    if (rv$forecastTabSpecies == "Dipodomys merriami" & 
        rv$forecastTabDataset == "controls") {
 
      possible <- possible

    } else {

      possible <- possible[!grepl("jags", possible)]

    }

  }

  if (grepl("evaluationTab", eventName)) {

    if (rv$evaluationTabSpecies == "Dipodomys merriami" & 
        rv$evaluationTabDataset == "controls") {

      possible <- possible

    } else {

      possible <- possible[!grepl("jags", possible)]

    }
  }
  possible

}




selected_species <- function (eventName,
                              rv) {

  available <- available_species(eventName = eventName,
                                 rv        = rv)
  
  if (grepl("forecastTab", eventName)) {
    species   <- rv$forecastTabSpecies
  }
  if (grepl("evaluationTab", eventName)) {
    species   <- rv$evaluationTabSpecies
  }

  if (!(species %in% available)) {

    species <- available[1]

  }  

  species

}


available_species <- function (eventName,
                               rv) {

  possible <- rodent_species(set = "base", type = "Latin")


  if (grepl("forecastTab", eventName)) {

    if (rv$forecastTabDataset == "exclosures") {

      possible <- possible[!grepl("Dipodomys", possible)]

    }
    if (grepl("jags", rv$forecastTabModel)) {

      possible <- "Dipodomys merriami"

    }

  }

  if (grepl("evaluationTab", eventName)) {

    if (rv$evaluationTabDataset == "exclosures") {

      possible <- possible[!grepl("Dipodomys", possible)]

    }
    if (grepl("jags", rv$evaluationTabModel)) {

      possible <- "Dipodomys merriami"

    }
  }

  possible

}


selected_dataset <- function (eventName,
                              rv) {

  available <- available_datasets(eventName = eventName,
                                  rv        = rv)


  if (grepl("forecastTab", eventName)) {
    dataset   <- rv$forecastTabDataset
  }
  if (grepl("evaluationTab", eventName)) {
    dataset   <- rv$evaluationTabDataset
  }

  if (!(dataset %in% available)) {

    dataset <- available[1]

  }  

  dataset

}

available_datasets <- function (eventName,
                                rv) {

  possible <- prefab_datasets()

  if (grepl("forecastTab", eventName)) {

    if (grepl("Dipodomys", rv$forecastTabSpecies)) {

      possible <- c("all", "controls")

    }
    if (grepl("jags", rv$forecastTabModel)) {

      possible <- "controls"
 
    }
  
  }
  if (grepl("evaluationTab", eventName)) {

    if (grepl("Dipodomys", rv$evaluationTabSpecies)) {

      possible <- c("all", "controls")

    }
    if (grepl("jags", rv$evaluationTabModel)) {

      possible <- "controls"
 
    }
  
  }


  possible

}

initialReactiveValues <- function ( ) {

  reactiveValues(forecastTabSpecies   = "Dipodomys merriami", 
                 forecastTabDataset   = "all", 
                 forecastTabModel     = "nbsGARCH",
                 evaluationTabSpecies = "Dipodomys merriami", 
                 evaluationTabDataset = "all", 
                 evaluationTabModel   = "nbsGARCH")

}


initialOutput <- function (rv, output) {

  output

}