setwd("~/Documents/R")
library(ggpubr)
library(tidyverse)
library(gridExtra)


cbPalette = c("captive" = "black","India" = "#E51932","Pakistan" = "#FF99BF","Afghanistan" = "#654CFF", "Tajikistan"="#CCBFFF",
              "Kyrgyzstan" = "#19B2FF", "Russia" = "#A5EDFF", "Mongolia (unknown)" = "#32FF00", "Mongolia (NW)" = "#B2FF8C",
              "Mongolia (SW)" = "#FF7F00", "Mongolia (South)" = "#FFBF7F")

####Final het - no 10x
het_practice <- read.csv('SL_HET_gencove_vs_ownCalls.csv',head=T)

het_practice <- data.frame(het_practice)

het_practice <- het_practice %>%
  mutate( Location=factor(Location,levels=c("captive", "India", "Pakistan", "Afghanistan", "Tajikistan", "Kyrgyzstan", "Russia", "Mongolia (unknown)", "Mongolia (NW)", "Mongolia (SW)", "Mongolia (South)")) )

p1<-ggplot(het_practice, aes(x=Location, y=Obs_Het_gencove_finalDenominator, color=Location)) + 
  geom_boxplot() +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5) +
  scale_color_manual(name = "Location", values = cbPalette) +
  labs(y="Observed Heterozygosity gencove") +
  theme_classic()+
  ylim(0,0.00025)+ 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 13), 
        axis.text.y = element_text(size = 10, hjust = 1, vjust = 1), 
        axis.title.x = element_blank(),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        panel.grid.major.y = element_line(color = "grey90"),
        legend.position="none",
        plot.margin = margin(.5, .5, .5, .5, "cm")) 
p1

p2<-ggplot(het_practice, aes(x=Location, y=Obs_Het_ours_finalDenom, color=Location)) + 
  geom_boxplot() +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5) +
  scale_color_manual(name = "Location", values = cbPalette) +
  labs(y="Observed Heterozygosity ours") +
  theme_classic()+
  ylim(0,0.00025)+ 
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 13), 
        axis.text.y = element_text(size = 10, hjust = 1, vjust = 1), 
        axis.title.x = element_blank(),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        panel.grid.major.y = element_line(color = "grey90"),
        legend.position="none",
        plot.margin = margin(.5, .5, .5, .5, "cm")) 
p2



figuregarlic_v1 <- (p1 | p2 )
figuregarlic_v1


#####linear comparison of the two values sets
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
p2<-ggplot(het_practice, aes(x=Location, y=Obs_Het_gencove_finalDenominator, color=Location)) + 
  geom_boxplot() +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5) +
  scale_color_manual(name = "Location", values = cbPalette) +
  labs(y="Observed Heterozygosity") +
  theme_classic()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, size = 13), 
        axis.text.y = element_text(size = 10, hjust = 1, vjust = 1), 
        axis.title.x = element_blank(),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        panel.grid.major.y = element_line(color = "grey90"),
        legend.position="none",
        plot.margin = margin(.5, .5, .5, .5, "cm")) 
p2


