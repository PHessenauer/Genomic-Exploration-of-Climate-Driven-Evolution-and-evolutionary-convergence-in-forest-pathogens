library(ggplot2)
library(cowplot)

##### barplot #####

picmin=read.csv2("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/picmin/results_summary_picmin_anno.csv")
picmin$q=as.numeric(as.character(picmin$q))
picmin=picmin[order(picmin$trait, picmin$q),]
picmin$anno <- factor(picmin$anno, levels = picmin$anno)

barplot=ggplot(data=picmin,aes(q, anno))+
  geom_col(width = 0.5, color="black", fill="black")+
  xlab("Picmin qvalue")+
  ylab("")+
  theme_bw()+
  geom_hline(yintercept = 10.5, color="green", linewidth=2)+
  theme(axis.text.y=element_blank(), 
        axis.ticks.y=element_blank(), 
        axis.title=element_text(size=14,face="bold"),
        axis.text=element_text(size=12)) 
barplot
##### heatmap #####

pvalue=read.csv("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/picmin/wza_ortho_pval.csv")
pvalue$trait=ifelse(pvalue$trait=="MAP","map",pvalue$trait)
pvalue$key=paste0(pvalue$orthogroup,pvalue$trait)
picmin$key=paste0(picmin$locus,picmin$trait)

pic_value=merge(picmin, pvalue, by.x="key",by.y="key",all.x=T,all.y = F)
pic_value$orthogroup <- factor(pic_value$orthogroup, levels = picmin$locus)
pic_value$anno <- factor(pic_value$anno, levels = unique(picmin$anno))
pic_value$wza=ifelse(pic_value$ortho_adjusted_pval<=0.01,"pvalue < 0.01",
                     ifelse(pic_value$ortho_adjusted_pval<=0.05, "pvalue < 0.05",
                     ifelse(pic_value$ortho_adjusted_pval<=0.1,"pvalue < 0.1", "pvalue > 0.1")))


heatmap=ggplot(data=pic_value, aes(x=species,y=anno, fill=wza))+
  geom_tile(color="white", linewidth=1.5)+
  theme_bw()+ 
  scale_fill_manual(values=c("#7abaf2","#547aa4", "#2d405c", "#030b1c"))+
  xlab("Species")+
  ylab("Orthogroup")+
  labs(fill="WZA pvalue")+
  geom_hline(yintercept = 10.5, color="green", linewidth=2)+
  theme(legend.position="left", axis.title=element_text(size=14,face="bold"),axis.text=element_text(size=12))
heatmap
##### total #####

pdf("C:/Users/Yunalesca/Documents/BioSAFE/CLIM/figure_wza.pdf", height = 5, width = 10)
plot_grid(heatmap,barplot,
          rel_widths = c(1.6, 1), rel_heights = c(1,1.2), labels = c("B"), align="h", nrow = 1)
dev.off()

