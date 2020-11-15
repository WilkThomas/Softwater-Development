# Problem Statement
### 1. Introducion
##### 1.1 Purpose of Product
**Produced water** is wastewater generated during oil and gas production. Currently, the majority of produced water is disposed of by underground injection. Due to the water scarcity in many areas like New Mexico and California, governments encourage oil and gas producers to reuse produced water. The management of produced water requires the use of quantity and quality data. **The U.S. Geological Survey (USGS)** provides a nationally produced water database, but it is a mixed collection of 30-year historic data. Because of this, extracting data from the database is difficult. We will build a desktop application with a web user interface for extracting water quality monitoring data.

##### 1.2 Scope of Project
There is increasing interest in beneficial uses of large volumes of wastewater co-produced with oil and gas extraction (produced water) because of water scarcity, potential subsurface disposal limitations, and regional linkages to induced seismicity. This app provides quantitative data on the relevant water volumes and qualities using existing data from the USGS Produced Waters database. It will promote the assessment of beneficial use of produced water in different areas. The quantitative data provided will be valuable to regulators and policy makers evaluating different options for managing produce water.

##### 1.3 Acronyms, Abbreviations, Definitions
**USGS** - U.S. Geological Survey

**GIS** - geographic information system

**Produced water** - wastewater generated during oil and gas production

**Underground injection** - the placing of fluids underground through wells

##### 1.4 References
USGS National Produced Waters Geochemical Database
https://www.sciencebase.gov/catalog/item/59d25d63e4b05fe04cc235f9

### 2. General Description of Product
##### 2.1 Context of Product
It is an interactive data visualization app for the public and researchers to access this data easily and implement different ways to filter the data they receive such as specific pollutants, certain time periods etc. The product will be developed by Java.

##### 2.2 Domain Model with Description
![unknown.png](https://cdn.discordapp.com/attachments/750087437182828619/770112332285214720/unknown.png)

The **Web Application** is out base program that handles all of our data. The **Date Range** and the **Geographic Selction** are filters used specifically for the **Graph**. The **Element** is a filter used specifically for the **Table** that filters the data based off of what elemental and molecular deposites. The **Graph** is a ploted chart of the filtered data whereas the **Table** is just a sorted table displaying the data.

##### 2.3 Product Functions (general)
* Provide a serious parameter to extract desired data, including oil-producing basin, time period, produced water related parameters (e.g. production, total dissolved solid (TDS))
* Export a table for selected data
* Generate and export a figure for selected data
* Provide statistical analysis for selected data

##### 2.4 User Characteristics and Expectations
* Select desired filters
* Select desired output format (e.g., table, figure) and export

##### 2.5 Constraints
* The program doesn’t access the USGS database via API so, in the case the database was updated, out program would provide outdated information until a new CSV file was created and distributed.
* The results are based on data availability and some categories of data aren't very populated.

##### 2.5 Assumptions and Dependencies
*	RStudio - Graph Visualization Software: RStudio is an integrated development environment for R, a programming language for statistical computing and graphics. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks. 
*	https://rstudio.com/


### 3. Functional Requirements
Here is a list of our User Stories that highlight what our projects requirements are. https://github.com/WilkThomas/Softwater-Development/blob/gh-pages/docs/userstories.html


### 4. System and Non-functional Requirements

##### 4.1 External Interface Requirements (User,Hardware,Software,Communications)
Our software provides user interface including time (years) and space (state, county, basin) filters, selections of chart, table, and summary.

##### 4.2 Design Constraints
* Time constraints: project has to adhere to due dates
* Budget constraints: hardware/software needs to be free and openly available for student use.
* Knowledge level of students working in group.

##### 4.3 Quality Requirments
* Responsive: able to quickly adapt to user specifications.
* Reactive: respond and change based on user input
* Accurate: data displayed needs to match database





