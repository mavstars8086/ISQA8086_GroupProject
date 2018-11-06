setwd("D:/MS/Plotting/Site Data")
SiteA_BreakingBud_2015<-read.csv("Site_A_BreakingBud.csv",stringsAsFactors = FALSE)
str(SiteA_BreakingBud_2015)

#filtering the data of the site based on the year

SiteA_2015<-subset(SiteA_BreakingBud_2015, format(as.Date(SiteA_BreakingBud_2015$Observation_Date),"%Y")==2015)
write.csv(SiteA_2015,file = "SiteAData_2015.csv")

#Since the date is of type format we are converting the date to date format

SiteA2015<-read.csv("SiteAData_2015.csv")
str(SiteA2015)
SiteA2015$Observation_Date<-as.Date(SiteA2015$Observation_Date,format("%m/%d/%Y"))
str(SiteA2015)

#try this gives a straight line.
SiteA2015$Phenophase_Status<-as.factor(SiteA2015$Phenophase_Status)



ggplot(SiteA2015, aes(SiteA2015$Day_of_Year, SiteA2015$Phenophase_Status
)) + geom_line() + xlab("2015 Year") + ylab("PhenophaseStatus")
