# Problem Statement
### 1. Introducion
##### 1.1 Acronyms, Abbreviations, Definitions
USGS - U.S. Geological Survey
GIS - Geographic Information System
TDS - Total Dissolved Solids
Produced water - wastewater generated during oil and gas production
Underground injection - the placing of fluids underground through wells
##### 1.2 Background
There is an increasing interest in beneficial uses of large volumes of wastewater co-produced 
with oil and gas extraction. Currently, the majority of produced water is disposed through 
underground injection. Due to the water scarcity in many areas like New Mexico and California, 
potential subsurface disposal limitations, and regional linkages to induced seismicity 
governments encourage oil and gas producers to reuse the produced water. The management of 
produced water requires the use of quantity and quality data. USGS provides a nationally 
produced water database and is a mixed collection of 30-years of historic data. Although there is 
a lot of data available, the lack of easy user access and filters makes the data difficult to interface.
##### 1.3 Purpose of Product
Due to the large quantity of data in USGS database, accessing and parsing the data is difficult. 
To remedy this, Softwater Development is striving to develop a desktop application that houses a 
graphical user interface for accessing, filtering the produced water data based on specific filters, 
and possibly export desired tables, figures, and maps for the users. This will hopefully serve to 
promote the assessment of beneficial uses of produced water in different areas and be valuable to 
regulators and policy makers evaluating different options for managing produce water.

### 2. General Description of Product
##### 2.1 Context of Product
The system will utilize a Java application for generating a Graphic User Interface (GUI) and 
interfacing with the database management system. 
Swing is an API for Java that allows the creation of windows which contain GUI elements the 
user can interface with. Interfacing with the GUI will allow the app to write queries based on the 
user’s selected parameters and return the requested data.
MySQL and R are being considered for database management. MySQL is a dedicated database 
tool while R is a general data manipulation tool. The decision to use one or the other would be 
determined by either’s ability to interface with the USGS database and our Java app.
##### 2.2 Product Functions
The graphical user interface will be able to:
	-Select data from a specific basin (geographical area)
	-Organize data based on time period
	-Produce specific parameters such as:
		-Ion concentrations (e.g. Ca, Na, Cl SO4)
		-TDS
		-Water production
		-Oil production
		-Gas production
	-Export a table for selected data
	-Generate and export a figure for selected data
	-Generate and export a GIS map for selected data
##### 2.3 User Characteristics and Expectations
Users would include geological researchers, ecologists, government regulators,
enviromental protection agencies, enviromental researchers, and oil companies.
Expectations of the users would include having the data delivered to them quickly,
an easy to use GUI, fast query times, and percise data.

### 3. Conclusion
Overall, in order to meet the needs of the potential users, the desktop application will serve several basic 
functions. It will allow users to access data based on geographical location, time period, and 
specified production parameters. A web interface that is user-friendly, quick, and precise will 
serve the needs of the user. The Softwater Development team plans to implement this 
application in a way that allows for easy access to the data.
