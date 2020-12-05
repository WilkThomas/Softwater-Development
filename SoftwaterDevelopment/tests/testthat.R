<<<<<<< HEAD
library(testthat)

test_dir(
  "./testthat",
  # Run in the app's environment containing all support methods.
  env = shiny::loadSupport(),
  # Display the regular progress output and throw an error if any test error is found
  reporter = c("progress", "fail")
)
=======
library(testthat)

test_dir(
  "./testthat",
  # Run in the app's environment containing all support methods.
  env = shiny::loadSupport(),
  # Display the regular progress output and throw an error if any test error is found
  reporter = c("progress", "fail")
)
>>>>>>> bcfcf521bcd34f42c6f7e87f0deaf2b13a77adda
