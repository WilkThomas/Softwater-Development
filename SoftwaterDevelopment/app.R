
library(shiny)
library(ggplot2)
library(devtools)
library(dplyr)
library(DT)
library(maps)
library(mapproj)

#IMPORTANT - copy this line of code to the console to input the data

#data <- read.csv("USGSPWDBv2.3n.csv")
source('helpers.R')
#Variable for radio buttons on UI
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

#This is the user interface layout
ui <- fluidPage(
    #A selector bar to browse through themes
    shinythemes::themeSelector(),
    

    titlePanel("Softwater Development"), br(), br(),

    sidebarLayout(
         side, main)
    )

#Output functions
server <- function(input, output) {
    
    output$basin_label <- renderText({
        input$select_basin
    })
    
    output$query_label <- renderText ({
        input$select_query
    })
    
    #Reactive function to dynamically update years and pass to the filter
    slider_years <- reactive({
        seq(input[['my_dates']][1],
            input[['my_dates']][2])
    })
    
    #Makes the radio buttons reactive and makes the next drop down change based on radio button choices
    output$ui <- renderUI({
        switch( input$searchBy,
                "Basin" = filter <- selectInput(inputId = "select_basin", h3("Basin"), choices = sort(unique(data[["BASIN"]])), selected = 'Permian'),
                "State" = filter <- selectInput(inputId = "select_state", h3("State"), choices = sort(unique(data[["STATE"]])), selected = 'Pennsylvania'),
                "County" = filter <- selectInput(inputId = "select_county", h3("County"), choices = sort(unique(data[["COUNTY"]])), selected = 'Westmoreland')
    )
    })
    
    #Create a plot based on user inputs
    output[['basin_plot']] <- renderPlot({

        req(input$searchBy)
        
        #Format the date column as a date object and extract year only
        data$DATESAMPLE <- format(as.Date(data$DATESAMPLE, '%Y-%m-%d'), '%Y')
        
        
        if(input$searchBy == "Basin") {
        
        #Create a subset of the data based on user selections
        filtered <-
            data %>% 

                filter(BASIN ==input[['select_basin']]) %>%
                filter(DATESAMPLE %in% slider_years())
        
        filtered <-
         
        subset(filtered,
        BASIN == input[['select_basin']],
                c("BASIN", input[['select_query']], "DATESAMPLE"
            
                  ))
        
        }
        
        if(input$searchBy == "State") {
            
            #Create a subset of the data based on user selections
            filtered <-
                data %>% 
                
                filter(STATE ==input[['select_state']]) %>%
                filter(DATESAMPLE %in% slider_years())
            
            filtered <-
                
                subset(filtered,
                       STATE == input[['select_state']],
                       c("STATE", input[['select_query']], "DATESAMPLE"
                         
                       ))
            
        }
        
        if(input$searchBy == "County") {
            
            #Create a subset of the data based on user selections
            filtered <-
                data %>% 
                
                filter(COUNTY ==input[['select_county']]) %>%
                filter(DATESAMPLE %in% slider_years())
            
            filtered <-
                
                subset(filtered,
                       COUNTY == input[['select_county']],
                       c("COUNTY", input[['select_query']], "DATESAMPLE"
                         
                       ))
            
        }
        
        #Eliminate rows with null values from the data
        filtered <- filtered[complete.cases(filtered),]
        

         

        filtered <- filtered[order(filtered$DATESAMPLE),]
        
        #Create a list for the aggregate function
        date_list <- list(filtered$DATESAMPLE)
        
        #Aggregate by year
        filtered <- aggregate(filtered[input[['select_query']]], FUN = mean, by = date_list)
        
        names(filtered)[2] <- 'y_value'
        
        ggplot(data = filtered, aes(x = Group.1, y = y_value)) + geom_col(fill = '#148F77') + xlab("Year") + ylab("TDS") + theme(axis.text.x = element_text(angle = 90))
    })
    
    output$stats <- renderPrint({
        req(input$searchBy)
        
        #Format the date column as a date object and extract year only
        data$DATESAMPLE <- format(as.Date(data$DATESAMPLE, '%Y-%m-%d'), '%Y')
        
        #Create a subset of the data based on user selections
        filtered <-
            data %>% 
            filter(BASIN ==input[['select_basin']]) %>%
            filter(DATESAMPLE %in% slider_years())
        
        filtered <-
            subset(filtered,
                   BASIN == input[['select_basin']],
                   c("BASIN", input[['select_query']], "DATESAMPLE"
                   ))
        
        #Eliminate rows with null values from the data
        filtered <- filtered[complete.cases(filtered),]

        
        filtered <- filtered[order(filtered$DATESAMPLE),]
        
        #Create a list for the aggregate function
        date_list <- list(filtered$DATESAMPLE)
        
        #Aggregate by year
        filtered <- aggregate(filtered[input[['select_query']]], FUN = sum, by = date_list)
        

        
        
        
        
        names(filtered)[2] <- 'y_value'
        
        
        

        summary(filtered)
    })
    
    output$table <- renderDT({
        
        req(input$searchBy)
        
        #Format the date column as a date object and extract year only
        data$DATESAMPLE <- format(as.Date(data$DATESAMPLE, '%Y-%m-%d'), '%Y')
        
        if(input$searchBy == "Basin") {
            
            #Create a subset of the data based on user selections
            filtered <-
                data %>% 
                
                filter(BASIN ==input[['select_basin']]) %>%
                filter(DATESAMPLE %in% slider_years())
            
            filtered <-
                
                subset(filtered,
                       BASIN == input[['select_basin']],
                       c("BASIN", input[['select_query']], "DATESAMPLE"
                         
                       ))
            
        }
        
        if(input$searchBy == "State") {
            
            #Create a subset of the data based on user selections
            filtered <-
                data %>% 
                
                filter(STATE ==input[['select_state']]) %>%
                filter(DATESAMPLE %in% slider_years())
            
            filtered <-
                
                subset(filtered,
                       STATE == input[['select_state']],
                       c("STATE", input[['select_query']], "DATESAMPLE"
                         
                       ))
            
        }
        
        if(input$searchBy == "County") {
            
            #Create a subset of the data based on user selections
            filtered <-
                data %>% 
                
                filter(COUNTY ==input[['select_county']]) %>%
                filter(DATESAMPLE %in% slider_years())
            
            filtered <-
                
                subset(filtered,
                       COUNTY == input[['select_county']],
                       c("COUNTY", input[['select_query']], "DATESAMPLE"
                         
                       ))
            
        }
        
        #Eliminate rows with null values from the data
        filtered <- filtered[complete.cases(filtered),]
        
        filtered <- filtered[order(filtered$DATESAMPLE),]
        
        #Create a list for the aggregate function
        date_list <- list(filtered$DATESAMPLE)
        
        #Aggregate by year
        filtered <- aggregate(filtered[input[['select_query']]], FUN = sum, by = date_list)
        colnames(filtered) <- c("DATE", "TARGET")
        
        datatable(filtered, rownames = FALSE, caption = "Option to add a caption for the table.", )
    })
    
    ##This is my experimental map function
    output$map <- renderPlot({
        data <- switch(input$select_query, 
                       "TDS" = data$TDS)
                       
        
        
        color <- switch(input$select_query, 
                        "TDS" = "darkgreen")
                        
        
        
        legend <- switch(input$select_query, 
                         "TDS" = "% White")
                         
        
        
        percent_map(data, color, legend, input$my_dates[1], input$my_date[2])
    })
}


#Starts the application
shinyApp(ui = ui, server = server)
