# Softwater-Development

## Link to GitHub Pages Project Site
This is a [link to the project site](https://wilkthomas.github.io/Softwater-Development/)
This is a [link to the published app](https://softwater-devolopment.shinyapps.io/softwaterdevelopment/)

## Instructions for Building and Running
The app is developed in R using RStudio. Using RStudio, open the project doing Open Project and navigating to the project file in the SoftwaterDevelopment directory inside the repo on the master branch. The projext file is named "web app.Rproj". The app is split up into several different files: app.R, ui.R, server.R, and tabs.R. Also amongst the R files is a csv file which is the database the app uses to pull data from. With the app.R file opened in RStudio, you can press the run app button to show the app on a local machine independent of whats actually published.

## Published App Directory
Also included in the SoftwaterDevelopment directory is the rsconnect directory created in publishing the application (no editing needed here).

## Test Suite
The tests directory comprises the different test suites used for the web application. The tests directory has two different types of test from shinytests and testthat both of which have their own directories. Also inside the tests directory are two R files: shinytest.R and testthat.R which are used to run the test. If you insert the command runTests() into the RStudio consol it will run all the test suites and print the results.

## Further Documentation
In the gh-pages branch of the repo is housed the docs directory which consists of the .md and .html files used for documenting and populating the project site. Also includes is a res directory for some images used in the user stories and an images directory housing some supporting images for the other documentation files.
 
## Description of Project for D0
Demo 0 consisted of a basic GUI using Java Swing that parsed a CSV file based on some filters. Was used as a proof of concept.

## Description of Project for D1
Demo 1 consisted of a big change away from Java Swing and instead using R Shiny to develop the GUI. Used a CSV of the database data and actually performs what was intended instead of a proof of concept. For example, actual filters and charts.

## Description of Project for D2
Demo 2 will show more options within the user selections.  The user can now select data geographically 3 different ways (state, county, or basin name).  Selections are also sorted for ease of use.  The output of the application now includes multiple options: a reactive bar graph, a mathematical summary of the data, and a reactive table with sorting and search options.  Reactive functionality for all outputs works well.

## Description of Project for D3
Demo 3 hasn't changed too much. Appearance wise, a color theme was selected for the app and was set for the whole application. Also, the app now is split up into several different files making it easier to read and navigate. The code was also refactored a bit for additional clarity. A map graph is still in the works and was worked on through this interation but still needs some time till its ready for release on the app. The next iteration may see a map feature.

## Description of Project for D4
The app that is demoed in demo 4 will be similar to the app demoed in demo 3, however some minor bugs were fixed as well as the app was published.
