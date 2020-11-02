
# Architecture Page
### Project Overview

#####  Due to the large quantity of data in USGS database, accessing and parsing the data is difficult. 
To remedy this, Softwater Development is striving to develop a web application that houses a graphical user interface for accessing, filtering the produced water data based on specific filters, and possibly export desired tables, figures, and maps for the users. 
This will hopefully serve to promote the assessment of beneficial uses of produced water in different areas and be valuable to regulators and policy makers evaluating different options for managing produce water.


### Key Architectural Drivers
##### Fuctional Requirements
* Provide a serious parameter to extract desired data
* Export a table for selected data
* Generate and export a figure for selected data


##### Quality Requirements
* Responsive - able to quickly adapt to user specifications.
* Reactive - respond and change based on user input
* Accurate - data displayed needs to match database


##### Technical Constraints
* Time constraints - project has to adhere to due dates
* Budget constraints - hardware/software needs to be free and openly available for student use.
* Knowledge level of students working in group.

### Architectural Style Choices
#### Pipe-and-Filter
* Data is transformed through filters to produce desired output
* Each filter is an independent function
* Not suitable for interactive systems

#### Client Server
* Servers offer services (table/charts)
* Client accesses them with request (via the user interface)
* User interface and server are in separate code 

### Architectural Diagram
!diagram.png(https://cdn.discordapp.com/attachments/750087437182828619/772670263157325824/Diagram.PNG)

### Conclusion 
#### The architecture model of Softwater Development is Pipe-and-filter.

#### Issues
* The program doesn’t access the USGS database via API so, in the case the database was updated, out program would provide outdated information until a new CSV file was created and distributed.
* The results are based on data availability and some categories of data aren't very populated.

#### Risks
* A corruption of data in central location will cause all systems to fail.
* Missing information will result poor data return to users.

#### Questions
* Do we have a client server architecture style in addition to pipe and filter?










