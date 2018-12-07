Final Document
================
Karthik
December 5 2018

-   [Data Cleaning](#data-cleaning)
    -   [Data Files Generated:](#data-files-generated)
        -   [For Different Sites where BeachPlum is Present](#for-different-sites-where-beachplum-is-present)
        -   [For Year 2016](#for-year-2016)
        -   [For Year 2017](#for-year-2017)
        -   [For Year 2018](#for-year-2018)
        -   [For Site D](#for-site-d)
        -   [For Site E](#for-site-e)
        -   [For Site G](#for-site-g)
    -   [Steps Taken to Clean the Data:](#steps-taken-to-clean-the-data)
    -   [Cleaning Phenophase Intensity Data](#cleaning-phenophase-intensity-data)
        -   [Loading the data](#loading-the-data)
        -   [Filtering Columns](#filtering-columns)
        -   [Filter Based on the Sites](#filter-based-on-the-sites)
    -   [Filtering Intensity data observed over the Years](#filtering-intensity-data-observed-over-the-years)
        -   [BeachPlum BreakingBud Intensity Observed at Site D](#beachplum-breakingbud-intensity-observed-at-site-d)
        -   [BeachPlum Breaking Bud Observed at Site E](#beachplum-breaking-bud-observed-at-site-e)
        -   [BeachPlum Breaking Bud Observed at Site G](#beachplum-breaking-bud-observed-at-site-g)
    -   [Cleaning the Temperature Data Set](#cleaning-the-temperature-data-set)
        -   [Convert the dates to days in the data set](#convert-the-dates-to-days-in-the-data-set)
        -   [Finding the average and minimum temperature.](#finding-the-average-and-minimum-temperature.)
-   [DescriptiveStatistics](#descriptivestatistics)
    -   [Intensity Values](#intensity-values)
        -   [SiteD](#sited)
        -   [SiteE](#sitee)
        -   [SiteG](#siteg)
    -   [Temperature Values](#temperature-values)
        -   [Year 2016](#year-2016)
        -   [Year 2017](#year-2017)
        -   [Year 2018](#year-2018)
-   [Visualization](#visualization)
    -   [Phenophase Intensity Vs Minimum Temperature of BeachPlum -2016](#phenophase-intensity-vs-minimum-temperature-of-beachplum--2016)
        -   [Site D](#site-d-3)
        -   [Site E](#site-e-3)
        -   [Site G](#site-g-3)
    -   [Phenophase Intensity Vs Minimum Temperature of BeachPlum -2017](#phenophase-intensity-vs-minimum-temperature-of-beachplum--2017)
        -   [Site D](#site-d-4)
        -   [Site E](#site-e-4)
        -   [SiteG](#siteg-1)
    -   [Phenophase Intensity Vs Minimum Temperature of BeachPlum-2018](#phenophase-intensity-vs-minimum-temperature-of-beachplum-2018)
        -   [Site D](#site-d-5)
        -   [Site E](#site-e-5)
        -   [Site G](#site-g-4)

------------------------------------------------------------------------

Data Cleaning
=============

Data Files Generated:
---------------------

**Data of the species BeachPlum at the different sites its present.**

#### For Different Sites where BeachPlum is Present

Site\_D\_BeachPlum.csv

Site\_E\_BeachPlum.csv

Site\_G\_BeachPlum.csv

**Data of the Species BeachPlum Intensity for different years 2016,2017,2018**

#### For Year 2016

SiteD\_BeachPlum\_2016.csv

SiteE\_BeachPlum\_2016.csv

SiteG\_BeachPlum\_2016.csv

#### For Year 2017

SiteD\_BeachPlum\_2017.csv

SiteE\_BeachPlum\_2017.csv

SiteG\_BeachPlum\_2017.csv

#### For Year 2018

SiteD\_BeachPlum\_2018.csv

SiteE\_BeachPlum\_2018.csv

SiteG\_BeachPlum\_2018.csv

**Temperature Data file from the different sites recorded by the temperature logger for different years.**

#### For Site D

Min.Max\_SiteDJune2016.csv

Min.Max\_SiteDJune2017.csv

Min.Max\_SiteDMay2018.csv

#### For Site E

Min.Max\_SiteEJune2016.csv

Min.Max\_SiteEJune2017.csv

Min.Max\_SiteEMay2018.csv

#### For Site G

Min.Max\_SiteGJune2016.csv

Min.Max\_SiteGJune2017.csv

Min.Max\_SiteGMay2018.csv

Steps Taken to Clean the Data:
------------------------------

Download the data from National Phenology network site by giving the necessary inputs like data range, species and state. Next Select phenophase such as flowers, fruits, leaves etc. Select the partner groups as Linda Loring Foundation, Source data set as Natures notebook then select the optional fields required like Site Name and Phenophase category.

From the Statusintensity file downloaded we transform the excel file with selected columns and filters. For our case study we are interested in taking the BeachPlum plant to observe its Breaking of bud over the diffrent sites at Linda Loring foundation over the years 2016,2017,2018.

We transform and breakdown the phenophase data intensity of the species BeachPlum based on 1)Phenophase-Breakingbud 2)Site where the Plant beachplum was Phenophase Intensity was observed 3)Year the phenophase was observed

We further change the intensity values in the excel files we obtained to a cardinal scale ,so that we can visualize the data.

Give the intensity values in the BeachPlum Intensity files a cardinal scale.

0---- -9999
1----Less than 3
2----3 to 10
3----11 to 100
4----101 to 1000
5----1001 to 10000
6----more than 10000

``` r
knitr::opts_chunk$set(cache=TRUE)
knitr::opts_knit$set(root.dir = "D:/MS/D2D Final/Data Source/BeachPlum/Data By Site-Year") 
```

Invoke the required libraries required for the visualizations and statistics.

``` r
library(dplyr)
library(ggplot2)
library(gridExtra)
```

Cleaning Phenophase Intensity Data
----------------------------------

### Loading the data

Load the AllSpecies.csv file into a dataframe variable using the following R script

``` r
AllSpecies <- read.csv("AllSpecies.csv")
View(AllSpecies)    
```

### Filtering Columns

Use the select function to select only the required important columns for the BeachPlum data ,we filter the data based on the phenophase "Breaking leaf buds"

``` r
BreakingBud=subset(AllSpecies,AllSpecies$Phenophase_Name=="Breaking leaf buds",select =c("Site_Name","Common_Name","Phenophase_Name","Observation_Date","Day_of_Year","Phenophase_Status","Intensity_Category_ID","Intensity_Value"))
View(BreakingBud)
write.csv(BreakingBud,file = "BreakingBud.csv")
```

Before we go further filter the data its really important to change the date format in excel to short date. Goto the excel file breakinbud.csv,select the Observation\_Date column and then change it to type short date instead of general. There seems to some kind of issue with the excel file generated from the R markdown, we need to ensure that the Observation Date is of Date Type format before we can filter the BeachPlum data based on Year.

Now we filter the data set based on the Sites having beach plum plant that is Sites D,E,G

### Filter Based on the Sites

Now we filter Intensity data obtained from National Phenology Network based on the sites present at the Linda loring foundation.

``` r
BreakingBudData <- read.csv("BreakingBud.csv")
BreakingBudData$Observation_Date<-as.Date(BreakingBudData$Observation_Date,format("%m/%d/%Y"))
View(BreakingBudData)    
str(BreakingBudData)
```

    ## 'data.frame':    14334 obs. of  9 variables:
    ##  $ X                    : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ Site_Name            : Factor w/ 8 levels "Site A","Site B",..: 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Common_Name          : Factor w/ 8 levels "American hazelnut",..: 4 4 4 4 4 4 4 4 4 4 ...
    ##  $ Phenophase_Name      : Factor w/ 1 level "Breaking leaf buds": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Observation_Date     : Date, format: NA NA ...
    ##  $ Day_of_Year          : int  113 99 104 111 118 120 125 132 139 141 ...
    ##  $ Phenophase_Status    : int  0 0 0 0 0 0 0 1 1 0 ...
    ##  $ Intensity_Category_ID: int  39 39 39 39 39 39 39 39 39 39 ...
    ##  $ Intensity_Value      : Factor w/ 7 levels "-9999","1,001 to 10,000",..: 1 1 1 1 1 1 1 5 3 1 ...

##### Beach Plum-Site D

Site D

``` r
Site_D_BeachPlumBud <- subset(BreakingBudData,Site_Name=="Site D" & Common_Name=="beach plum")
View(Site_D_BeachPlumBud)
write.csv(Site_D_BeachPlumBud,file="Site_D_BeachPlum.csv")
```

##### Beach Plum-Site E

Site E

``` r
Site_E_BeachPlumBud <- subset(BreakingBudData,Site_Name=="Site E" & Common_Name=="beach plum")
View(Site_E_BeachPlumBud)
write.csv(Site_E_BeachPlumBud,file="Site_E_BeachPlum.csv")
```

##### Beach Plum-Site G

Site G

``` r
Site_G_BeachPlumBud <- subset(BreakingBudData,Site_Name=="Site G" & Common_Name=="beach plum")
View(Site_G_BeachPlumBud)
write.csv(Site_G_BeachPlumBud,file="Site_G_BeachPlum.csv")
```

Filtering Intensity data observed over the Years
------------------------------------------------

Next we further prepare the data for plotting of the breaking bud intensity observed at the different sites over the years. We use the functions as.Date to change the Observation Date from character to Date format in order to filter the data based on the years.

### BeachPlum BreakingBud Intensity Observed at Site D

``` r
SiteD_BeachPlum<-read.csv("Site_D_BeachPlum.csv",stringsAsFactors = FALSE)
SiteD_BeachPlum$Observation_Date<-as.Date(SiteD_BeachPlum$Observation_Date,format("%m/%d/%Y"))
View(SiteD_BeachPlum)
str(SiteD_BeachPlum)
```

    ## 'data.frame':    461 obs. of  10 variables:
    ##  $ X.1                  : int  5441 5442 5443 5444 5445 5446 5447 5448 5449 5450 ...
    ##  $ X                    : int  56724 56725 56726 56727 56728 56729 56730 56731 56732 56733 ...
    ##  $ Site_Name            : chr  "Site D" "Site D" "Site D" "Site D" ...
    ##  $ Common_Name          : chr  "beach plum" "beach plum" "beach plum" "beach plum" ...
    ##  $ Phenophase_Name      : chr  "Breaking leaf buds" "Breaking leaf buds" "Breaking leaf buds" "Breaking leaf buds" ...
    ##  $ Observation_Date     : Date, format: NA NA ...
    ##  $ Day_of_Year          : int  81 93 101 108 117 123 129 136 142 150 ...
    ##  $ Phenophase_Status    : int  0 0 0 0 0 0 0 0 1 1 ...
    ##  $ Intensity_Category_ID: int  39 39 39 39 39 39 39 39 39 39 ...
    ##  $ Intensity_Value      : chr  "-9999" "-9999" "-9999" "-9999" ...

#### For the Year 2016

``` r
SiteD_BeachPlum_2016<-subset(SiteD_BeachPlum,format(as.Date(SiteD_BeachPlum$Observation_Date),"%Y")==2016)
View(SiteD_BeachPlum)
write.csv(SiteD_BeachPlum_2016,file = "SiteD_BeachPlum_2016.csv")
```

#### For the Year 2017

``` r
SiteD_BeachPlum_2017<-subset(SiteD_BeachPlum, format(as.Date(SiteD_BeachPlum$Observation_Date),"%Y")==2017)
write.csv(SiteD_BeachPlum_2017,file = "SiteD_BeachPlum_2017.csv")
```

#### For the Year 2018

``` r
SiteD_BeachPlum_2018<-subset(SiteD_BeachPlum, format(as.Date(SiteD_BeachPlum$Observation_Date),"%Y")==2018)
write.csv(SiteD_BeachPlum_2018,file = "SiteD_BeachPlum_2018.csv")
```

### BeachPlum Breaking Bud Observed at Site E

``` r
SiteE_BeachPlum<-read.csv("Site_E_BeachPlum.csv",stringsAsFactors = FALSE)
SiteE_BeachPlum$Observation_Date<-as.Date(SiteE_BeachPlum$Observation_Date,format("%m/%d/%Y"))
View(SiteE_BeachPlum)
str(SiteE_BeachPlum)
```

    ## 'data.frame':    462 obs. of  10 variables:
    ##  $ X.1                  : int  7512 7513 7514 7515 7516 7517 7518 7519 7520 7521 ...
    ##  $ X                    : int  78174 78175 78176 78177 78178 78179 78180 78181 78182 78183 ...
    ##  $ Site_Name            : chr  "Site E" "Site E" "Site E" "Site E" ...
    ##  $ Common_Name          : chr  "beach plum" "beach plum" "beach plum" "beach plum" ...
    ##  $ Phenophase_Name      : chr  "Breaking leaf buds" "Breaking leaf buds" "Breaking leaf buds" "Breaking leaf buds" ...
    ##  $ Observation_Date     : Date, format: NA NA ...
    ##  $ Day_of_Year          : int  131 141 149 145 156 159 165 169 172 176 ...
    ##  $ Phenophase_Status    : int  0 0 0 0 1 1 1 0 1 1 ...
    ##  $ Intensity_Category_ID: int  39 39 39 39 39 39 39 39 39 39 ...
    ##  $ Intensity_Value      : chr  "-9999" "-9999" "-9999" "-9999" ...

#### For the Year 2016

``` r
SiteE_BeachPlum_2016<-subset(SiteE_BeachPlum, format(as.Date(SiteE_BeachPlum$Observation_Date),"%Y")==2016)
write.csv(SiteE_BeachPlum_2016,file = "SiteE_BeachPlum_2016.csv")
```

#### For the Year 2017

``` r
SiteE_BeachPlum_2017<-subset(SiteE_BeachPlum, format(as.Date(SiteE_BeachPlum$Observation_Date),"%Y")==2017)
write.csv(SiteE_BeachPlum_2017,file = "SiteE_BeachPlum_2017.csv")
```

#### For the Year 2018

``` r
SiteE_BeachPlum_2018<-subset(SiteE_BeachPlum, format(as.Date(SiteE_BeachPlum$Observation_Date),"%Y")==2018)
write.csv(SiteE_BeachPlum_2018,file = "SiteE_BeachPlum_2018.csv")
```

### BeachPlum Breaking Bud Observed at Site G

``` r
SiteG_BeachPlum<-read.csv("Site_G_BeachPlum.csv",stringsAsFactors = FALSE)
SiteG_BeachPlum$Observation_Date<-as.Date(SiteG_BeachPlum$Observation_Date,format("%m/%d/%Y"))
View(SiteG_BeachPlum)
str(SiteG_BeachPlum)
```

    ## 'data.frame':    458 obs. of  10 variables:
    ##  $ X.1                  : int  11391 11392 11393 11394 11395 11396 11397 11398 11399 11400 ...
    ##  $ X                    : int  118090 118091 118092 118093 118094 118095 118096 118097 118098 118099 ...
    ##  $ Site_Name            : chr  "Site G" "Site G" "Site G" "Site G" ...
    ##  $ Common_Name          : chr  "beach plum" "beach plum" "beach plum" "beach plum" ...
    ##  $ Phenophase_Name      : chr  "Breaking leaf buds" "Breaking leaf buds" "Breaking leaf buds" "Breaking leaf buds" ...
    ##  $ Observation_Date     : Date, format: NA NA ...
    ##  $ Day_of_Year          : int  167 134 174 178 180 187 191 195 199 202 ...
    ##  $ Phenophase_Status    : int  1 0 1 1 1 1 1 1 1 1 ...
    ##  $ Intensity_Category_ID: int  39 39 39 39 39 39 39 39 39 39 ...
    ##  $ Intensity_Value      : chr  "101 to 1,000" "-9999" "101 to 1,000" "101 to 1,000" ...

#### For the Year 2016

``` r
SiteG_BeachPlum_2016<-subset(SiteG_BeachPlum, format(as.Date(SiteG_BeachPlum$Observation_Date),"%Y")==2016)
write.csv(SiteG_BeachPlum_2016,file = "SiteG_BeachPlum_2016.csv")
```

#### For the Year 2017

``` r
SiteG_BeachPlum_2017<-subset(SiteG_BeachPlum, format(as.Date(SiteG_BeachPlum$Observation_Date),"%Y")==2017)
write.csv(SiteG_BeachPlum_2017,file = "SiteG_BeachPlum_2017.csv")
```

#### For the Year 2018

``` r
SiteG_BeachPlum_2018<-subset(SiteG_BeachPlum, format(as.Date(SiteG_BeachPlum$Observation_Date),"%Y")==2018)
write.csv(SiteG_BeachPlum_2018,file = "SiteG_BeachPlum_2018.csv")
```

Cleaning the Temperature Data Set
---------------------------------

In order to measure the impact of temperature on the breakingbud intensity we need to clean the temperature data,convert the dates to day so that we could have a common x axis in the plots for both the intensity data set and temperature data.

#### Convert the dates to days in the data set

``` r
June2017_siteD <- read.csv("Site_D.csv", header=TRUE)
June2017_siteD$Date <- format(as.POSIXct(strptime(June2017_siteD$ï..Date.Time,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
June2017_siteD$Day <- format(as.POSIXct(strptime(June2017_siteD$ï..Date.Time,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(June2017_siteD, "SiteD_June2017.csv")
```

``` r
June2017_siteE <- read.csv("Site_E.csv", header=TRUE)
June2017_siteE$Date <- format(as.POSIXct(strptime(June2017_siteE$ï..Date.Time,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
June2017_siteE$Day <- format(as.POSIXct(strptime(June2017_siteE$ï..Date.Time,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(June2017_siteE, "SiteE_June2017.csv")
```

``` r
June2017_siteG <- read.csv("Site_G.csv", header=TRUE)
June2017_siteG$Date <- format(as.POSIXct(strptime(June2017_siteG$ï..Date.Time,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
June2017_siteG$Day <- format(as.POSIXct(strptime(June2017_siteG$ï..Date.Time,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(June2017_siteG, "SiteG_June2017.csv")
```

#### Finding the average and minimum temperature.

We need to find the minimum temperature for the different sites for the different years 2016,2017,2018. So that we can compare the temperature of the day in a year with the Breaking bud intensity of Beachplum for that day.

##### Site D Min,avg Temperature

``` r
siteD_June2017 <- read.csv("SiteD_June2017.csv")

avg_siteD_2017 <- aggregate(Temp ~ Date, siteD_June2017, mean)

min_siteD_2017 <- aggregate(Temp ~ Date, siteD_June2017, min)

June2017_SiteD <- merge(min_siteD_2017, avg_siteD_2017, by="Date")

names(June2017_SiteD)[2]<-"Min Temp"

names(June2017_SiteD)[3]<-"Avg Temp"

June2017_SiteD$Day <- format(as.POSIXct(strptime(June2017_SiteD$Date,"%m/%d/%Y",tz="")) ,format = "%j")

write.csv(June2017_SiteD, "Min.Max_SiteDJune2017.csv")
```

##### Site E Min,avg Temperature

``` r
siteE_June2017 <- read.csv("SiteE_June2017.csv")

avg_siteE_2017 <- aggregate(Temp ~ Date, siteE_June2017, mean)

min_siteE_2017 <- aggregate(Temp ~ Date, siteE_June2017, min)

June2017_SiteE <- merge(min_siteE_2017, avg_siteE_2017, by="Date")

names(June2017_SiteE)[2]<-"Min Temp"

names(June2017_SiteE)[3]<-"Avg Temp"

June2017_SiteE$Day <- format(as.POSIXct(strptime(June2017_SiteE$Date,"%m/%d/%Y",tz="")) ,format = "%j")

write.csv(June2017_SiteE, "Min.Max_SiteEJune2017.csv")
```

##### Site G Min,avg Temperature

``` r
siteG_June2017 <- read.csv("SiteG_June2017.csv")

avg_siteG_2017 <- aggregate(Temp ~ Date, siteG_June2017, mean)

min_siteG_2017 <- aggregate(Temp ~ Date, siteG_June2017, min)

June2017_SiteG <- merge(min_siteG_2017, avg_siteG_2017, by="Date")

names(June2017_SiteG)[2]<-"Min Temp"

names(June2017_SiteG)[3]<-"Avg Temp"

June2017_SiteG$Day <- format(as.POSIXct(strptime(June2017_SiteG$Date,"%m/%d/%Y",tz="")) ,format = "%j")

write.csv(June2017_SiteG, "Min.Max_SiteGJune2017.csv")
```

DescriptiveStatistics
=====================

Now lets perform some descriptive statistics on the data we have. A histogram helps us to get an idea on the frequency distribution of the values.

Intensity Values
----------------

Lets plot the Histogram for the Breaking Bud Intensity value.

### SiteD

``` r
SiteD<-read.csv("Site_D_BeachPlum.csv")

hist(SiteD$Intensity_Value, col="blue", xlab="Site D BeachPlum BreakingBudIntensity", main="Breaking Bud Intensity-Site D")
```

![](BPYCleaning_files/figure-markdown_github/frequencyofintenstiy%20Site%20D%20-1.png)

### SiteE

``` r
SiteE<-read.csv("Site_E_BeachPlum.csv")

hist(SiteE$Intensity_Value, col="blue", xlab="Site E BeachPlum  BreakingBudIntensity", main="Breaking Bud Intensity-Site E")
```

![](BPYCleaning_files/figure-markdown_github/frequencyofintenstiy%20Site%20E%20-1.png)

### SiteG

``` r
SiteG<-read.csv("Site_G_BeachPlum.csv")

hist(SiteG$Intensity_Value, col="blue", xlab="Site G BeachPlum BreakingBudIntensity", main="Breaking Bud Intensity-Site G")
```

![](BPYCleaning_files/figure-markdown_github/frequencyofintenstiy%20Site%20G%20-1.png)

Temperature Values
------------------

Lets Plot an Histogram to see the distribution of the Minimum temperature across the Years and at different sites.

### Year 2016

#### Site D

``` r
SiteDTemp2016<-read.csv("Min.Max_SiteDJune2016.csv")

ggplot(data=SiteDTemp2016, aes(SiteDTemp2016$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site D Year 2016") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20D%202016-1.png)

#### Site E

``` r
SiteETemp2016<-read.csv("Min.Max_SiteEJune2016.csv")

ggplot(data=SiteETemp2016, aes(SiteETemp2016$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site E Year 2016") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20E%202016-1.png)

#### Site G

``` r
SiteGTemp2016<-read.csv("Min.Max_SiteGJune2016.csv")

ggplot(data=SiteGTemp2016, aes(SiteGTemp2016$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site G Year 2016") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20G%202016-1.png)

### Year 2017

#### Site D

``` r
SiteDTemp2017<-read.csv("Min.Max_SiteDJune2017.csv")

ggplot(data=SiteDTemp2017, aes(SiteDTemp2017$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site D Year 2017 ") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20D%202017-1.png)

#### Site E

``` r
SiteETemp2017<-read.csv("Min.Max_SiteEJune2017.csv")

ggplot(data=SiteETemp2017, aes(SiteETemp2017$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site E Year 2017 ") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20E%202017-1.png)

#### Site G

``` r
SiteGTemp2017<-read.csv("Min.Max_SiteGJune2017.csv")

ggplot(data=SiteGTemp2017, aes(SiteGTemp2017$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site G Year 2017 ") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20G%202017-1.png)

### Year 2018

#### Site D

``` r
SiteDTemp2018<-read.csv("Min.Max_SiteDMay2018.csv")

ggplot(data=SiteDTemp2018, aes(SiteDTemp2018$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site D Year 2018 ") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20D%202018-1.png)

#### Site E

``` r
SiteETemp2018<-read.csv("Min.Max_SiteEMay2018.csv")

ggplot(data=SiteETemp2018, aes(SiteETemp2018$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site E Year 2018 ") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20E%202018-1.png)

#### Site G

``` r
SiteGTemp2018<-read.csv("Min.Max_SiteGMay2018.csv")

ggplot(data=SiteGTemp2018, aes(SiteGTemp2018$Min.Temp)) + 
  geom_histogram( binwidth = 0.5,
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  labs(title="Histogram for Min Temperature Site G Year 2018 ") +
  labs(x="Min Temperature", y="Frequency") + 
  xlim(c(0,20)) +
  ylim(c(0,18))
```

![](BPYCleaning_files/figure-markdown_github/frequencyoftemperature%20Site%20G%202018-1.png)

Visualization
=============

Phenophase Intensity Vs Minimum Temperature of BeachPlum -2016
--------------------------------------------------------------

### Site D

``` r
SiteD_Beach_2016<-read.csv("SiteD_BeachPlum_2016.csv")



fig1<-ggplot(SiteD_Beach_2016, aes(SiteD_Beach_2016$Day_of_Year, SiteD_Beach_2016$Intensity_Value
)) +ggtitle("Beach Plum Breaking Leaf bud Intensity value throughout Year 2016 at Site D")+ geom_line() +geom_point() +xlab("Year 2016") + ylab("Breaking Bud IntensityValue")+xlim(c(100,200))


SiteDTemp2016<-read.csv("Min.Max_SiteDJune2016.csv")

SiteDTemp2016$Date<-as.Date(SiteDTemp2016$Date,format("%m/%d/%Y"))


fig2<-ggplot(SiteDTemp2016, aes(SiteDTemp2016$Day, SiteDTemp2016$Min.Temp
))+ggtitle("Temperature Plot at Site D in 2016") + geom_line(color="Red") + xlab("Year 2016") + ylab("MinTemp")


grid.arrange(fig1,fig2,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2016%20intensitydata%20SiteD-1.png)

### Site E

``` r
SiteE_Beach_2016<-read.csv("SiteE_BeachPlum_2016.csv")



fig7<-ggplot(SiteE_Beach_2016, aes(SiteE_Beach_2016$Day_of_Year, SiteE_Beach_2016$Intensity_Value
)) +ggtitle("Beach Plum Breaking Bud Intensity value throughout year 2016 at Site E")+ geom_line() +geom_point()+ xlab("Year 2016") + ylab("Breaking Bud Intensity Value")+xlim(c(100,200))


SiteETemp2016<-read.csv("Min.Max_SiteEJune2016.csv")

SiteETemp2016$Date<-as.Date(SiteETemp2016$Date,format("%m/%d/%Y"))


fig8<-ggplot(SiteETemp2016, aes(SiteETemp2016$Day, SiteETemp2016$Min.Temp
))+ggtitle("Temperature Plot at Site E in 2016") + geom_line(color="Red") + xlab("Year 2016") + ylab("MinTemp")


grid.arrange(fig7,fig8,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2016%20intensitydata%20Site%20E-1.png)

### Site G

``` r
SiteG_Beach_2016<-read.csv("SiteG_BeachPlum_2016.csv")



fig9<-ggplot(SiteG_Beach_2016, aes(SiteG_Beach_2016$Day_of_Year, SiteG_Beach_2016$Intensity_Value
)) +ggtitle("Beach Plum Breaking Bud Intensity value throughout year 2016 at Site G")+ geom_line() +geom_point()+ xlab("Year 2016") + ylab("Breaking Bud Intensity Value")+xlim(c(100,200))


SiteGTemp2016<-read.csv("Min.Max_SiteGJune2016.csv")

SiteGTemp2016$Date<-as.Date(SiteGTemp2016$Date,format("%m/%d/%Y"))


fig10<-ggplot(SiteGTemp2016, aes(SiteGTemp2016$Day, SiteGTemp2016$Min.Temp
))+ggtitle("Temperature Plot at Site G in 2016") + geom_line(color="Red") + xlab("Year 2016") + ylab("MinTemp")


grid.arrange(fig9,fig10,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2016%20intensitydata%20Site%20G-1.png)

Phenophase Intensity Vs Minimum Temperature of BeachPlum -2017
--------------------------------------------------------------

### Site D

``` r
SiteD_Beach_2017<-read.csv("SiteD_BeachPlum_2017.csv")



fig3<-ggplot(SiteD_Beach_2017, aes(SiteD_Beach_2017$Day_of_Year, SiteD_Beach_2017$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2017 at Site D")+ geom_line() + geom_point()+xlab("Year 2017") + ylab("Breaking Bud Intensity Value")+xlim(c(100,200))



SiteDTemp2017<-read.csv("Min.Max_SiteDJune2017.csv")

SiteDTemp2017$Date<-as.Date(SiteDTemp2017$Date,format("%m/%d/%Y"))


fig4<-ggplot(SiteDTemp2017, aes(SiteDTemp2017$Day, SiteDTemp2017$Min.Temp
))+ggtitle("Temperature Plot Site D") + geom_line(color="Red") + xlab("Year 2017") + ylab("MinTemp")


grid.arrange(fig3,fig4,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2017%20intensitydata%20SiteD-1.png)

### Site E

``` r
SiteE_Beach_2017<-read.csv("SiteE_BeachPlum_2017.csv")



fig11<-ggplot(SiteE_Beach_2017, aes(SiteE_Beach_2017$Day_of_Year, SiteE_Beach_2017$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2017 at Site E")+ geom_point() +geom_line()+ xlab("Year 2017") + ylab("Breaking Bud Intensity Value")+xlim(c(100,200))



SiteETemp2017<-read.csv("Min.Max_SiteEJune2017.csv")

SiteETemp2017$Date<-as.Date(SiteETemp2017$Date,format("%m/%d/%Y"))


fig12<-ggplot(SiteETemp2017, aes(SiteETemp2017$Day, SiteETemp2017$Min.Temp
))+ggtitle("Temperature Plot Site E") + geom_line(color="Red") + xlab("Year 2017") + ylab("MinTemp")


grid.arrange(fig11,fig12,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2017%20intensitydata%20SiteE-1.png)

### SiteG

``` r
SiteG_Beach_2017<-read.csv("SiteG_BeachPlum_2017.csv")



fig13<-ggplot(SiteG_Beach_2017, aes(SiteG_Beach_2017$Day_of_Year, SiteG_Beach_2017$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2017 at Site G")+ geom_point() +geom_line()+ xlab("Year 2017") + ylab("Breaking Bud Intensity Value")+xlim(c(100,200))



SiteGTemp2017<-read.csv("Min.Max_SiteGJune2017.csv")

SiteGTemp2017$Date<-as.Date(SiteGTemp2017$Date,format("%m/%d/%Y"))


fig14<-ggplot(SiteGTemp2017, aes(SiteGTemp2017$Day, SiteGTemp2017$Min.Temp
))+ggtitle("Temperature Plot Site G") + geom_line(color="Red") + xlab("Year 2017") + ylab("MinTemp")


grid.arrange(fig13,fig14,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2017%20intensitydata%20SiteG-1.png)

Phenophase Intensity Vs Minimum Temperature of BeachPlum-2018
-------------------------------------------------------------

### Site D

``` r
SiteD_Beach_2018<-read.csv("SiteD_BeachPlum_2018.csv")



fig5<-ggplot(SiteD_Beach_2018, aes(SiteD_Beach_2018$Day_of_Year, SiteD_Beach_2018$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2018 at Site D")+ geom_line() +geom_point()+ xlab("Year 2018") + ylab("BreakingBud Intensity Value")+xlim(c(100,200))



SiteDTemp2018<-read.csv("Min.Max_SiteDMay2018.csv")

SiteDTemp2018$Date<-as.Date(SiteDTemp2018$Date,format("%m/%d/%Y"))


fig6<-ggplot(SiteDTemp2018, aes(SiteDTemp2018$Day, SiteDTemp2018$Min.Temp
))+ggtitle("Temperature Plot Site D ") + geom_line(color="Red") + xlab("Year 2018") + ylab("MinTemp")+xlim(c(100,200))


grid.arrange(fig5,fig6,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2018%20intensitydata%20SiteD-1.png)

### Site E

``` r
SiteE_Beach_2018<-read.csv("SiteE_BeachPlum_2018.csv")



fig15<-ggplot(SiteE_Beach_2018, aes(SiteE_Beach_2018$Day_of_Year, SiteE_Beach_2018$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2018 at Site E")+ geom_line() +geom_point()+ xlab("Year 2018") + ylab("BreakingBud Intensity Value")+xlim(c(100,200))



SiteETemp2018<-read.csv("Min.Max_SiteEMay2018.csv")

SiteETemp2018$Date<-as.Date(SiteETemp2018$Date,format("%m/%d/%Y"))


fig16<-ggplot(SiteETemp2018, aes(SiteETemp2018$Day, SiteETemp2018$Min.Temp
))+ggtitle("Temperature Plot Site D ") + geom_line(color="Red") + xlab("Year 2018") + ylab("MinTemp")+xlim(c(100,200))


grid.arrange(fig15,fig16,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2018%20intensitydata%20SiteE-1.png)

### Site G

``` r
SiteG_Beach_2018<-read.csv("SiteG_BeachPlum_2018.csv")



fig15<-ggplot(SiteG_Beach_2018, aes(SiteG_Beach_2018$Day_of_Year, SiteG_Beach_2018$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2018 at Site G")+ geom_line() +geom_point()+ xlab("Year 2018") + ylab("BreakingBud Intensity Value")+xlim(c(100,200))



SiteETemp2018<-read.csv("Min.Max_SiteEMay2018.csv")

SiteETemp2018$Date<-as.Date(SiteETemp2018$Date,format("%m/%d/%Y"))


fig16<-ggplot(SiteETemp2018, aes(SiteETemp2018$Day, SiteETemp2018$Min.Temp
))+ggtitle("Temperature Plot Site D ") + geom_line(color="Red") + xlab("Year 2018") + ylab("MinTemp")+xlim(c(100,200))


grid.arrange(fig15,fig16,nrow=2)
```

![](BPYCleaning_files/figure-markdown_github/read%20BeachPlum2018%20intensitydata%20SiteG-1.png)
