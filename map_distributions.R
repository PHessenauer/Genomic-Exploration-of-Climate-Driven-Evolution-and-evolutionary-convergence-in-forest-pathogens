library(ggplot2)
library(reshape2)
library(plyr)
library(cowplot)

#### Note : need GEA analyses output to run ####


############################## MAP ##############################

ded_fut = read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/DED/CNRMESM21_clim_data_DED.csv")
ded_MAP =ded_fut[,c("MAP","MAP_proj")]
ded_MAP=melt(ded_MAP)
str(ded_MAP)
ded_MAP$value=as.numeric(as.character(ded_MAP$value))

mu <- ddply(ded_MAP, "variable", summarise, grp.mean=mean(value))
head(mu)

ded_map_plot=ggplot(ded_MAP, aes(x=value, fill=variable)) +
  geom_density(alpha=0.4) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=variable),linetype="dashed")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  theme(legend.position = c(0.2, 0.8), panel.background = element_rect(fill="white"), panel.grid.major = element_line(color="lightgray"))+
  xlab("Mean annual precipitation in mm (MAP)")+ ylab("Density")

dnb_fut=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/DNB/DNB_2022/CNRMESM21_clim_data_DNB.csv")
dnb_MAP =dnb_fut[,c("MAP","MAP_proj")]
dnb_MAP=melt(dnb_MAP)
str(dnb_MAP)
dnb_MAP$value=as.numeric(as.character(dnb_MAP$value))

mu <- ddply(dnb_MAP, "variable", summarise, grp.mean=mean(value))
head(mu)

dnb_map_plot=ggplot(dnb_MAP, aes(x=value, fill=variable)) +
  geom_density(alpha=0.4) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=variable),linetype="dashed")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  theme(legend.position = c(0.8, 0.8), panel.background = element_rect(fill="white"), panel.grid.major = element_line(color="lightgray"))+
  xlab("Mean annual precipitation in mm (MAP)")+ ylab("Density")


snc_fut=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/SNC/CNRMESM21_clim_data_SNC.csv", head=T)
snc_MAP =snc_fut[,c("MAP","MAP_proj")]
snc_MAP=melt(snc_MAP)
str(snc_MAP)
snc_MAP$value=as.numeric(as.character(snc_MAP$value))

mu <- ddply(snc_MAP, "variable", summarise, grp.mean=mean(value))
head(mu)

snc_map_plot=ggplot(snc_MAP, aes(x=value, fill=variable)) +
  geom_density(alpha=0.4) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=variable),linetype="dashed")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  theme(legend.position = c(0.2, 0.8), panel.background = element_rect(fill="white"), panel.grid.major = element_line(color="lightgray"))+
  xlab("Mean annual precipitation in mm (MAP)")+ ylab("Density")



############################## Eref ##############################
ded_Eref =ded_fut[,c("Eref","Eref_proj")]
ded_Eref=melt(ded_Eref)
str(ded_Eref)
ded_Eref$value=as.numeric(as.character(ded_Eref$value))

mu <- ddply(ded_Eref, "variable", summarise, grp.mean=mean(value))
head(mu)

ded_eref_plot=ggplot(ded_Eref, aes(x=value, fill=variable)) +
  geom_density(alpha=0.4) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=variable),linetype="dashed")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  theme(legend.position = c(0.8, 0.8), panel.background = element_rect(fill="white"), panel.grid.major = element_line(color="lightgray"))+
  xlab("Hargreaves reference evaporation (Eref)")  + ylab("Density")

dnb_Eref =dnb_fut[,c("Eref","Eref_proj")]
dnb_Eref=melt(dnb_Eref)
str(dnb_Eref)
dnb_Eref$value=as.numeric(as.character(dnb_Eref$value))

mu <- ddply(dnb_Eref, "variable", summarise, grp.mean=mean(value))
head(mu)

