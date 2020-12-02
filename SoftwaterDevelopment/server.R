library(shiny)
library(ggplot2)
library(devtools)
library(dplyr)
library(DT)
library(maps)
library(mapproj)
library(shinythemes)

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
}