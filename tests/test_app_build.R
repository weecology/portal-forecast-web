# does app directory exist with necessary content to build a full website?

test_wrap_function <- function(main = ".") {

  app_exists <- file.exists(main)

  global <- global_list(main = main)

}
test_wrap_function()