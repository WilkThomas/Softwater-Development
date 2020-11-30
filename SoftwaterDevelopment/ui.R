source('tabs.R')

ui <- fluidPage(
  #A selector bar to browse through themes
  shinythemes::themeSelector(),
  
  titlePanel("Softwater Development"), br(), br(),
  
  sidebarLayout(
    side, main)
)