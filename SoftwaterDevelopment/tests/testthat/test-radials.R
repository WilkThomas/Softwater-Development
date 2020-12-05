HEAD
context("controls")

library(RSelenium)
library(testthat)

remDr <- remoteDriver()
remDr$open(silent = TRUE)
sysDetails <- remDr$getStatus()
browser <- remDr$sessionInfo$browserName
appURL <- "http://127.0.0.1:6012"

test_that("can select/deselect radio buttonssni", {  
  remDr$navigate(appURL)
  webElem <- remDr$findElement("css selector", "#ctrlSelect1")
  initState <- webElem$isElementSelected()[[1]]
  # check if we can select/deselect
  if(browser == "internet explorer"){
    webElem$sendKeysToElement(list(key = "space"))
  }else{
    webElem$clickElement()
  }
  changeState <- webElem$isElementSelected()[[1]]
  expect_is(initState, "logical")  
  expect_is(changeState, "logical")  
  expect_false(initState == changeState)  
})

bcfcf521bcd34f42c6f7e87f0deaf2b13a77adda
remDr$close()