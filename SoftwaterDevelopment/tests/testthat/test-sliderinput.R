HEAD
webElem <- remDr$findElement("css selector", "#reqcontrols input#range + .jslider")
sliderDim <- webElem$getElementSize()

remDr$mouseMoveToLocation(webElement = webElems[[x]])
remDr$buttondown()
remDr$mouseMoveToLocation(x = as.integer(pxToMoveSldr[x]), y = -1L)#, webElement = webElems[[x]])
remDr$buttonup()

testsel <- test_env()
with(testsel, rsel.opt <- list(nativeEvents = FALSE))

bcfcf521bcd34f42c6f7e87f0deaf2b13a77adda
test_dir(paste0(find.package("RSelenium"), "/apps/shinytestapp/tests/"), reporter = "Tap", filter = "slider", env = testsel)