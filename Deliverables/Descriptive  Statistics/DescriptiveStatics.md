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
        -   [On BeachPlum](#on-beachplum)
        -   [On BearOak](#on-bearoak)
        -   [On American hazelnut](#on-american-hazelnut)
        -   [On Black huckleberry](#on-black-huckleberry)
        -   [On Lowbush blueberry](#on-lowbush-blueberry)
        -   [On Northern bayberry](#on-northern-bayberry)
        -   [On Southern Arrowwood](#on-southern-arrowwood)

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

#### On BeachPlum

``` r
summary(BeachPlum)
##        X            Site_Name              Common_Name  
##  Min.   : 56724   Site E :462   beach plum       :1381  
##  1st Qu.: 57069   Site D :461   American hazelnut:   0  
##  Median : 78403   Site G :458   bear oak         :   0  
##  Mean   : 84481   Site A :  0   black cherry     :   0  
##  3rd Qu.:118202   Site B :  0   black huckleberry:   0  
##  Max.   :118547   Site C :  0   lowbush blueberry:   0  
##                   (Other):  0   (Other)          :   0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:1381   2015-04-09:   9    Min.   : 72.0  
##                            2015-04-14:   9    1st Qu.:141.0  
##                            2015-04-16:   9    Median :182.0  
##                            2015-04-21:   9    Mean   :184.6  
##                            2015-04-23:   9    3rd Qu.:222.0  
##                            2015-04-28:   9    Max.   :319.0  
##                            (Other)   :1327                   
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :0.0000    Min.   :39            -9999           :1033  
##  1st Qu.:0.0000    1st Qu.:39            1,001 to 10,000 :  27  
##  Median :0.0000    Median :39            101 to 1,000    :  72  
##  Mean   :0.2534    Mean   :39            11 to 100       : 122  
##  3rd Qu.:1.0000    3rd Qu.:39            3 to 10         :  83  
##  Max.   :1.0000    Max.   :39            Less than 3     :  34  
##                                          More than 10,000:  10
```

##### At Site D

``` r
SummaryBeachPlumSiteD<-read.csv("Site_D_BeachPlumBud.csv")
summary(SummaryBeachPlumSiteD)
##       X.1             X          Site_Name       Common_Name 
##  Min.   :5441   Min.   :56724   Site D:461   beach plum:461  
##  1st Qu.:5556   1st Qu.:56839                                
##  Median :5671   Median :56954                                
##  Mean   :5671   Mean   :56954                                
##  3rd Qu.:5786   3rd Qu.:57069                                
##  Max.   :5901   Max.   :57184                                
##                                                              
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:461    2015-04-02:  3     Min.   : 79.0  
##                            2015-04-09:  3     1st Qu.:142.0  
##                            2015-04-14:  3     Median :183.0  
##                            2015-04-16:  3     Mean   :185.3  
##                            2015-04-21:  3     3rd Qu.:223.0  
##                            2015-04-23:  3     Max.   :319.0  
##                            (Other)   :443                    
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :0.0000    Min.   :39            -9999           :345   
##  1st Qu.:0.0000    1st Qu.:39            1,001 to 10,000 :  9   
##  Median :0.0000    Median :39            101 to 1,000    : 34   
##  Mean   :0.2516    Mean   :39            11 to 100       : 33   
##  3rd Qu.:1.0000    3rd Qu.:39            3 to 10         : 27   
##  Max.   :1.0000    Max.   :39            Less than 3     : 12   
##                                          More than 10,000:  1
```

##### At Site E

``` r
SummaryBeachPlumSiteE<-read.csv("Site_E_BeachPlumBud.csv")
summary(SummaryBeachPlumSiteE)
##       X.1             X          Site_Name       Common_Name 
##  Min.   :7512   Min.   :78174   Site E:462   beach plum:462  
##  1st Qu.:7627   1st Qu.:78289                                
##  Median :7742   Median :78405                                
##  Mean   :7742   Mean   :78405                                
##  3rd Qu.:7858   3rd Qu.:78520                                
##  Max.   :7973   Max.   :78635                                
##                                                              
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:462    2015-04-02:  3     Min.   : 72.0  
##                            2015-04-09:  3     1st Qu.:141.0  
##                            2015-04-14:  3     Median :181.0  
##                            2015-04-16:  3     Mean   :183.6  
##                            2015-04-21:  3     3rd Qu.:222.0  
##                            2015-04-23:  3     Max.   :319.0  
##                            (Other)   :444                    
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :0.0000    Min.   :39            -9999           :355   
##  1st Qu.:0.0000    1st Qu.:39            1,001 to 10,000 :  1   
##  Median :0.0000    Median :39            101 to 1,000    :  7   
##  Mean   :0.2359    Mean   :39            11 to 100       : 40   
##  3rd Qu.:0.0000    3rd Qu.:39            3 to 10         : 41   
##  Max.   :1.0000    Max.   :39            Less than 3     : 17   
##                                          More than 10,000:  1
```

##### At Site G

``` r
SummaryBeachPlumSiteG<-read.csv("Site_G_BeachPlumBud.csv")
summary(SummaryBeachPlumSiteG)
##       X.1              X           Site_Name       Common_Name 
##  Min.   :11391   Min.   :118090   Site G:458   beach plum:458  
##  1st Qu.:11505   1st Qu.:118204                                
##  Median :11620   Median :118319                                
##  Mean   :11620   Mean   :118319                                
##  3rd Qu.:11734   3rd Qu.:118433                                
##  Max.   :11848   Max.   :118547                                
##                                                                
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:458    2015-04-09:  3     Min.   : 79.0  
##                            2015-04-14:  3     1st Qu.:142.0  
##                            2015-04-16:  3     Median :182.0  
##                            2015-04-21:  3     Mean   :184.9  
##                            2015-04-23:  3     3rd Qu.:222.0  
##                            2015-04-28:  3     Max.   :319.0  
##                            (Other)   :440                    
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :0.0000    Min.   :39            -9999           :333   
##  1st Qu.:0.0000    1st Qu.:39            1,001 to 10,000 : 17   
##  Median :0.0000    Median :39            101 to 1,000    : 31   
##  Mean   :0.2729    Mean   :39            11 to 100       : 49   
##  3rd Qu.:1.0000    3rd Qu.:39            3 to 10         : 15   
##  Max.   :1.0000    Max.   :39            Less than 3     :  5   
##                                          More than 10,000:  8
```

#### On BearOak

``` r
summary(BearOak)
##        X            Site_Name              Common_Name  
##  Min.   : 18459   Site A :414   bear oak         :1976  
##  1st Qu.: 48593   Site G :393   American hazelnut:   0  
##  Median : 69435   Site C :391   beach plum       :   0  
##  Mean   : 74075   Site D :389   black cherry     :   0  
##  3rd Qu.:105733   Site F :389   black huckleberry:   0  
##  Max.   :131217   Site B :  0   lowbush blueberry:   0  
##                   (Other):  0   (Other)          :   0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:1976   2015-04-09:  15    Min.   : 79.0  
##                            2015-04-14:  15    1st Qu.:138.0  
##                            2015-04-16:  15    Median :187.0  
##                            2015-04-21:  15    Mean   :186.4  
##                            2015-04-23:  15    3rd Qu.:229.0  
##                            2015-04-28:  15    Max.   :319.0  
##                            (Other)   :1886                   
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :-1.0000   Min.   :39            -9999           :1349  
##  1st Qu.: 0.0000   1st Qu.:39            1,001 to 10,000 : 113  
##  Median : 0.0000   Median :39            101 to 1,000    : 160  
##  Mean   : 0.2996   Mean   :39            11 to 100       : 232  
##  3rd Qu.: 1.0000   3rd Qu.:39            3 to 10         :  73  
##  Max.   : 1.0000   Max.   :39            Less than 3     :  10  
##                                          More than 10,000:  39
```

#### On American hazelnut

``` r
summary(AmericanHazelnut)
##        X            Site_Name              Common_Name 
##  Min.   :  4726   Site A :468   American hazelnut:923  
##  1st Qu.:  4956   Site H :455   beach plum       :  0  
##  Median :  5187   Site B :  0   bear oak         :  0  
##  Mean   : 73463   Site C :  0   black cherry     :  0  
##  3rd Qu.:143921   Site D :  0   black huckleberry:  0  
##  Max.   :144151   Site E :  0   lowbush blueberry:  0  
##                   (Other):  0   (Other)          :  0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:923    2015-04-09:  6     Min.   : 79.0  
##                            2015-04-14:  6     1st Qu.:141.0  
##                            2015-04-16:  6     Median :182.0  
##                            2015-04-21:  6     Mean   :185.1  
##                            2015-04-23:  6     3rd Qu.:223.0  
##                            2015-04-28:  6     Max.   :319.0  
##                            (Other)   :887                    
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :0.0000    Min.   :39            -9999           :631   
##  1st Qu.:0.0000    1st Qu.:39            1,001 to 10,000 :  0   
##  Median :0.0000    Median :39            101 to 1,000    :  0   
##  Mean   :0.3185    Mean   :39            11 to 100       : 39   
##  3rd Qu.:1.0000    3rd Qu.:39            3 to 10         :141   
##  Max.   :1.0000    Max.   :39            Less than 3     :112   
##                                          More than 10,000:  0
```

#### On Black huckleberry

``` r
summary(BlackHuckleBerry)
##        X            Site_Name              Common_Name  
##  Min.   :  9873   Site A :410   black huckleberry:2355  
##  1st Qu.: 28036   Site B :404   American hazelnut:   0  
##  Median : 40729   Site G :391   beach plum       :   0  
##  Mean   : 57099   Site E :390   bear oak         :   0  
##  3rd Qu.: 82980   Site C :389   black cherry     :   0  
##  Max.   :123062   Site D :371   lowbush blueberry:   0  
##                   (Other):  0   (Other)          :   0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:2355   2015-04-09:  18    Min.   : 72.0  
##                            2015-04-14:  18    1st Qu.:138.0  
##                            2015-04-16:  18    Median :183.0  
##                            2015-04-21:  18    Mean   :185.7  
##                            2015-04-23:  18    3rd Qu.:226.0  
##                            2015-04-28:  18    Max.   :319.0  
##                            (Other)   :2247                   
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :-1.0000   Min.   :39            -9999           :1992  
##  1st Qu.: 0.0000   1st Qu.:39            1,001 to 10,000 :   1  
##  Median : 0.0000   Median :39            101 to 1,000    :   3  
##  Mean   : 0.1503   Mean   :39            11 to 100       : 112  
##  3rd Qu.: 0.0000   3rd Qu.:39            3 to 10         : 142  
##  Max.   : 1.0000   Max.   :39            Less than 3     : 105  
##                                          More than 10,000:   0
```

#### On Lowbush blueberry

``` r
summary(LowBushBlueBerry)
##        X            Site_Name              Common_Name  
##  Min.   : 22997   Site B :403   lowbush blueberry:1586  
##  1st Qu.: 36708   Site G :392   American hazelnut:   0  
##  Median : 53182   Site C :391   beach plum       :   0  
##  Mean   : 82321   Site F :378   bear oak         :   0  
##  3rd Qu.:110107   Site A : 22   black cherry     :   0  
##  Max.   :135536   Site D :  0   black huckleberry:   0  
##                   (Other):  0   (Other)          :   0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:1586   2017-04-03:  14    Min.   : 79.0  
##                            2017-04-11:  14    1st Qu.:136.0  
##                            2017-04-18:  14    Median :183.0  
##                            2017-05-03:  14    Mean   :185.2  
##                            2017-05-09:  14    3rd Qu.:226.0  
##                            2017-05-16:  14    Max.   :319.0  
##                            (Other)   :1502                   
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :-1.0000   Min.   :39            -9999           :1186  
##  1st Qu.: 0.0000   1st Qu.:39            1,001 to 10,000 :   0  
##  Median : 0.0000   Median :39            101 to 1,000    :   2  
##  Mean   : 0.2383   Mean   :39            11 to 100       : 146  
##  3rd Qu.: 1.0000   3rd Qu.:39            3 to 10         : 152  
##  Max.   : 1.0000   Max.   :39            Less than 3     : 100  
##                                          More than 10,000:   0
```

#### On Northern bayberry

``` r
summary(NorthernBayBerry)
##        X            Site_Name              Common_Name  
##  Min.   : 13982   Site E :502   northern bayberry:2876  
##  1st Qu.: 32205   Site A :413   American hazelnut:   0  
##  Median : 65256   Site B :408   beach plum       :   0  
##  Mean   : 67350   Site G :393   bear oak         :   0  
##  3rd Qu.:101389   Site C :392   black cherry     :   0  
##  Max.   :126969   Site D :389   black huckleberry:   0  
##                   (Other):379   (Other)          :   0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:2876   2015-04-09:  22    Min.   : 72.0  
##                            2015-04-14:  22    1st Qu.:138.0  
##                            2015-04-16:  22    Median :187.0  
##                            2015-04-21:  22    Mean   :185.9  
##                            2015-04-23:  22    3rd Qu.:229.0  
##                            2015-04-28:  22    Max.   :319.0  
##                            (Other)   :2744                   
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :0.0000    Min.   :39            -9999           :2338  
##  1st Qu.:0.0000    1st Qu.:39            1,001 to 10,000 :   6  
##  Median :0.0000    Median :39            101 to 1,000    :  79  
##  Mean   :0.1871    Mean   :39            11 to 100       : 313  
##  3rd Qu.:0.0000    3rd Qu.:39            3 to 10         :  96  
##  Max.   :1.0000    Max.   :39            Less than 3     :  44  
##                                          More than 10,000:   0
```

#### On Southern Arrowwood

``` r
summary(SouthernArrowWood)
##        X           Site_Name               Common_Name 
##  Min.   :23217   Site B :464   southern arrowwood:920  
##  1st Qu.:23447   Site F :456   American hazelnut :  0  
##  Median :23677   Site A :  0   beach plum        :  0  
##  Mean   :59907   Site C :  0   bear oak          :  0  
##  3rd Qu.:97002   Site D :  0   black cherry      :  0  
##  Max.   :97232   Site E :  0   black huckleberry :  0  
##                  (Other):  0   (Other)           :  0  
##            Phenophase_Name   Observation_Date  Day_of_Year   
##  Breaking leaf buds:920    2015-04-02:  6     Min.   : 79.0  
##                            2015-04-09:  6     1st Qu.:141.0  
##                            2015-04-14:  6     Median :182.0  
##                            2015-04-16:  6     Mean   :185.2  
##                            2015-04-21:  6     3rd Qu.:223.0  
##                            2015-04-23:  6     Max.   :319.0  
##                            (Other)   :884                    
##  Phenophase_Status Intensity_Category_ID         Intensity_Value
##  Min.   :-1.0000   Min.   :39            -9999           :684   
##  1st Qu.: 0.0000   1st Qu.:39            1,001 to 10,000 :  1   
##  Median : 0.0000   Median :39            101 to 1,000    : 79   
##  Mean   : 0.2511   Mean   :39            11 to 100       :109   
##  3rd Qu.: 1.0000   3rd Qu.:39            3 to 10         : 39   
##  Max.   : 1.0000   Max.   :39            Less than 3     :  8   
##                                          More than 10,000:  0
```
