Data Filtering on Species
================
Karthik
October 29, 2018

-   [Purpose](#purpose)
    -   [Data Source:](#data-source)
    -   [Steps Taken to Clean the Data:](#steps-taken-to-clean-the-data)
        -   [Loading the data](#loading-the-data)
        -   [Filtering Columns](#filtering-columns)
        -   [The CSV file on BreakingBud Phenophase](#the-csv-file-on-breakingbud-phenophase)
    -   [Filtering Data](#filtering-data)
        -   [For different species](#for-different-species)
        -   [For different sites](#for-different-sites)
        -   [For Specific Species and differnt Sites.](#for-specific-species-and-differnt-sites.)
    -   [Descriptive Statictics](#descriptive-statictics)
        -   [On BlackCherry](#on-blackcherry)

------------------------------------------------------------------------

Purpose
=======

The purpose of this document is to provide the steps taken to filter the data on different species based on the phenophase breakingbud. We later perform the necessary functions of plotting/descriptive statistics.

### Data Source:

Data obtained from <https://www.usanpn.org/data/observational> on all the 8species from Linda Loring Nature Foundation.

#### Data File:

"AllSpecies.csv" --Status Intensity Observation Data

Steps Taken to Clean the Data:
------------------------------

Download the data from National Phenology network site by giving the necessary inputs like data range, species and state. Next Select phenophase such as flowers, fruits, leaves etc. Select the partner groups as Linda Loring Foundation, Source data set as Natures notebook then select the optional fields required like Site Name and Phenophase category.

-   Create a New R script
-   Set the working directory with setwd()

``` r
knitr::opts_chunk$set(cache=TRUE)
knitr::opts_knit$set(root.dir = "D:/MS/Temporary data/Descriptivestatistics") 
```

### Loading the data

Load the AllSpecies.csv file into a dataframe variable using the following R script

``` r
AllSpecies <- read.csv("AllSpecies.csv")
View(AllSpecies)    
```

Invoke the required libraries

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

### Filtering Columns

Use the select function to select only the required important columns for the species data also which have breaking bud as the phenophase.

``` r
BreakingBud=subset(AllSpecies,AllSpecies$Phenophase_Name=="Breaking leaf buds",select =c("Site_Name","Common_Name","Phenophase_Name","Observation_Date","Day_of_Year","Phenophase_Status","Intensity_Category_ID","Intensity_Value"))
View(BreakingBud)
```

``` r
write.csv(BreakingBud,file = "BreakingBud.csv")
```

### The CSV file on BreakingBud Phenophase

Read the data from BreakingBud

``` r
BreakingBudData<-read.csv("BreakingBud.csv")
```

Filtering Data
--------------

Now we need to filter the data set based on the species.

#### For different species

##### BlackCherry

Then filter the data set based on the common name as *black cherry*

``` r
BlackCherry <- subset(BreakingBudData,Common_Name=="black cherry")
View(BlackCherry)
```

Write the dataset of BlackCherry to a csv and name it.

``` r
write.csv(BlackCherry,file="BlackCherry.csv")
```

Follow the same R code for different data set.

##### Beach Plum

Now we filter the data set based on the common name *beach plum*

``` r
BeachPlum <- subset(BreakingBudData,Common_Name=="beach plum")
View(BeachPlum)
```

Write the dataset of BeachPlum to a csv and name it.

``` r
write.csv(BeachPlum,file="BeachPlum.csv")
```

##### American hazelnut

Now we filter the data set based on the common name *American hazelnut*

``` r
AmericanHazelnut <- subset(BreakingBudData,Common_Name=="American hazelnut")
View(AmericanHazelnut)
```

Write the dataset of AmericanHazelnut to a csv and name it.

``` r
write.csv(AmericanHazelnut,file="AmericanHazelnut.csv")
```

##### Bear Oak

Now we filter the data set based on the common name *bear oak*

``` r
BearOak <- subset(BreakingBudData,Common_Name=="bear oak")
View(BearOak)
```

Write the dataset of Bear Oak to a csv and name it.

``` r
write.csv(BearOak,file="BearOak.csv")
```

##### Black huckleberry

Now we filter the data set based on the common name *black huckleberry*

``` r
BlackHuckleBerry <- subset(BreakingBudData,Common_Name=="black huckleberry")
View(BlackHuckleBerry)
```

Write the dataset of Black Huckleberry to a csv and name it.

``` r
write.csv(BlackHuckleBerry,file="BlackHuckleBerry.csv")
```

##### Lowbush blueberry

Now we filter the data set based on the common name *lowbush blueberry*

``` r
LowBushBlueBerry <- subset(BreakingBudData,Common_Name=="lowbush blueberry")
View(LowBushBlueBerry)
```

Write the dataset of lowbush blueberry to a csv and name it.

``` r
write.csv(LowBushBlueBerry,file="LowBushBlueBerry.csv")
```

##### Northern bayberry

Now we filter the data set based on the common name *northern bayberry*

``` r
NorthernBayBerry <- subset(BreakingBudData,Common_Name=="northern bayberry")
View(NorthernBayBerry)
```

Write the dataset of northern bayberry to a csv and name it.

``` r
write.csv(NorthernBayBerry,file="NorthernBayBerry.csv")
```

##### Southern arrowwood

Now we filter the data set based on the common name *southern arrowwood*

``` r
SouthernArrowWood <- subset(BreakingBudData,Common_Name=="southern arrowwood")
View(SouthernArrowWood)
```

Write the dataset of southern arrowwood to a csv and name it.

``` r
write.csv(NorthernBayBerry,file="SouthernArrowWood.csv")
```

#### For different sites

##### Site A

Now we filter the data set based on the Sites *Site A*

``` r
Site_A_BreakingBud <- subset(BreakingBudData,Site_Name=="Site A")
View(Site_A_BreakingBud)
```

``` r
write.csv(Site_A_BreakingBud,file="Site_A_BreakingBud.csv")
```

##### Site B

Now we filter the data set based on the Sites *Site B*

``` r
Site_B_BreakingBud <- subset(BreakingBudData,Site_Name=="Site B")
View(Site_B_BreakingBud)
```

``` r
write.csv(Site_B_BreakingBud,file="Site_B_BreakingBud.csv")
```

##### Site C

Now we filter the data set based on the Sites *Site C*

``` r
Site_C_BreakingBud <- subset(BreakingBudData,Site_Name=="Site C")
View(Site_C_BreakingBud)
```

``` r
write.csv(Site_C_BreakingBud,file="Site_C_BreakingBud.csv")
```

##### Site D

Now we filter the data set based on the Sites *Site D*

``` r
Site_D_BreakingBud <- subset(BreakingBudData,Site_Name=="Site D")
View(Site_D_BreakingBud)
```

``` r
write.csv(Site_D_BreakingBud,file="Site_D_BreakingBud.csv")
```

##### Site E

Now we filter the data set based on the Sites *Site E*

``` r
Site_E_BreakingBud <- subset(BreakingBudData,Site_Name=="Site E")
View(Site_E_BreakingBud)
```

``` r
write.csv(Site_E_BreakingBud,file="Site_E_BreakingBud.csv")
```

##### Site F

Now we filter the data set based on the Sites *Site F*

``` r
Site_F_BreakingBud <- subset(BreakingBudData,Site_Name=="Site F")
View(Site_F_BreakingBud)
```

``` r
write.csv(Site_F_BreakingBud,file="Site_F_BreakingBud.csv")
```

##### Site G

Now we filter the data set based on the Sites *Site G*

``` r
Site_G_BreakingBud <- subset(BreakingBudData,Site_Name=="Site G")
View(Site_G_BreakingBud)
```

``` r
write.csv(Site_G_BreakingBud,file="Site_G_BreakingBud.csv")
```

##### Site H

Now we filter the data set based on the Sites *Site H*

``` r
Site_H_BreakingBud <- subset(BreakingBudData,Site_Name=="Site H")
View(Site_H_BreakingBud)
```

``` r
write.csv(Site_H_BreakingBud,file="Site_H_BreakingBud.csv")
```

#### For Specific Species and differnt Sites.

##### Filtering the Data Based on Data for Site=D,E,G and Species= Beach Plum

Based on the csv file we have we can analyze that certain species are spread over the more than one site. We group the sites based on the species and create individual files so that we can compare the phenophase intensity of the species across the sites in which its present.

Below is the details on the species and their corressponding sites.

Black Cherry --Site A,E,F,G,H

Beach Plum ---Site D,E,G

BlackHackle Berry-- Site A,B,C,D,E,G

Lowbush BlueBerry-- Site A,B,C,F,G

American Hazelnut-- Site A,H

Bear Oak-- Site A,C,D,F,G

Northern Bayberry-- Site A,B,C,D,E,F,G

Southern ArrowWood-- Site B,F

###### Beach Plum-Site D

Now we filter the data set based on the Sites having beach plum plant that is Sites D,E,G

Site D

``` r
Site_D_BeachPlumBud <- subset(BreakingBudData,Site_Name=="Site D" & Common_Name=="beach plum")
View(Site_D_BeachPlumBud)
```

``` r
write.csv(Site_D_BeachPlumBud,file="Site_D_BeachPlumBud.csv")
```

###### Beach Plum-Site E

Site E

``` r
Site_E_BeachPlumBud <- subset(BreakingBudData,Site_Name=="Site E" & Common_Name=="beach plum")
View(Site_E_BeachPlumBud)
```

``` r
write.csv(Site_E_BeachPlumBud,file="Site_E_BeachPlumBud.csv")
```

###### Beach Plum-Site G

Site G

``` r
Site_G_BeachPlumBud <- subset(BreakingBudData,Site_Name=="Site G" & Common_Name=="beach plum")
View(Site_G_BeachPlumBud)
```

``` r
write.csv(Site_G_BeachPlumBud,file="Site_G_BeachPlumBud.csv")
```

Descriptive Statictics
----------------------

Now lets perform some basic descriptive statistics on our data we have derived.

#### On BlackCherry

``` r
summary(BlackCherry)
##        X            Site_Name              Common_Name  
##  Min.   :     1   Site A :471   black cherry     :2317  
##  1st Qu.: 73669   Site F :465   American hazelnut:   0  
##  Median : 92354   Site H :462   beach plum       :   0  
##  Mean   : 83522   Site E :461   bear oak         :   0  
##  3rd Qu.:113847   Site G :458   black huckleberry:   0  
##  Max.   :139523   Site B :  0   lowbush blueberry:   0  
##                   (Other):  0   (Other)          :   0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:2317   2015-04-09:  15    Min.   : 72.0  
##                            2015-04-14:  15    1st Qu.:141.0  
##                            2015-04-16:  15    Median :181.0  
##                            2015-04-21:  15    Mean   :183.9  
##                            2015-04-23:  15    3rd Qu.:222.0  
##                            2015-04-28:  15    Max.   :319.0  
##                            (Other)   :2227                   
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :-1.0000   Min.   :39            -9999           :1681  
##  1st Qu.: 0.0000   1st Qu.:39            1,001 to 10,000 :  84  
##  Median : 0.0000   Median :39            101 to 1,000    : 163  
##  Mean   : 0.2637   Mean   :39            11 to 100       : 244  
##  3rd Qu.: 1.0000   3rd Qu.:39            3 to 10         : 116  
##  Max.   : 1.0000   Max.   :39            Less than 3     :  24  
##                                          More than 10,000:   5
```
