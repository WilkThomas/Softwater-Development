# Design Page
Softwater Development's reactive GUI to interface with the USGS database is developed in R using the Shiny package. The design strives to be simple, intuitive, and helpful while remaining quick with its reactive elements like the charts and tables.

### Architecture Diagram
![diagram.png](https://cdn.discordapp.com/attachments/750087437182828619/772670263157325824/Diagram.PNG)

The architecture diagram behind the design of the GUI implements the pipe-and-filter architectural style choice. Pipe-and-filter is a pattern in which independent entities (filters) perform transformations on data and pipes serve to stream the data being transformed. In our case, the GUI has mutiple selections used to help filter the data from the USGS database and are named primary filter, secondary filter, target, and output. Each of these components "transforms" the querey that will be used to recive the correct data back from the USGS csv file. The primary filter filters between county, state, and basin. The secondary filter allows the user to select the time range of the data and the target filter allows the user to choose one of the elements dissolved in the water in the selected location. The output filter will allow the user to select in which graph form they would like the data outputed. As one can see, each of the filters thus far serve to transform the query that will be sent to the csv file to return the correct data back. From there, the submit filter represents sending the query to the csv and the next filter sends the correct data whcih is presented in the graphic which was chose in the output filter.

### Class Level Design
The application is modular in design.  Functions are the fundamental unit in R.  The application works with them.  The UI generated functions are called within the application and function are used within the server to define outputs and also to create reactive expressions.  Input and output variables are assignmed IDs and share a global namespace.  All IDs are unique.  The functions within the server then generate outputs based on the input variables.  There is an additional level of abstraction in an R Shiny application.

### Misc Design Information
The GUI depends on the data from the csv file of the USGS database. The GUI doesnt use any sort of API to access the USGS database realtime. This means in the event the database is updated, the program will require an update with an updated csv created from the updated data base.

To serve the finish web app, the UI and server functions of the shiny app must be packaged correctly in a directory with the associated csv file and uploaded to the server hosted by shiny.
