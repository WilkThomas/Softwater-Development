#Variable for what to search by on UI either Basin, State, or County
searchBy <- radioButtons("searchBy", "Search by:", c("Basin", "State","County"))

#Variable for time slider on UI
timeRange <- sliderInput(inputId = "my_dates",label = "Date Range",min = 1905,
                         max = 2014,
                         value = c(1905, 2014), sep='')

#Variable for target drop down on UI
target <- selectInput(inputId = "select_query", h3("Target"), choices = c('Al', 'ALKHCO3', 'B', 'Br', 'CO3', 'Ca', 'Cl', 'Cu', 'F', 'FeTot', 'HCO3', 'I', 'K', 'Li', 'Mg', 'Mn', 'N', 'NO3', 'Na', 'P', 'PH', 'SO4', 'Si', 'TDS', 'TSS'), selected = 'TDS')

#Add the input variables and a title to the side panel of the user interface
side <- sidebarPanel('Options', searchBy,uiOutput("ui"), timeRange, target)

#Variable for Label in Main frame on GUI
out1 <- textOutput('basin_label')

#Variable for plot in the main frame on GUI
out2 <- plotOutput('basin_plot')


#Add the title, and outputs to the main frame on GUI
main <- mainPanel("Title", out1, out2)

out3 <- DTOutput("table") 

out4 <- verbatimTextOutput("stats")

out5 <- plotOutput('map')

#Add the title, and outputs to the main frame on GUI - br() adds spacing
main <- mainPanel("Water Quality (mg/L)", br(), br(), 
                  tabsetPanel(type = "tabs",
                              tabPanel("Plot", br(), br(), out1, br(), br(), out2),
                              tabPanel("Summary", br(), br(), out4),
                              tabPanel("Table", br(), br(), out3)),
                  tabPanel("Map", br(), br(), out5) 
                  
)