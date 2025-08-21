setwd("~/Documents/R")
library(ggplot2)
library(gridExtra)
library(stats)
cbPalette = c("Jaguar" = "grey60", "Lion" = "grey60", "Amur Tiger" = "grey60", "Bengal Tiger" = "grey60","Sumatran Tiger" = "grey60", "Malayan Tiger" = "grey60", "Snow Leopard" = "gold3",  "Asian Leopard" = "grey60", "African Leopard" = "grey60")

loadNorel <- read.csv("ALL_Panthera_SNPeff_High_Mod_SYN.csv", header = T)


####High vs SYN
HS_hom <- ggplot(loadNorel, aes(x=population, y=HIGH_SYN_hom, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Highly deleterious/Synonomous homozygotes")

HS_homa <- HS_hom + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0.002,0.1)+ 
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

HS_het <- ggplot(loadNorel, aes(x=population, y=HIGH_SYN_het, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Highly deleterious/Synonomous heterozygotes")

HS_heta <- HS_het + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(-.001,0.12)+ 
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

loadNorel_d <- data.frame(loadNorel)

SLsubet <- subset.data.frame(loadNorel_d, population == "Snow Leopard")
JagSubset <- subset.data.frame(loadNorel_d, population == "Jaguar")
AfLeopSubset <- subset.data.frame(loadNorel_d, population == "African Leopard")
AsLeopSubset <- subset.data.frame(loadNorel_d, population == "Asian Leopard")
Lionsubset <- subset.data.frame(loadNorel_d, population == "Lion")
AmurSubset <- subset.data.frame(loadNorel_d, population == "Amur Tiger")
BenSubset <- subset.data.frame(loadNorel_d, population == "Bengal Tiger")
SumSubset <- subset.data.frame(loadNorel_d, population == "Sumatran Tiger")
MalSubset <- subset.data.frame(loadNorel_d, population == "Malayan Tiger")

wilcox.test(SLsubet$HIGH_SYN_hom, JagSubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, AfLeopSubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, AsLeopSubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, Lionsubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, AmurSubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, BenSubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, SumSubset$HIGH_SYN_hom)
wilcox.test(SLsubet$HIGH_SYN_hom, MalSubset$HIGH_SYN_hom)

wilcox.test(SLsubet$HIGH_SYN_het, JagSubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, AfLeopSubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, AsLeopSubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, Lionsubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, AmurSubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, BenSubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, SumSubset$HIGH_SYN_het)
wilcox.test(SLsubet$HIGH_SYN_het, MalSubset$HIGH_SYN_het)

####Mod vs SYN
MS_hom <- ggplot(loadNorel_d, aes(x=population, y=MOD_SYN_hom, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Mod deleterious/Synonomous homozygotes")

MS_homa <- MS_hom + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0.35,0.84)+ 
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

MS_het <- ggplot(loadNorel_d, aes(x=population, y=MOD_SYN_het, color = population, fill = population)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Mod deleterious/Synonomous heterozygotes")

MS_heta <- MS_het + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard"))+
  theme_classic()+ 
  ylim(0.23,1.3)+ 
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


wilcox.test(SLsubet$MOD_SYN_hom, JagSubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, AfLeopSubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, AsLeopSubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, Lionsubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, AmurSubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, BenSubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, SumSubset$MOD_SYN_hom)
wilcox.test(SLsubet$MOD_SYN_hom, MalSubset$MOD_SYN_hom)

wilcox.test(SLsubet$MOD_SYN_het, JagSubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, AfLeopSubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, AsLeopSubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, Lionsubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, AmurSubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, BenSubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, SumSubset$MOD_SYN_het)
wilcox.test(SLsubet$MOD_SYN_het, MalSubset$MOD_SYN_het)

grid.arrange(HS_homa, MS_homa, ncol = 2)
grid.arrange(HS_heta, MS_heta, ncol = 2)


