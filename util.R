library(shiny)
library(portalcasting)


# Render Rmd files
rmarkdown::render("models.Rmd")

# Data setup

# Need to set this up to only run periodically external
# to the shiny app
# setup_production()

# Get lists of species as both abbreviations and scientific names

species_names <- rodent_species(set = "base", type = "table")

model_list <- c(prefab_models(), "Ensemble")
model_list <- model_list[model_list %in% c("jags_logistic", "jags_logistic_covariates")]
