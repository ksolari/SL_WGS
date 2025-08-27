setwd("~/Documents/R")
library(ggplot2)

library(gridExtra)

cbPalette = c("Jaguar" = "grey60", "Lion" = "grey60", "Amur Tiger" = "grey60", "Bengal Tiger" = "grey60","Sumatran Tiger" = "grey60", "Malayan Tiger" = "grey60", "Snow Leopard" = "gold3",  "Asian Leopard" = "grey60", "African Leopard" = "grey60")

LoadFinal <- read.csv("Panthera_Load_Final_cleaned.csv", header = T)


####High

High_tot_hom <- ggplot(LoadFinal, aes(x=population, y=High_tot_hom, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Highly deleterious/total coding homozygotes")

High_tot_homa <- High_tot_hom + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0,0.032)+ 
  scale_fill_manual(name = "population", values = cbPalette) +
  scale_color_manual(name = "population", values = cbPalette) +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5, cex=1.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1,size = 11), 
        axis.text.y = element_text(size = 11), 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        legend.position = "none",
        panel.grid.major.y = element_line(color = "grey90"),
        plot.margin = margin(.5, 1, .5, .5, "cm"))

High_tot_het <- ggplot(LoadFinal, aes(x=population, y=High_tot_het, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Highly deleterious/total coding heterozygotes")

High_tot_heta <- High_tot_het + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0,0.032)+ 
  scale_fill_manual(name = "population", values = cbPalette) +
  scale_color_manual(name = "population", values = cbPalette) +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5, cex=1.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1,size = 11), 
        axis.text.y = element_text(size = 11), 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        legend.position = "none",
        panel.grid.major.y = element_line(color = "grey90"),
        plot.margin = margin(.5, 1, .5, .5, "cm"))

LoadFinal_d <- data.frame(LoadFinal)

SLsubet <- subset.data.frame(LoadFinal_d, population == "Snow Leopard")
JagSubset <- subset.data.frame(LoadFinal_d, population == "Jaguar")
AfLeopSubset <- subset.data.frame(LoadFinal_d, population == "African Leopard")
AsLeopSubset <- subset.data.frame(LoadFinal_d, population == "Asian Leopard")
Lionsubset <- subset.data.frame(LoadFinal_d, population == "Lion")
AmurSubset <- subset.data.frame(LoadFinal_d, population == "Amur Tiger")
BenSubset <- subset.data.frame(LoadFinal_d, population == "Bengal Tiger")
SumSubset <- subset.data.frame(LoadFinal_d, population == "Sumatran Tiger")
MalSubset <- subset.data.frame(LoadFinal_d, population == "Malayan Tiger")

wilcox.test(SLsubet$High_tot_hom, JagSubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, AfLeopSubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, AsLeopSubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, Lionsubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, AmurSubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, BenSubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, SumSubset$High_tot_hom)
wilcox.test(SLsubet$High_tot_hom, MalSubset$High_tot_hom)


wilcox.test(SLsubet$High_tot_het, JagSubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, AfLeopSubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, AsLeopSubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, Lionsubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, AmurSubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, BenSubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, SumSubset$High_tot_het)
wilcox.test(SLsubet$High_tot_het, MalSubset$High_tot_het)

grid.arrange(High_tot_homa, High_tot_heta, ncol = 2)

####Moderate

Mod_tot_hom <- ggplot(LoadFinal, aes(x=population, y=Mod_tot_hom, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Mod deleterious/total coding homozygotes")

Mod_tot_homa <- Mod_tot_hom + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0.26,0.46)+ 
  scale_fill_manual(name = "population", values = cbPalette) +
  scale_color_manual(name = "population", values = cbPalette) +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5, cex=1.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1,size = 11), 
        axis.text.y = element_text(size = 11), 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        legend.position = "none",
        panel.grid.major.y = element_line(color = "grey90"),
        plot.margin = margin(.5, 1, .5, .5, "cm"))

Mod_tot_het <- ggplot(LoadFinal, aes(x=population, y=Mod_tot_het, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Mod deleterious/total coding heterozygotes")

Mod_tot_heta <- Mod_tot_het + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0.2,.55)+ 
  scale_fill_manual(name = "population", values = cbPalette) +
  scale_color_manual(name = "population", values = cbPalette) +
  geom_jitter(height = 0, width = 0.1, alpha = 0.5, cex=1.5) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1,size = 11), 
        axis.text.y = element_text(size = 11), 
        axis.title.x = element_text(size = 13),
        axis.title.y = element_text(size = 13),
        strip.text = element_text(size = 13),
        legend.position = "none",
        panel.grid.major.y = element_line(color = "grey90"),
        plot.margin = margin(.5, 1, .5, .5, "cm"))


wilcox.test(SLsubet$Mod_tot_hom, JagSubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, AfLeopSubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, AsLeopSubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, Lionsubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, AmurSubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, BenSubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, SumSubset$Mod_tot_hom)
wilcox.test(SLsubet$Mod_tot_hom, MalSubset$Mod_tot_hom)

wilcox.test(SLsubet$Mod_tot_het, JagSubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, AfLeopSubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, AsLeopSubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, Lionsubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, AmurSubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, BenSubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, SumSubset$Mod_tot_het)
wilcox.test(SLsubet$Mod_tot_het, MalSubset$Mod_tot_het)


grid.arrange(Mod_tot_homa, Mod_tot_heta, ncol = 2)
