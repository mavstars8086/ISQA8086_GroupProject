
#Author: Kim Duong
#Team: MavStars
#Purpose: Cleaning Temperature Data 
#Format Temperature Data: | Date | Day | Temp | --> Final Look after cleaning using R and Excel 

# Information regarding every site 

# August 2015: 

#Site A: May - August 
#Site B: May - August 
#Site C: June - August 
#Site D: May - August 
#Site E: May - August 
#Site F: May - August 
#Site G: May - August 
#Site H: May - August 


setwd("C:/Wiggins8086/Temperature Data/Temperature Data/2015/August 2015")

august2015_siteA <- read.csv("Site_A.csv", header=TRUE, sep=",")
august2015_siteA$Date <- format(as.POSIXct(strptime(august2015_siteA$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteA$Day <- format(as.POSIXct(strptime(august2015_siteA$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteA, "SiteA_August2015.csv")

august2015_siteB <- read.csv("Site_B.csv", header=TRUE, sep=",")
august2015_siteB$Date <- format(as.POSIXct(strptime(august2015_siteB$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteB$Day <- format(as.POSIXct(strptime(august2015_siteB$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteB, "SiteB_August2015.csv")


august2015_siteC <- read.csv("Site_C.csv", header=TRUE, sep=",")
august2015_siteC$Date <- format(as.POSIXct(strptime(august2015_siteC$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteC$Day <- format(as.POSIXct(strptime(august2015_siteC$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteC, "SiteC_August2015.csv")
  
august2015_siteD <- read.csv("Site_D.csv", header=TRUE, sep=",")
august2015_siteD$Date <- format(as.POSIXct(strptime(august2015_siteD$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteD$Day <- format(as.POSIXct(strptime(august2015_siteD$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteD, "SiteD_August2015.csv")

august2015_siteE <- read.csv("Site_E.csv", header=TRUE, sep=",")
august2015_siteE$Date <- format(as.POSIXct(strptime(august2015_siteE$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteE$Day <- format(as.POSIXct(strptime(august2015_siteE$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteE, "SiteE_August2015.csv")

august2015_siteF <- read.csv("Site_F.csv", header=TRUE, sep=",")
august2015_siteF$Date <- format(as.POSIXct(strptime(august2015_siteF$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteF$Day <- format(as.POSIXct(strptime(august2015_siteF$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteF, "SiteF_August2015.csv")

august2015_siteG <- read.csv("Site_G.csv", header=TRUE, sep=",")
august2015_siteG$Date <- format(as.POSIXct(strptime(august2015_siteG$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteG$Day <- format(as.POSIXct(strptime(august2015_siteG$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteG, "SiteG_August2015.csv")

august2015_siteH <- read.csv("Site_H.csv", header=TRUE, sep=",")
august2015_siteH$Date <- format(as.POSIXct(strptime(august2015_siteH$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
august2015_siteH$Day <- format(as.POSIXct(strptime(august2015_siteH$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(august2015_siteH, "SiteH_August2015.csv")
