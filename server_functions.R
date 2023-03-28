
portalForecastServer <- function(main = "~/portalcasting", input, output, session) {

  rv     <- initialReactiveValues(main = main)
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

  rv     <- updateReactiveValues(main      = main, 
                                 eventName = eventName, 
                                 rv        = rv, 
                                 input     = input)


  output <- updateOutput(main      = main, 
                         eventName = eventName, 
                         rv        = rv, 
                         input     = input, 
                         output    = output)

  updateInput(main      = main, 
              eventName = eventName, 
              rv        = rv, 
              input     = input, 
              session   = session)

}

updateReactiveValues <- function (main, eventName, rv, input) {

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


  if (eventName == "forecastTabSpecies") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)
    output$forecastTabTSPlot  <- renderPlot(plot_cast_ts(main    = main,
                                                         dataset = rv$forecastTabDataset,
                                                         species = rv$forecastTabSpecies,
                                                         model   = rv$forecastTabModel))
    output$forecastTabSSPlot  <- renderPlot(plot_cast_point(main         = main,
                                                            dataset      = rv$forecastTabDataset,
                                                            highlight_sp = rv$forecastTabSpecies,
                                                            model        = rv$forecastTabModel))

  }
  if (eventName == "forecastTabDataset") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)
    output$forecastTabTSPlot  <- renderPlot(plot_cast_ts(main    = main,
                                                         dataset = rv$forecastTabDataset,
                                                         species = rv$forecastTabSpecies,
                                                         model   = rv$forecastTabModel))
    output$forecastTabSSPlot  <- renderPlot(plot_cast_point(main         = main,
                                                            dataset      = rv$forecastTabDataset,
                                                            highlight_sp = rv$forecastTabSpecies,
                                                            model        = rv$forecastTabModel))

  }
  if (eventName == "forecastTabModel") {

    output$forecastTabSpecies <- renderText(rv$forecastTabSpecies)
    output$forecastTabDataset <- renderText(rv$forecastTabDataset)
    output$forecastTabModel   <- renderText(rv$forecastTabModel)
    output$forecastTabTSPlot  <- renderPlot(plot_cast_ts(main    = main,
                                                         dataset = rv$forecastTabDataset,
                                                         species = rv$forecastTabSpecies,
                                                         model   = rv$forecastTabModel))
    output$forecastTabSSPlot  <- renderPlot(plot_cast_point(main         = main,
                                                            dataset      = rv$forecastTabDataset,
                                                            highlight_sp = rv$forecastTabSpecies,
                                                            model        = rv$forecastTabModel))

  }

  if (eventName == "evaluationTabSpecies") {

    output$evaluationTabSpecies <- renderText(rv$evaluationTabSpecies)
    output$evaluationTabDataset <- renderText(rv$evaluationTabDataset)
    output$evaluationTabModel   <- renderText(rv$evaluationTabModel)
    output$evaluationTabSpPlot  <- renderPlot(plot_cast_point(main        = main,
                                                             dataset      = rv$evaluationTabDataset,
                                                             highlight_sp = rv$evaluationTabSpecies,
                                                             model        = rv$evaluationTabModel,
                                                             with_census  = TRUE))
    output$evaluationTabRMSEPlot  <- renderPlot(plot_casts_cov_RMSE(main     = main,
                                                                    dataset  = rv$evaluationTabDataset,
                                                                    species  = rv$evaluationTabSpecies,
                                                                    models   = rv$evaluationTabModel))
  }
  if (eventName == "evaluationTabDataset") {

    output$evaluationTabSpecies <- renderText(rv$evaluationTabSpecies)
    output$evaluationTabDataset <- renderText(rv$evaluationTabDataset)
    output$evaluationTabModel   <- renderText(rv$evaluationTabModel)
    output$evaluationTabSpPlot  <- renderPlot(plot_cast_point(main        = main,
                                                             dataset      = rv$evaluationTabDataset,
                                                             highlight_sp = rv$evaluationTabSpecies,
                                                             model        = rv$evaluationTabModel,
                                                             with_census  = TRUE))
    output$evaluationTabRMSEPlot  <- renderPlot(plot_casts_cov_RMSE(main     = main,
                                                                    dataset  = rv$evaluationTabDataset,
                                                                    species  = rv$evaluationTabSpecies,
                                                                    models   = rv$evaluationTabModel))

  }
  if (eventName == "evaluationTabModel") {

    output$evaluationTabSpecies <- renderText(rv$evaluationTabSpecies)
    output$evaluationTabDataset <- renderText(rv$evaluationTabDataset)
    output$evaluationTabModel   <- renderText(rv$evaluationTabModel)
    output$evaluationTabSpPlot  <- renderPlot(plot_cast_point(main        = main,
                                                             dataset      = rv$evaluationTabDataset,
                                                             highlight_sp = rv$evaluationTabSpecies,
                                                             model        = rv$evaluationTabModel,
                                                             with_census  = TRUE))
    output$evaluationTabRMSEPlot  <- renderPlot(plot_casts_cov_RMSE(main     = main,
                                                                    dataset  = rv$evaluationTabDataset,
                                                                    species  = rv$evaluationTabSpecies,
                                                                    models   = rv$evaluationTabModel))

  }


  output

}

