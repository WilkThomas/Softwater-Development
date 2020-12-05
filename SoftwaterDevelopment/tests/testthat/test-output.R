HEAD

webElems <- remDr$findElements("css selector", "#reqplots .span5")
bcfcf521bcd34f42c6f7e87f0deaf2b13a77adda
out <- sapply(webElems, function(x){x$getElementLocation()})