# Define server logic required
server <- function(input, output) {

output$main_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_ts(dataset = tolower(input$treatment), model = input$model) 
  } else {
    species <- species_names$abbreviation[species_names$Latin == input$species]
    p <- plot_cast_ts(dataset = tolower(input$treatment), species = toupper(species), model = input$model)
  }
  p
})

output$species_summary_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_point(dataset = tolower(input$treatment),
                         highlight_sp = ("total"))
  } else {
    species <- species_names$abbreviation[species_names$Latin == input$species]
    p <- plot_cast_point(dataset = tolower(input$treatment),
                         highlight_sp = toupper(species))
  }
  p
})

output$report_main_plot <- renderPlot({
  if (input$species == "All") {
    p <- plot_cast_ts(dataset = tolower(input$treatment))
  } else {
    species <- species_names$abbreviation[species_names$Latin == input$species]
    p <- plot_cast_ts(dataset = tolower(input$treatment),
                      species = toupper(species))
  }
  p
})

output$report_species_summary_plot <- renderPlot({
  p <- plot_cast_point(dataset = tolower(input$treatment_report), model = input$model_report,
                       with_census = TRUE) 
})

output$RMSE <- renderPlot({
  species_report <- species_names$abbreviation[species_names$Latin == input$species_report]
  p <- plot_casts_cov_RMSE(models = input$model_report,
         species = toupper(species_report),
         ensemble = TRUE)
})

}