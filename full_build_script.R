library(shiny)
library(portalcasting)

rmarkdown::render("models.Rmd")
source("profile_html.R")

shiny::runApp()