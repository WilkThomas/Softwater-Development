#Component Testing

Unit testing was performed on each input and output element of the application.  We created five separate test files within the R shiny test_that file.  The test files created were:
- Basic - this test checks the basic functionality including the connection to the local server.  The test returns the application header to show that the application was accessible.  
The basic test also checks for the presence of elements within the application.  It returns a message indicating whether elements are present when the web application load.  The test specifically
tests for the presence of each input element and the tabs that allow the user to select specific outputs.
#INSERT THE IMAGE HERE - IT'S IN THE FOLDER
 
 #Testing the controls functionality
 - Radial - the test checks the basic functionality of the buttons on the application.  This is part of testing the controls. 
 
 - Slider input - the test checks the basic functionality of the slider input bar.  Random variables are assigned within the designated range.  The randomization helps to achieve thorough
 testing.  This test was somewhat of a challenge because we needed to "interact" with it to change its values.  We used a function to obtain attributes of the slider, then generated two random numbers
 within that range.
 
 #Testing output
 - Output test  - the test checks the server functions.  There are plot renderings, interactive tables, and a summary table.  Random variables are selected after the range is obtained with 
 function.  We used location and html source to ensure our reactive outputs were displaying correctly.
 
 
 
 

 
 #System Testing
 
  The entire testing suite can be ran with a single command. Shiny from R Studio provides a testing package and is the primary method for testing apps.  The primary function we
  used was the runTests() function.  The function executes each test file in succession.  It performs 3 types of tests:
  
  Unit Tests
  
  Server Function Tests
  
  Snapshot-based Tests
  
  The tests for unit and server functions are local test files.  The test must be written in R programming language.  The snapshot-based test allows you to run the app and records the script as you use the application.  Each time
  you run the snapshot-based test, a comparison file is created.  The must have a headless web browser to function.  It doesn't require coding, just a simple command.
  
 
