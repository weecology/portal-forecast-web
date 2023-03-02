
portalForecastServer <- function(input, output) {


  forecastTabSpeciesInput <- reactive({

    species_options        <- as.list(rodent_species(set = "base", type = "Latin"))
    names(species_options) <- rodent_species(set = "base", type = "abbreviation")

    switch(EXPR = input$forecastTabSpecies,
           ...  = species_options)

  })

  forecastTabDatasetInput <- reactive({

    dataset_options        <- as.list(prefab_datasets())
    names(dataset_options) <- prefab_datasets()

    switch(EXPR = input$forecastTabDataset,
           ...  = dataset_options)

  })

  forecastTabModelInput <- reactive({

    model_options        <- as.list(prefab_models())
    names(model_options) <- prefab_models()

    switch(EXPR = input$forecastTabModel,
           ...  = model_options)

  })


  output$forecastTabSpecies <- renderText({

    input$forecastTabSpecies

  })

  output$forecastTabDataset <- renderText({

    input$forecastTabDataset

  })

  output$forecastTabModel <- renderText({

    input$forecastTabModel

  })


}