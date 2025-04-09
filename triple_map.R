library(ggplot2)
library(devtools)
library(dplyr)
library(stringr)
library(maps)
library(mapdata)

# Prepare data
DED=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/DED/clim_data_NA_filtered_ordered_province_ONU_PCs.csv")
DED$Pathogen=rep("DED", 145)
DED=as.data.frame(cbind(DED$Latitude, DED$Longitude, DED$Pathogen))
names(DED)=c("Latitude", "Longitude", "Pathogen")
DED$Latitude=as.numeric(as.character(DED$Latitude))
DED$Longitude=as.numeric(as.character(DED$Longitude))
str(DED)

SNC=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/SNC/MetaData_SNC_province_NA.csv")
SNC=as.data.frame(cbind(SNC$Latitude, SNC$Longitude))
names(SNC)=c("Latitude","Longitude")
SNC$Pathogen=rep("SNC", 218)
SNC$Latitude=as.numeric(as.character(SNC$Latitude))
SNC$Longitude=as.numeric(as.character(SNC$Longitude))
str(SNC)

DNB=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/DNB/DNB_2022/clim_data_DNB_NA_filtered_ordered.csv")
DNB=as.data.frame(cbind(DNB$Latitude, DNB$Longitude))
names(DNB)=c("Latitude","Longitude")
DNB$Pathogen=rep("DNB", 233)
DNB$Latitude=as.numeric(as.character(DNB$Latitude))
DNB$Longitude=as.numeric(as.character(DNB$Longitude))
str(DNB)

dat=as.data.frame(rbind(DED,SNC[-c(127,128,129),],DNB))


# Plot the map
world=map_data("world")
my_pal <- RColorBrewer::brewer.pal(n=8, name = "Dark2")


pdf(file = "C:/Users/Yunalesca/Documents/BioSAFE/CLIM/triple_map.pdf",   # The directory you want to save the file in
    width = 10, # The width of the plot in inches
    height = 7) # The height of the plot in inches

# Step 2: Create the plot with R code
ggplot() + 
  geom_polygon(data = world, aes(x=long, y = lat, group = group), fill = "white", color = "darkgrey") + 
  coord_fixed(1.3) + 
  geom_point(data=dat, mapping=aes(x=Longitude, y=Latitude, color=Pathogen), size=5, alpha=0.4) + 
  coord_fixed(xlim=c(-135,-65), ylim=c(30,65), ratio=1.3)+
  theme_bw()+
  scale_color_manual(values=c(my_pal))+
  xlab("Longitude")+
  ylab("Latitude")+
  theme(axis.text.x=element_text(size=15),axis.text.y = element_text(size=15),
        axis.title = element_text(size=20),
        legend.text = element_text(size=15),
        legend.title = element_text(size=20))

# Step 3: Run dev.off() to create the file!
dev.off()


triple_map=ggplot() + 
  geom_polygon(data = world, aes(x=long, y = lat, group = group), fill = "white", color = "darkgrey") + 
  coord_fixed(1.3) + 
  geom_point(data=dat, mapping=aes(x=Longitude, y=Latitude, color=Pathogen), size=5, alpha=0.4) + 
  coord_fixed(xlim=c(-135,-65), ylim=c(30,65), ratio=1.3)+
  theme_bw()+
  scale_color_manual(values=c(my_pal))+
  xlab("Longitude")+
  ylab("Latitude")+
  theme(axis.text.x=element_text(size=15),axis.text.y = element_text(size=15),
        axis.title = element_text(size=20),
        legend.text = element_text(size=15),
        legend.title = element_text(size=20))





