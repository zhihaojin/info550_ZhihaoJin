library(ggplot2)

here::i_am("Rcode/make_figure.R")


# load cleaned data
load(here::here("Output/cleandata.RData"))

# create figure showing AOD distribution in the north-east US on day 2018-01-01
p<-ggplot(data=daily_data.dcast,aes(x=lon,y=lat,color=mean))+
  geom_point()
plot(p)

# save as tiff file
png(filename = here::here("Output/figure/aod_figure.png"),
     width =1200,height = 1000,units="px",res = 200)
plot(p)
dev.off()

png()