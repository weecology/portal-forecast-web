library(portalcasting)

#Update data and models
setup_production(quiet = TRUE, verbose = FALSE)

#Update Website
rmarkdown::render_site()