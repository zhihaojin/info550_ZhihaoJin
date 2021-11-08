library(reshape2)
library(lubridate)

here::i_am("Rcode/cleandata.R")
###load_combine_data
filepath<-here::here("data/GOES_data/")
file_list<-dir(filepath,pattern = ".csv")
daily_data<-NULL
for(filei in file_list){
  GOES_nyc<-read.csv(paste0(filepath,"/",filei))
  GOES_nyc<-na.omit(GOES_nyc)
  daily_data<-rbind(daily_data,GOES_nyc)
  
}
str(daily_data)

###calculate hourly AOD
#calculate the hourly AOD based on the 5-minute AOD data for each point.
daily_data<-as.data.frame(daily_data)
daily_data.dcast<-dcast(daily_data,lon+lat~hour,mean,value.var = "AOD",na.rm=T)

#turn NAN into NA
for(coli in 1:ncol(daily_data.dcast)){
  daily_data.dcast[is.nan(daily_data.dcast[,coli]),coli]<-NA
  daily_data.dcast[,coli]<-as.numeric(daily_data.dcast[,coli])
}

#change column name into form day_h_hour
names(daily_data.dcast)[3:ncol(daily_data.dcast)]<-paste0("day001_h_",names(daily_data.dcast)[3:ncol(daily_data.dcast)])

#calculate daily mean AOD based on hourly AOD
daily_data.dcast$mean<-rowMeans(daily_data.dcast[,3:ncol(daily_data.dcast)],na.rm=TRUE)

#save results
save(daily_data.dcast,file=here::here("Output/cleandata.RData"))
