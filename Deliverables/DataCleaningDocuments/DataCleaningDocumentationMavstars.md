Data Cleaning Documentation
================
Karthik
October 16, 2018

-   [Data Cleaning Documentation](#data-cleaning-documentation)
    -   [Purpose](#purpose)
    -   [Data Source:](#data-source)
    -   [Intellectual Policy Constraint](#intellectual-policy-constraint)
    -   [Metadata Description:](#metadata-description)
    -   [Issues with Data:](#issues-with-data)
    -   [Remediation of Data:](#remediation-of-data)
    -   [Steps Taken to Clean the Data:](#steps-taken-to-clean-the-data)
        -   [Loading the data](#loading-the-data)
        -   [Removing unnecessary columns](#removing-unnecessary-columns)
        -   [Filtering Data for Species](#filtering-data-for-species)
        -   [Filtering Temperature Data](#filtering-temperature-data)

------------------------------------------------------------------------

Data Cleaning Documentation
===========================

Purpose
-------

The purpose of this document is to provide the steps taken to clean the data obtained from Linda Loring Foundation based on the phenology of the different species present at Linda Loring Property. The Goal is to analyze the data and interpret the correlation between temperature and breaking of buds over a span of Years.

Data Source:
------------

<p>
The Data is obtained from the National Phenology Network USA (USA-NPN) on the two species present at the Linda Loring Foundation namely the Black Cherry and Beach Plum. The Data source is status intensity observation data obtained from National Phenology network. The data set obtained contains 27 Columns and 554984 Rows. We narrowed down our data set to two species in the Linda Loring foundation namely Black Cherry and Beach Plum. The reason why we selected the two species is because their data is available from 2015 to 2018.Whereas the remaining data sets are from 2016. Since we have more data on these species we can infer more correlation between the variables over time. The data set contains the Phenophase status recorded for Black cherry and beach plum from the year January 2015 to October 2018.
</p>
<br>

The following are the Column names of the data field.

-   Observation\_ID
-   Dataset\_ID
-   Update\_Datetime
-   Site\_ID,Species\_ID
-   Genus,Species
-   Kingdom
-   Species\_Category
-   Individual\_ID
-   Plant\_Nickname
-   SiteName
-   State
-   Common\_Name
-   Latitude
-   Longitude
-   Elevation
-   Observation\_Date
-   Day\_of\_Year
-   Phenophase\_ID
-   Phenophase\_Name
-   Phenophase\_Description
-   Phenophase\_Category
-   Phenophase\_Status
-   Intensity\_Category\_ID
-   Intensity\_Value
-   Abundance\_Value.

We also received the temperature data set from the client, which has the data of the temperature recorded at 8 different sites using temperature loggers (Site A, Site B, Site C, Site D, Site E, Site F, Site H).

The columns present in the temperature data set are as follows

-   Date Time, GMT-05:00
-   Temp, °C
-   Intensity, Lux

(USA-NPN) <https://www.usanpn.org/usa-national-phenology-network>.

Intellectual Policy Constraint
------------------------------

Linda Loring Nature Foundation provide parameters to download through National Phenology Network. By clicking on the Phenology Observation Portal, then public users can customize datasets using filters for specific species, locations, dates. Hence, the observation data from Linda Loring Nature Foundation can be accessible via National Phenology Database that are available to all users if proper credential is given. Moreover, the temperature dataset is given by Linda Loring Nature Foundation personally, which is not found on National Phenology Network. Hence, the phenology dataset is accessible online for research purpose without Linda Loring Nature Foundation's direct help. Before the data set is downloaded, users are asked to read through USA-NPN data use and attribution policies. Then, they can check mark that they have read and acknowledged the policies and click download button.

Metadata Description:
---------------------

After obtaining phenology dataset from National Phenology Network, an excel file which contains data field description can be found in the zip folder downloaded. This excel file contains descriptions for all data fields regardless if not selected for filtering in the customized dataset. The first column contains the sequence number along with exact field name, which often contains double words with underline symbol to separate the two. Within the field description, there is an in-depth explanation of the importance of the field such as what certain numerical value means when being recorded to submit through Nature's Note application. For example, the phenophase status can be determined through either 0 or 1, that either stands for presence or absence. Certain field has ID for general analysis to standardize labeling convention along with description column followed. The field description provides how information is collected and why certain field have strange values due to certain circumstances during data documentation from observation.

Issues with Data:
-----------------

Since the temperature data set is personally given by Linda Loring Nature Foundation, we must integrate the phenology and temperature data set by day of the year. This requires some cleaning of temperature data by removing the time from field, then convert the date with time into day of the year. Hence, using the day of year we can integrate the two data sets. In addition to that we have the temperature data based on the time of the day, we need to take the average of the temperature readings recordings throughout the day so that we can match the two different data sets. When, we were obtaining data from National Phenology Network, the direction on how to obtain data was not clear enough which caused some confusion of which site a plant was observed from. Hence, we were able to reduce time integrating site data set with the main phenology data set. Moreover, the phenophase status was clarified from direct emailing to Dr. Bios, to explain the value of 0 or 1 since the metadata given was not clear.

Remediation of Data:
--------------------

To answer our research question, we had to remove some unnecessary columns from the status intensity observation data set. To get the following 14 columns and 554984 rows in a new data set.

-   SiteName
-   State
-   Common\_Name
-   LatitudeLongitude
-   Elevation
-   Observation\_Date
-   Day\_of\_Year
-   Phenophase\_ID
-   Phenophase\_Description
-   Phenophase\_Category
-   Phenophase\_Status
-   Intensity\_Category\_ID
-   Intensity\_Value

Then we removed the intensity field from the temperature data obtained from the client from a site file. The Number of rows and columns for these files vary from each year based on each Site data.

-   Date Time, GMT-05:00
-   Temp, °C So far in our data set we didn't encounter any null values.

Then further we filtered our species data into two files based on the commonname black cherry and beach plum. 371295 rows and 14 columns are present in BlackCherryData Set. 220703 rows and 14 columns are present in BeachPlumData Set.

Steps Taken to Clean the Data:
------------------------------

Download the data from National Phenology network site by giving the necessary inputs like data range, species and state. Narrow down the species to Blackcherry and BeachPlum Next Select phenophase such as flowers, fruits, leaves etc. Select the partner groups as Linda Loring Foundation, Source data set as Natures notebook then select the optional fields required like Site Name and Phenophase category.

-   Create a New R script
-   Set the working directory with setwd()

``` r
knitr::opts_chunk$set(cache=TRUE)
knitr::opts_knit$set(root.dir = "D:/MS/Temporary data/BlackCherryBeachPlumStatusIntensity DataSet/DataSetBlackBeach") 
```

### Loading the data

Load the BlackBeach.csv file into a dataframe variable using the following R script

``` r
BlackBeach <- read.csv("BlackBeach.csv")
View(BlackBeach)    
```

### Removing unnecessary columns

Invoke the required libraries

``` r
library(dplyr)
```

Use the select function to select only the required important columns for the species data.

``` r
BlackBeachData<-select(BlackBeach,Site_Name,State,Common_Name,Latitude,Longitude,Elevation_in_Meters,Observation_Date,Day_of_Year,Phenophase_ID,Phenophase_Description,Phenophase_Category,Phenophase_Status,Intensity_Category_ID,Intensity_Value)
View(BlackBeachData)
```

Then write the new data set to a csv and name it as BlackBeachDataSet.csv

``` r
write.csv(BlackBeachData,"BLackBeachDataSet")
```

### Filtering Data for Species

Now we need to filter the data set based on the species. We need two different data set specifically for BlackCherry and Beach Plum. For this we use the subset function in R to filter the data.

Read the data from BlackBeachDataSet

``` r
BlackC<-read.csv("BlackBeachDataSet.csv")
View(BlackC)
```

Then filter the data set based on the common name as *black cherry*

``` r
BlackCherry <- subset(BlackC,Common_Name=="black cherry")
View(BlackCherry)
```

Write the dataset of BlackCherry to a csv and name it.

``` r
write.csv(BlackCherry,"BlackCherryDataSet")
```

Next go to BlackCherryDataset remove the unecessary index column generated from the filter function in excel.

Now we filter the data set based on the common name *beach plum*

``` r
BeachPlum<- subset(BlackC,Common_Name=="beach plum")
View(BeachPlum)
```

Now we write the data set of BeachPlum into a csv file.

``` r
write.csv(BeachPlum,"BeachPlumDataSet")
```

Next go to BeachPlumDataSet remove the unecessary index column generated from the filter function in excel.

### Filtering Temperature Data

### Documenter: Kim Duong 
### Date: 10/30/2018 

In order to corelated the temperature data and the species data obtained from the national phenology network we first need to get the temperature data sets to our required format.

The temperature data for a particular site has the following columns
-   No Name Column 
-   Date Time, GMT-05:00
-   Temp, °C
-   Intensity

#### Steps in excel

-   Step 1 Remove the first column with No Name and column Intensity in Excel 
-   Step 2 Rename Column Date Time, GMT-05:00 to Date; Column Temp, °C to Temp 
-   Step 3 Based on the instructions given to us from the client we need to remove the *first row* and the *last row* of the file to remove the temperature recorded when it was in the bag.

### Filtering Data for Species

Cleaning temperature data within R requires some pre-cleaning in Excel before importing into R for reformatting Date 

Read the data from BlackBeachDataSet

``` r
may2015_siteA <- read.csv("Site_A.csv", header=TRUE, sep=",")
View(may2015_siteA)
```

Remove the time within Date column by reformatting to just date only

``` r
may2015_siteA$Date <- format(as.POSIXct(strptime(may2015_siteA$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
View(may2015_SiteA
```

Reformat the date into day of the year in a new column known as Day  

``` r
may2015_siteC$Day <- format(as.POSIXct(strptime(may2015_siteC$Date,"%m/%d/%Y",tz="")) ,format = "%j")
```

Write the data set into a csv file 

``` r
write.csv(march2015_siteC, "SiteC_March2015.csv")
```

Open the new csv file in Excel and delete  the first column with numerical value. Then, move the Day column between column Date and column Temp 

#### Contributorship

-   Kim- Worked on Intellectual Property constriants,Metadata description and issues related to data.
-   Karthik- Worked on description of the data source,remediation of the data downloaded from USA national phenology network,R script and step by step description of the data remediation.
-   Pallavi -remediation of the temperature data obtained from client.

Proof Read by Pallavi-10/16/18 12.42pm