dnb_eref_plot=ggplot(dnb_Eref, aes(x=value, fill=variable)) +
  geom_density(alpha=0.4) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=variable),linetype="dashed")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  theme(legend.position = c(0.8, 0.8), panel.background = element_rect(fill="white"), panel.grid.major = element_line(color="lightgray"))+
  xlab("Hargreaves reference evaporation (Eref)")+ ylab("Density")

snc_Eref =snc_fut[,c("Eref","Eref_proj")]
snc_Eref=melt(snc_Eref)
str(snc_Eref)
snc_Eref$value=as.numeric(as.character(snc_Eref$value))

mu <- ddply(snc_Eref, "variable", summarise, grp.mean=mean(value))
head(mu)

snc_eref_plot=ggplot(snc_Eref, aes(x=value, fill=variable)) +
  geom_density(alpha=0.4) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=variable),linetype="dashed")+
  scale_fill_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  scale_color_manual(values=c("#999999", "#E69F00", "#56B4E9"),name = "Climate projection", labels=c("Present","Predicted"))+
  theme(legend.position = c(0.8, 0.8), panel.background = element_rect(fill="white"), panel.grid.major = element_line(color="lightgray"))+
  xlab("Hargreaves reference evaporation (Eref)")+ ylab("Density")

########################### Offset ######################################

offset_DED=ggplot() + 
  geom_polygon(data = world, aes(x = long, y = lat, group = group), fill = "white", color = "darkgrey") + 
  coord_fixed(1.3) + 
  geom_point(data = tot_offset_DED, 
             mapping = aes(x = Longitude, y = Latitude, color = offset), 
             size = 3, shape = 16, alpha = 0.5) + 
  scale_color_gradientn(colors = c("red", "yellow", "green"), name = "Offset") +
  coord_fixed(xlim = c(-125, -60), ylim = c(35, 70), ratio = 1.3) +
  theme(legend.position = "top",
        plot.title = element_text(size = 10, face = "bold")) +
  ylab("Latitude") + 
  xlab("Longitude")+
  ggtitle("Geographic Distribution of Offset Values for DED")

offset_DNB=ggplot() + 
  geom_polygon(data = world, aes(x = long, y = lat, group = group), fill = "white", color = "darkgrey") + 
  coord_fixed(1.3) + 
  geom_point(data = tot_offset_DNB, 
             mapping = aes(x = Longitude, y = Latitude, color = offset), 
             size = 3, shape = 16, alpha = 0.5) + 
  scale_color_gradientn(colors = c("red", "yellow", "green"), name = "Offset") +
  coord_fixed(xlim=c(-140,-80), ylim=c(35,70), ratio = 1.3) +
  theme(legend.position = "top",
        plot.title = element_text(size = 10, face = "bold")) +
  ylab("Latitude") + 
  xlab("Longitude") +
  ggtitle("Geographic Distribution of Offset Values for DNB")

offset_SNC=ggplot() + 
  geom_polygon(data = world, aes(x = long, y = lat, group = group), fill = "white", color = "darkgrey") + 
  coord_fixed(1.3) + 
  geom_point(data = tot_offset_SNC, 
             mapping = aes(x = Longitude, y = Latitude, color = offset), 
             size = 3, shape = 16, alpha = 0.5) + 
  scale_color_gradientn(colors = c("red", "yellow", "green"), name = "Offset") +
  coord_fixed(xlim=c(-140,-80), ylim=c(35,70), ratio = 1.3) +
  theme(legend.position = "top",
        plot.title = element_text(size = 10, face = "bold")) +
  ylab("Latitude") + 
  xlab("Longitude")+
  ggtitle("Geographic Distribution of Offset Values for SNC")

pdf("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/triple_meanannualprecipitation.pdf", height = 13, width = 13)
plot_grid(offset_DED, ded_map_plot, ded_eref_plot, offset_DNB, dnb_map_plot, dnb_eref_plot,offset_SNC, snc_map_plot,   snc_eref_plot, rel_heights = c(1, 1), labels = c("A", "","","B","","", "C","",""), align="v", nrow = 3)
dev.off()
