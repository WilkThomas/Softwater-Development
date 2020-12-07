library(shiny)
library(shinythemes)
source('tabs.R')

data <- read.csv("USGSPWDBv2.3n.csv")

ui <- fluidPage(
  
  #A selector bar to browse through themes
  theme = shinytheme("flatly"),
  
  tags$head(tags$style(HTML('.js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                                                  background: #2C3E50;
                                                  border-top: 1px solid #000039 ;
                                                  border-bottom: 1px solid #000039 ;}

                            /* changes the colour of the number tags */
                           .irs-from, .irs-to, .irs-single { background: #2C3E50 }'
  ))
  ),
  
  navbarPage("Softwater Development"),
  
  titlePanel(title = "USGS Water Quality"), br(), br(),
  
  sidebarLayout(
    side, main)
)
