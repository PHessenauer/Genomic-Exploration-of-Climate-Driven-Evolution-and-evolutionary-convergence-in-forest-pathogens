library(ggplot2)
library(reshape2)
library(dplyr)
library(cowplot)
library(LEA)

#### Note : need to load GEA.Rdata to run ####
imp_DED=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/DED/r2weighted_importance_DED_nolatlongmem.csv")
imp_DED = imp_DED %>% arrange(importance)
imp_DED$variable=factor(imp_DED$variable, levels=imp_DED$variable)
gf_DED=ggplot(imp_DED, aes(importance, variable))+geom_bar(stat="identity",fill=my_pal[1], width = 0.4)+theme_bw()


imp_DNB=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/DNB/DNB_2022/importance_DNBr2_nolatlong.csv")
imp_DNB = imp_DNB %>% arrange(importance)
imp_DNB$variable=factor(imp_DNB$variable, levels=imp_DNB$variable)
gf_DNB=ggplot(imp_DNB, aes(importance, variable))+geom_bar(stat="identity",fill=my_pal[2], width = 0.4)+theme_bw()


imp_SNC=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/SNC/importance_SNCr2_nolatlong.csv")
imp_SNC = imp_SNC %>% arrange(importance)
imp_SNC$variable=factor(imp_SNC$variable, levels=imp_SNC$variable)
gf_SNC=ggplot(imp_SNC, aes(importance, variable))+geom_bar(stat="identity",fill=my_pal[3], width = 0.4)+theme_bw()
gf_SNC

### Modif RDA ###
plot_RDA_DED=plot_RDA_DED+
  theme(legend.position = c(0.8, 0.8))

plot_RDA_DNB=plot_RDA_DNB+
  theme(legend.position = c(0.2, 0.2))

plot_RDA_SNC=plot_RDA_SNC+
  theme(legend.position = c(0.2, 0.2))
### All together ###

pdf("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/figure2modif2.pdf", height = 13, width = 13)
plot_grid(plot_RDA_DED, plot_LFMM2_DED, gf_DED, 
          plot_RDA_DNB, plot_LFMM2_DNB, gf_DNB,
          plot_RDA_SNC, plot_LFMM2_SNC, gf_SNC,
          rel_heights = c(1, 1), labels = c("A", "B","C","D","E","F", "G","H","I"), align="v", nrow = 3)
dev.off()

png("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/figure2modif2.png", height = 3000, width = 3000, res=300)
plot_grid(plot_RDA_DED, plot_LFMM2_DED, gf_DED, 
          plot_RDA_DNB, plot_LFMM2_DNB, gf_DNB,
          plot_RDA_SNC, plot_LFMM2_SNC, gf_SNC,
          rel_heights = c(1, 1), labels = c("A", "B","C","D","E","F", "G","H","I"), align="v", nrow = 3)
dev.off()

