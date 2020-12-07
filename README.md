# Softwater-Development
## Link to GitHub Pages Project Site
This is a [link to the project site](https://wilkthomas.github.io/Softwater-Development/)
## Instructions for Running
The app is developed in R using RStudio. Using RStudio, open the project doing Open Project and navigating to the project file in the SoftwaterDevelopment directory. The app is split up into several different file: app.R, ui.R, server.R, and tabs.R. To run the app, exclusivly use the app.R fule and in the consol of RStudio, run data <-  read.csv("USGSPWDBv2.3n.csv") to get the data into your enviroment. Then you can press the Run App button in RStudio near the top right. 
## Description of Project for D0
Demo 0 consisted of a basic GUI using Java Swing that parsed a CSV file based on some filters. Was used as a proof of concept.
## Description of Project for D1
Demo 1 consisted of a big change away from Java Swing and instead using R Shiny to develop the GUI. Used a CSV of the database data and actually performs what was intended instead of a proof of concept. For example, actual filters and charts.
## Description of Project for D2
Demo 2 will show more options within the user selections.  The user can now select data geographically 3 different ways (state, county, or basin name).  Selections are also sorted for ease of use.  The output of the application now includes multiple options: a reactive bar graph, a mathematical summary of the data, and a reactive table with sorting and search options.  Reactive functionality for all outputs works well.
## Description of Project for D3
Demo 3 hasn't changed too much. Appearance wise, a color theme was selected for the app and was set for the whole application. Also, the app now is split up into several different files making it easier to read and navigate. The code was also refactored a bit for additional clarity. A map graph is still in the works and was worked on through this interation but still needs some time till its ready for release on the app. The next iteration may see a map feature.
## Description of Project for D4
The app that is demoed in demo 4 will be similar to the app demoed in demo 3, however some minor bugs were fixed as well as the app was published to a website here.   https://softwater-devolopment.shinyapps.io/softwaterdevelopment/. 
