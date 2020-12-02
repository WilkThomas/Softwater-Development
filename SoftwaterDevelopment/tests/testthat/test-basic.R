context("basic")

library(testthat)
library(RSelenium)

remDr <- remoteDriver()
remDr$open(silent = TRUE)
appURL <- "http://127.0.0.1:6012"

test_that("can connect to app", {  
  remDr$navigate(appURL)
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(titlePanel, "Softwater Development")  
})

remDr$close()

test_that("controls are present", {  
  webElems <- remDr$findElements("css selector", "#ctrlSelect label")
  appCtrlLabels <- sapply(webElems, function(x){x$getElementText()})
  expect_equal(appCtrlLabels[[1]], "radioButtons")  
  expect_equal(appCtrlLabels[[2]], "selectInput")  
  expect_equal(appCtrlLabels[[3]], "sliderInput")  
})

test_that("tabs are present", {  
  webElems <- remDr$findElements("css selector", ".nav a")
  appTabLabels <- sapply(webElems, function(x){x$getElementText()})
  expect_equal(appTabLabels[[1]], "Plot")  
  expect_equal(appTabLabels[[2]], "Summary") 
  expect_equal(appTabLabels[[3]], "Table")
})