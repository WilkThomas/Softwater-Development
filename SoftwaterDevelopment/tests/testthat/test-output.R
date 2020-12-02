webElems <- remDr$findElements("css selector", "#reqplots .span5")
out <- sapply(webElems, function(x){x$getElementLocation()})