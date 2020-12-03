# Component Testing

Unit testing was performed on each input and output element of the application.  We created five separate test files within the R shiny test_that file.  The test files created were:
- Basic - this test checks the basic functionality including the connection to the local server.  The test returns the application header to show that the application was accessible.
The basic test also checks for the presence of elements within the application.  It returns a message indicating whether elements are present when the web application load.  The test specifically
tests for the presence of each input element and the tabs that allow the user to select specific outputs.


![diagram.png](https://cdn.discordapp.com/attachments/750087437182828619/783894981840076830/Controls_test_results.JPG)
 
## Testing the controls functionality
 - Radial - the test checks the basic functionality of the buttons on the application.  This is part of testing the controls. 
 
 - Slider input - the test checks the basic functionality of the slider input bar.  Random variables are assigned within the designated range.  The randomization helps to achieve thorough testing.  This test was somewhat of a challenge because we needed to "interact" with it to change its values.  We used a function to obtain attributes of the slider, then generated two random numbers within that range.
 
## Testing output
 - Output test  - the test checks the server functions.  There are plot renderings, interactive tables, and a summary table.  Random variables are selected after the range is obtained with function.  We used location and html source to ensure our reactive outputs were displaying correctly.
 
## System Testing
 
  The entire testing suite can be ran with a single command. Shiny from R Studio provides a testing package and is the primary method for testing apps.  The primary function we used was the runTests() function.  The function executes each test file in succession.  It performs 3 types of tests:
  
  - Unit tests: These are used to test that functions behave as expected.
  - Server function tests: These tests run the server function of a Shiny application in an environment that simulates a real client session. They can be used to test reactive components and outputs in the server function of a Shiny application, or in a module.
  - Snapshot-based tests: These are tests performed with the shinytest package, which runs the Shiny application in a headless web browser. The web browser connects to the Shiny application and simulates user actions, such as clicking on buttons and setting inputs to particular values. It takes snapshots of the application state and, in future runs of the tests, compares the application state to those saved snapshots.
  
## Acceptance Testing
 
 - Filtering by Geographical Region: The system provides the select function for 100% minerals presenting in USGS database. The users like geological researchers are able to select specific minerals they are insterested.
 - Filtering by Time Period: The system provides the time range from 1905 to 2014, The users like ecologists can easily adjust the time range by move the time ruler bar on the user interface.
 - Export GIS Map: This reactive map function will take much more effort than we expect, it is not yet functional.
 - Customize Filter Value: This reactive map function will take much more effort than we expect, it is not yet functional.
 - Generate Images and Tables: Based on the filters selected by users, the tables and figures can be downloaded through the user interface by right click.
 - Filtering by Multiple Parameters: The system provides filters for space and time, users can select space filters by oil basin, state, or county.

