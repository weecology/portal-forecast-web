# does app directory exist with necessary content to build a full website?

test_wrap_function <- function(main = ".") {

  app_exists <- file.exists(main)
  update_dir(main = main)
  global <- portalcasting::global_list(main = main)

}
test_wrap_function()