updateInput <- function (main, eventName, rv, input, output, session) {

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

  model_list()[model_list() %in% model]

}

available_models <- function (eventName, 
                              rv) {

  all_possible <- unique(rv$casts_metadata$model[rv$casts_metadata$model %in% prefab_models()])

  if (grepl("forecastTab", eventName)) {

    possible <- unique(rv$casts_metadata$model[rv$casts_metadata$species == rv$forecastTabSpecies &
                                               rv$casts_metadata$dataset == rv$forecastTabDataset])
  }

  if (grepl("evaluationTab", eventName)) {

    possible <- unique(rv$casts_metadata$model[rv$casts_metadata$species == rv$evaluationTabSpecies &
                                               rv$casts_metadata$dataset == rv$evaluationTabDataset])

  }

  models <- possible[possible %in% all_possible]
  model_list()[model_list() %in% models]

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

  species_list()[species_list() %in% species]

}


available_species <- function (eventName, 
                               rv) {

  all_possible <- unique(rv$casts_metadata$species[rv$casts_metadata$species %in% rodent_species(set = "forecasting", type = "code", total = TRUE)])

  if (grepl("forecastTab", eventName)) {

    possible <- unique(rv$casts_metadata$species[rv$casts_metadata$model   == rv$forecastTabModel &
                                                 rv$casts_metadata$dataset == rv$forecastTabDataset])
  }

  if (grepl("evaluationTab", eventName)) {

    possible <- unique(rv$casts_metadata$species[rv$casts_metadata$model == rv$evaluationTabModel &
                                                 rv$casts_metadata$dataset == rv$evaluationTabDataset])

  }

  species <- possible[possible %in% all_possible]
  species_list()[species_list() %in% species]

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

available_datasets <- function (main,
                                eventName, 
                                rv) {

  all_possible <- unique(rv$casts_metadata$dataset[rv$casts_metadata$dataset %in% prefab_datasets()])

  if (grepl("forecastTab", eventName)) {

    possible <- unique(rv$casts_metadata$dataset[rv$casts_metadata$model   == rv$forecastTabModel &
                                                 rv$casts_metadata$species == rv$forecastTabSpecies])
  }

  if (grepl("evaluationTab", eventName)) {

    possible <- unique(rv$casts_metadata$dataset[rv$casts_metadata$model   == rv$evaluationTabModel &
                                                 rv$casts_metadata$species == rv$evaluationTabSpecies])

  }

  possible[possible %in% all_possible]

}

initialReactiveValues <- function (main = ".") {
 
  casts_metadata <- read_casts_metadata(main = main)

  reactiveValues(forecastTabSpecies   = "DM", 
                 forecastTabDataset   = "all", 
                 forecastTabModel     = "AutoArima",
                 evaluationTabSpecies = "DM",
                 evaluationTabDataset = "all", 
                 evaluationTabModel   = "AutoArima",
                 casts_metadata       = casts_metadata)

}


initialOutput <- function (rv, output) {

  output

}