# does app directory exist with necessary content to build a full website?

library(portalcasting)

test_wrap_function <- function(main = ".") {

  app_exists <- file.exists(main)
  update_dir(main = main)
  global <- global_list(main = main)

}
test_wrap_function()