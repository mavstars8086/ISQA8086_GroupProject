HTML Summary
================
December 5 2018

-   [Introduction](#introduction)
-   [BackGround Information](#background-information)
    -   [LLNF Overview & Mission](#llnf-overview-mission)
    -   [LLNF History](#llnf-history)
    -   [LLNF Focus](#llnf-focus)
    -   [Year/Summer Programs](#yearsummer-programs)
    -   [Membership & Social Media](#membership-social-media)
    -   [Advocacy and Policy](#advocacy-and-policy)
-   [Target Audience](#target-audience)
-   [Target Analysis](#target-analysis)
-   [Phenology](#phenology)
-   [Source Data](#source-data)
-   [Data Processing](#data-processing)
-   [Data Visuals](#data-visuals)
    -   [Phenophase Intensity Vs Minimum Temperature of BeachPlum -2016](#phenophase-intensity-vs-minimum-temperature-of-beachplum--2016)
        -   [Site D](#site-d)
        -   [Site E](#site-e)
        -   [Site G](#site-g)
    -   [Phenophase Intensity Vs Minimum Temperature of BeachPlum -2017](#phenophase-intensity-vs-minimum-temperature-of-beachplum--2017)
        -   [Site D](#site-d-1)
        -   [Site E](#site-e-1)
        -   [SiteG](#siteg)
    -   [Phenophase Intensity Vs Minimum Temperature of BeachPlum-2018](#phenophase-intensity-vs-minimum-temperature-of-beachplum-2018)
        -   [Site D](#site-d-2)
        -   [Site E](#site-e-2)
        -   [Site G](#site-g-1)
-   [Data Interpretations](#data-interpretations)
-   [References](#references)

------------------------------------------------------------------------

Introduction
============

BackGround Information
======================

LLNF Overview & Mission
-----------------------

LLNF History
------------

LLNF Focus
----------

Year/Summer Programs
--------------------

Membership & Social Media
-------------------------

Advocacy and Policy
-------------------

Target Audience
===============

Target Analysis
===============

Phenology
=========

Source Data
===========

Data Processing
===============

Data Visuals
============

Below we have the different plots obtained from the data set. We have two different plots , the first plot is the breakingbud intensity over the days in a year and the second plot is the minimum temperature plotted over the days in a year specifically during the spring time when the breaking bud occurs.

The two plots are plotted over different sites each at different years.

``` r
knitr::opts_chunk$set(cache=TRUE)
knitr::opts_knit$set(root.dir = "D:/MS/D2D Final/Data Source/BeachPlum/HtmlSummary") 
```

``` r
library(dplyr)
library(ggplot2)
library(gridExtra)
```

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2016%20intensitydata%20SiteD-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2016%20intensitydata%20Site%20E-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2016%20intensitydata%20Site%20G-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2017%20intensitydata%20SiteD-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2017%20intensitydata%20SiteE-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2017%20intensitydata%20SiteG-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2018%20intensitydata%20SiteD-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2018%20intensitydata%20SiteE-1.png)

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

![](HtmlSummary_files/figure-markdown_github/read%20BeachPlum2018%20intensitydata%20SiteG-1.png)

Data Interpretations
====================

We have two important plots in our project which can help us interpret the data set we have got from LLNF. The first plot is the plot of the intensity value of the breaking bud in Beach Plum species , plotted at different sites D,E,G over the years 2016,2017,2018. The important information that we could intrepret from the plots is that the Beachplum breaks bud first at site G over all the years 2016,2017,2018 indicating that site G needs investigation.

Below is a sample plot of Breaking bud intensity over the days in a year.

``` r
ggplot(SiteD_Beach_2017, aes(SiteD_Beach_2017$Day_of_Year, SiteD_Beach_2017$Intensity_Value
)) +ggtitle("Beach Plum Intensity value throughout year 2017 at Site D")+ geom_line() + geom_point()+xlab("Year 2017") + ylab("Breaking Bud Intensity Value")+xlim(c(100,200))
```

![](HtmlSummary_files/figure-markdown_github/Intensity%20plot-1.png)

The Second plot that we have is the Minimum temperature vs year plot. Which gives us the minimum temperature at different days in a year,which can be compared with the Breaking bud intensity graph based on the days. We can determine if the minimum temperature is affecting the breaking of bud at a particular day in the year based on this graph.

Below is a sample plot of the Minimum temperature over the days in a year.

``` r
ggplot(SiteDTemp2017, aes(SiteDTemp2017$Day, SiteDTemp2017$Min.Temp
))+ggtitle("Minimum Temperature Plot Site D") + geom_line(color="Red") + xlab("Year 2017") + ylab("MinTemp")
```

![](HtmlSummary_files/figure-markdown_github/temperature%20plot-1.png)

References
==========

-   Elise Buisson1,2, Swanni T. Alvarado3,4, Soizig Le Stradic4,5, Leonor Patricia C.Morellato5 <http://www.orsimpact.com/DirectoryAttachments/1132017_44733> \_727\_HFRP-Evaluation-Exchange-Guide-to-Measuring-Advocacy-Policy.pdf

-   <https://e27.co/defining-target-audience-involves-data-analysis-deeper-understanding-intended-market-20170816/> --- (Woods, 2017)

-   Link: <https://www.usanpn.org/about/why-phenology>

-   Garcia LC, Hobbs RJ, Mäes dos Santos FA, Rodrigues RR (2014) Flower and fruit availability along a forest restoration gradient. Biotropica 46: 114-123

-   Miller SA, Bartow A, Gisler M, Ward K, Young AS, Kaye TN (2011) Can an ecoregion serve as a seed transfer zone? Evidence from a common garden study with five native species. Restoration Ecology 19: 268-276

-   <https://www.usanpn.org/natures_notebook>

-   <https://llnf.org/>
