library(shiny)
library(ggplot2)
library(devtools)
library(dplyr)
library(DT)
library(maps)
library(mapproj)
library(rsconnect)

#IMPORTANT - copy this line of code to the console to input the data
data <- read.csv("USGSPWDBv2.3n.csv")

source('ui.R', local = TRUE)
source('server.R')

#runs the app
shinyApp(ui = ui, server = server)