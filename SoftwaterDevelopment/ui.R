source('tabs.R')

ui <- fluidPage(
  #A selector bar to browse through themes
  theme = shinytheme("flatly"),
  
  titlePanel("Softwater Development"), br(), br(),
  
  sidebarLayout(
    side, main)
)