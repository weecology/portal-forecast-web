
library(shiny)
library(portalcasting)


# Render Rmd files
rmarkdown::render("models.Rmd")

# Data setup

main <- "app"

setup_production(main = main)

# Get lists of species as both abbreviations and scientific names

species_names <- rodent_species(set = "base", type = "table")

model_list <- c(prefab_models(), "Ensemble")
model_list <- model_list[!(model_list %in% c("jags_logistic", "jags_logistic_covariates"))]

# Run the application 
runApp(appDir = main)
