context("basic")

library(RSelenium)
library(testthat)

remDr <- remoteDriver()
remDr$open(silent = TRUE)
appURL <- "http://127.0.0.1:6012"

test_that("can connect to app", {  
  remDr$navigate(appURL)
  appTitle <- remDr$getTitle()[[1]]
  expect_equal(appTitle, "Softwater Development")  
})

remDr$close()

test_that("controls are present", {  
  webElems <- remDr$findElements("css selector", "#ctrlSelect label")
  appCtrlLabels <- sapply(webElems, function(x){x$getElementText()})
  expect_equal(appCtrlLabels[[1]], "Select controls required:")  
  expect_equal(appCtrlLabels[[2]], "radioButtons")  
  expect_equal(appCtrlLabels[[3]], "selectInput")  
  expect_equal(appCtrlLabels[[4]], "sliderInput")  
})

test_that("tabs are present", {  
  webElems <- remDr$findElements("css selector", ".nav a")
  appTabLabels <- sapply(webElems, function(x){x$getElementText()})
  expect_equal(appTabLabels[[1]], "Plot")  
  expect_equal(appTabLabels[[2]], "Summary") 
  expect_equal(appTabLabels[[3]], "Table")
})