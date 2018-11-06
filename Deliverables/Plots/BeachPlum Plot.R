#Author Karthik
#Date 3-nov-2018

#R code to determing if the temperature is affecting the pheonphase status for a particular species.




#Get the filtered data of the species beachplum from the species data.
#Now filter the species data based on the year

#Site D Year 2016
SiteD_BP_2016<-subset(SiteD_BeachPlum_2016, format(as.Date(SiteD_BeachPlum_2016$Observation_Date),"%Y")==2016)
write.csv(SiteD_BP_2016,file = "SiteD_BeachPlum_2016.csv")

#Create the data file for beachplum for the year 2016


#Start from here for plots 


#Read the data of beach plum for the year 2016
SiteD_Beach_2016<-read.csv("SiteD_BeachPlum_2016.csv")

#Converting the date from char to date

SiteD_Beach_2016$Observation_Date<-as.Date(SiteD_Beach_2016$Observation_Date,format("%m/%d/%Y"))
str(SiteD_Beach_2016)



#Plots for 2016


#Plot for phenophase status
ggplot(SiteD_Beach_2016, aes(SiteD_Beach_2016$Day_of_Year, SiteD_Beach_2016$Phenophase_Status
)) + geom_line() + xlab("2016 Year") + ylab("PhenophaseStatus")

#plot for the intensity value after replacing the factor values in the dataset with the cardinal values from 1to6

fig1<-ggplot(SiteD_Beach_2016, aes(SiteD_Beach_2016$Day_of_Year, SiteD_Beach_2016$Intensity_Value
)) +ggtitle("Intensity value graph BeachPlum Year 2016")+ geom_line() + xlab("Year 2016") + ylab("Intensity Value")


#Plots for temperature 2016

#read the data of the temperature for the year 2016 after cleaning the data and getting the min and average of the temperature

setwd("D:/MS/Plotting/BeachPlumSiteData")
SiteDTemp2016<-read.csv("Min.Max_SiteDJune2016.csv")

SiteDTemp2016$Date<-as.Date(SiteDTemp2016$Date,format("%m/%d/%Y"))
str(SiteDTemp2016)
library(ggplot2)

#using the dates for plotting
ggplot(SiteDTemp2016, aes(SiteDTemp2016$Date, SiteDTemp2016$Min.Temp
))+ggtitle("temperature Plot Site D BeachPlum") + geom_line() + xlab("2016 Year") + ylab("MinTemp")

#using the day for plotting
#Store the plot in the variable so that u can compare the two plots
fig2<-ggplot(SiteDTemp2016, aes(SiteDTemp2016$Day, SiteDTemp2016$Min.Temp
))+ggtitle("Temperature Plot Site D BeachPlum") + geom_line() + xlab("2016 Year") + ylab("MinTemp")





library(ggplot2)

#for merging two plots
library(cowplot)

ggdraw(fig1) + draw_plot(fig2)

#for getting two plots in the same window 

library(gridExtra)
grid.arrange(fig1,fig2,nrow=2)



#continue for the sites E G for year 2016


