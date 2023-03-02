source("util.R")

# Define server logic required

server <- function(input, output, main = ".") {

  output$main_plot <- renderPlot({

    plot_cast_ts(main    = main, 
                 dataset = tolower(input$treatment), 
                 species = toupper(species_names$abbreviation[species_names$Latin == input$species]), 
                 model   = input$model)

  })

  output$species_summary_plot <- renderPlot({

    plot_cast_point(main         = main, 
                    dataset      = tolower(input$treatment),
                    highlight_sp = toupper(species_names$abbreviation[species_names$Latin == input$species]), 
                    model        = input$model)


  })

  output$report_species_summary_plot <- renderPlot({

    plot_cast_point(main        = main, 
                    dataset     = tolower(input$treatment_report), 
                    model       = input$model_report,
                    with_census = TRUE)

  })

  output$RMSE <- renderPlot({

    plot_casts_cov_RMSE(main     = main, 
                        models   = input$model_report,
                        species  = toupper(species_names$abbreviation[species_names$Latin == input$species_report]),
                        ensemble = FALSE)
  })

}