setwd("~/Documents/R")
library(ggpubr)
library(tidyverse)
library(gridExtra)


cbPalette = c("captive" = "black","India" = "#E51932","Pakistan" = "#FF99BF","Afghanistan" = "#654CFF", "Tajikistan"="#CCBFFF",
              "Kyrgyzstan" = "#19B2FF", "Russia" = "#A5EDFF", "Mongolia (unknown)" = "#32FF00", "Mongolia (NW)" = "#B2FF8C",
              "Mongolia (SW)" = "#FF7F00", "Mongolia (South)" = "#FFBF7F")


#####linear comparison of the two values sets
het <- read.csv('SL_HET_gencove_vs_ownCalls.csv',head=T)
het <- data.frame(het)
library(ggpubr)
library(ggplot2)

p2<-ggplot(het_practice, aes(x=Obs_Het_ours_finalDenom, y=Obs_Het_gencove_finalDenominator)) + 
  geom_point() +
  geom_smooth(method=lm)+stat_cor(method="pearson") + 
  scale_color_manual(name = "Location", values = cbPalette) +
  labs(y="Observed Heterozygosity gencove") +
  labs(x="Observed Heterozygosity ours") + 
  theme_classic()+
  theme(axis.text.x = element_text( size = 10), 
        axis.text.y = element_text(size = 10), 
        axis.title.y = element_text(size = 13),
        axis.title.x = element_text(size = 13),
        strip.text = element_text(size = 13),
        panel.grid.major.y = element_line(color = "grey90"),
        panel.grid.major.x = element_line(color = "grey90"),       
        plot.margin = margin(.5, .5, .5, .5, "cm")) 
p2

###plot for main figure 2 of ms
cbPalette = c("Jaguar" = "grey60", "Lion" = "grey60", "Amur Tiger" = "grey60", "Bengal Tiger" = "grey60","Sumatran Tiger" = "grey60", "Malayan Tiger" = "grey60", "Puma" = "grey30", 
              "Cheetah" = "grey30", "Snow Leopard" = "gold3",  "Asian Leopard" = "grey60", "African Leopard" = "grey50")


het <- read.csv("Panthera_Observed_het_vcftools_JagEdited_SL28Recalc.csv", header = T)
p <- ggplot(het, aes(x=Species, y=Observed_Heterozygosity_SL_lowDP_removed, color = Species, fill = Species)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Observed Heterozygosity") 

p + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard", "Cheetah", "Puma" ))+
  theme_classic()+ 
  ylim(0,0.0023)+ 
  scale_fill_manual(name = "Species", values = cbPalette) +
  scale_color_manual(name = "Species", values = cbPalette) +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5, cex=1.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1,size = 11), 
        axis.text.y = element_text(size = 11), 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        legend.position = "none",
        panel.grid.major.y = element_line(color = "grey90"),
        plot.margin = margin(.5, 1, .5, .5, "cm"))


het_df <- data.frame(het)

SLsubet <- subset.data.frame(het_df, Species == "Snow Leopard")
JagSubset <- subset.data.frame(het_df, Species == "Jaguar")
AfLeopSubset <- subset.data.frame(het_df, Species == "African Leopard")
AsLeopSubset <- subset.data.frame(het_df, Species == "Asian Leopard")
Lionsubset <- subset.data.frame(het_df, Species == "Lion")
AmurSubset <- subset.data.frame(het_df, Species == "Amur Tiger")
BenSubset <- subset.data.frame(het_df, Species == "Bengal Tiger")
SumSubset <- subset.data.frame(het_df, Species == "Sumatran Tiger")
MalSubset <- subset.data.frame(het_df, Species == "Malayan Tiger")
pumaSubset <- subset.data.frame(het_df, Species == "Puma")
CheSubset <- subset.data.frame(het_df, Species == "Cheetah")

wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, JagSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, AfLeopSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, AsLeopSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, Lionsubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, AmurSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, BenSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, SumSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, MalSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, pumaSubset$Observed_Heterozygosity_SL_lowDP_removed)
wilcox.test(SLsubet$Observed_Heterozygosity_SL_lowDP_removed, CheSubset$Observed_Heterozygosity_SL_lowDP_removed)


