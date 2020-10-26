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

##### 2.3 Product Functions (general)
* Provide a serious parameter to extract desired data, including oil-producing basin, time period, produced water related parameters (e.g. production, total dissolved solid (TDS))
* Export a table for selected data
* Generate and export a figure for selected data
* Generate and export a GIS map for selected data

##### 2.4 User Characteristics and Expectations
* Select desired filters
* Select desired output format (e.g., table, figure, map) and export

##### 2.5 Constraints
* More improvements are required for high QPS

##### 2.5 Assumptions and Dependencies
*	Graphviz - Graph Visualization Software: Graphviz is open source graph visualization software. Graph visualization is a way of representing structural information as diagrams of abstract graphs and networks. 
*	https://www.graphviz.org/

### 3. Functional Requirements
Here is a list of our User Stories that highlight what our projects requirements are. https://github.com/WilkThomas/Softwater-Development/blob/gh-pages/docs/userstories.html







