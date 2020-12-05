<<<<<<< HEAD
context("basic")

library(testthat)
library(RSelenium)

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
=======
context("basic")

library(testthat)
library(RSelenium)

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
>>>>>>> bcfcf521bcd34f42c6f7e87f0deaf2b13a77adda
})