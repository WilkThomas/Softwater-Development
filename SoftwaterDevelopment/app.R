
library(shiny)
library(ggplot2)
library(devtools)
library(dplyr)

#IMPORTANT - copy this line of code to the console to input the data

#data <- read.csv("USGSPWDBv2.3n.csv")





#Variable for input 1 on GUI
in1 <- selectInput(inputId = "select_basin", h3("Basin"), choices = unique(data[["BASIN"]]), selected = 'Permian')

#Variable for input 2 on GUI
in2 <- sliderInput(inputId = "my_dates",label = "Date Range",min = 1905,
                   max = 2014,
                   value = c(1905, 2014), sep='')

#Variable for input 3 on GUI
in3 <- selectInput(inputId = "select_query", h3("Select"), choices = c('Al', 'ALKHCO3', 'B', 'Br', 'CO3', 'Ca', 'Cl', 'Cu', 'F', 'FeTot', 'HCO3', 'I', 'K', 'Li', 'Mg', 'Mn', 'N', 'NO3', 'Na', 'P', 'PH', 'SO4', 'Si', 'TDS', 'TSS'), selected = 'TDS')

#Add the input variables and a title to the side panel of the user interface
side <- sidebarPanel('Options', in1, in2, in3)

#Variable for Label in Main frame on GUI
out1 <- textOutput('basin_label')

#Variable for plot in the main frame on GUI
out2 <- plotOutput('basin_plot')


#Add the title, and outputs to the main frame on GUI
main <- mainPanel("Title", out1, out2)

out3 <- tableOutput("basin_table") 

out4 <- verbatimTextOutput("stats")

#Add the title, and outputs to the main frame on GUI
main <- mainPanel("Water Quality (mg/L)", out1, out2, out3, out4)


#This is the user interface layout
ui <- fluidPage(
    #A selector bar to browse through themes
    shinythemes::themeSelector(),
    

    titlePanel("Water Quality"),

    titlePanel("Water Quality (mg/L)"),

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

    
    
    #Create a plot based on user inputs
    #output[['basin_plot']] <- renderPlot({
        

        
    #Create a plot based on user inputs
    output[['basin_plot']] <- renderPlot({

        req(input$select_basin)
        
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
        filtered <- aggregate(filtered[input[['select_query']]], FUN = mean, by = date_list)
        
        names(filtered)[2] <- 'y_value'
        
        ggplot(data = filtered, aes(x = Group.1, y = y_value)) + geom_col(fill = '#0066CC') + xlab("Year") + ylab("TDS") 
    })
    
    output$stats <- renderPrint({
        req(input$select_basin)
        
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
        
        
        ggplot(data = filtered, aes(x = Group.1, y = y_value)) + geom_col(fill = '#0066CC') + xlab("Year") + ylab("TDS") 

        summary(filtered)
    })
    
    output$basin_table <- renderTable({
        req(input$select_basin)
        
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
        
        head(filtered)

    })
}


#Starts the application
shinyApp(ui = ui, server = server)
