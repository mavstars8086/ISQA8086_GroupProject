#Author: Kim Duong
#Team: MavStars
#Purpose: Cleaning Temperature Data 
#Format Temperature Data: | Date | Day | Temp | --> Final Look after cleaning using R and Excel 

# Information regarding every site 

#December 2015: 

#Site A: August - November   
#Site B: August - December 
#Site C: March - June 
#Site D: March - May 
#Site E: March - May 
#Site F: March - May 
#Site G: March - May 
#Site H: March - May 

setwd("C:/Wiggins8086/Temperature Data/Temperature Data/2015/December 2015")

dec2015_siteA <- read.csv("Site_A.csv", header=TRUE, sep=",")
dec2015_siteA$Date <- format(as.POSIXct(strptime(dec2015_siteA$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteA$Day <- format(as.POSIXct(strptime(dec2015_siteA$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteA, "SiteA_Dec2015.csv")

dec2015_siteB <- read.csv("Site_B.csv", header=TRUE, sep=",")
dec2015_siteB$Date <- format(as.POSIXct(strptime(dec2015_siteB$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteB$Day <- format(as.POSIXct(strptime(dec2015_siteB$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteB, "SiteB_Dec2015.csv")

dec2015_siteC <- read.csv("Site_C.csv", header=TRUE, sep=",")
dec2015_siteC$Date <- format(as.POSIXct(strptime(dec2015_siteC$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteC$Day <- format(as.POSIXct(strptime(dec2015_siteC$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteC, "SiteC_Dec2015.csv")

dec2015_siteD <- read.csv("Site_D.csv", header=TRUE, sep=",")
dec2015_siteD$Date <- format(as.POSIXct(strptime(dec2015_siteD$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteD$Day <- format(as.POSIXct(strptime(dec2015_siteD$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteD, "SiteD_Dec2015.csv")

dec2015_siteE <- read.csv("Site_E.csv", header=TRUE, sep=",")
dec2015_siteE$Date <- format(as.POSIXct(strptime(dec2015_siteE$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteE$Day <- format(as.POSIXct(strptime(dec2015_siteE$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteE, "SiteE_Dec2015.csv")

dec2015_siteF <- read.csv("Site_F.csv", header=TRUE, sep=",")
dec2015_siteF$Date <- format(as.POSIXct(strptime(dec2015_siteF$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteF$Day <- format(as.POSIXct(strptime(dec2015_siteF$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteF, "SiteF_Dec2015.csv")

dec2015_siteG <- read.csv("Site_G.csv", header=TRUE, sep=",")
dec2015_siteG$Date <- format(as.POSIXct(strptime(dec2015_siteG$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteG$Day <- format(as.POSIXct(strptime(dec2015_siteG$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteG, "SiteA_Dec2015.csv")

dec2015_siteH <- read.csv("Site_H.csv", header=TRUE, sep=",")
dec2015_siteH$Date <- format(as.POSIXct(strptime(dec2015_siteH$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
dec2015_siteH$Day <- format(as.POSIXct(strptime(dec2015_siteH$Date,"%m/%d/%Y",tz="")) ,format = "%j")
write.csv(dec2015_siteH, "SiteH_Dec2015.csv")