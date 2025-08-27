cbPalette = c("Jaguar" = "grey60", "Lion" = "grey60", "Amur Tiger" = "grey60", "Bengal Tiger" = "grey60","Sumatran Tiger" = "grey60", "Malayan Tiger" = "grey60", "Puma" = "grey30", 
              "Cheetah" = "grey30", "Snow Leopard" = "gold3",  "Asian Leopard" = "grey60", "African Leopard" = "grey50")


het <- read.csv("Panthera_Observed_het_vcftools_JagEdited_SL28Recalc.csv", header = T)
p <- ggplot(het, aes(x=Species, y=F_highcovOnly, color = Species, fill = Species)) + 
  geom_boxplot(alpha=0.5) +
  theme(legend.position="none") +
  xlab("Species") + ylab("Inbreeding Coefficient F") 

p + scale_y_continuous() + 
  scale_x_discrete(limits=c("African Leopard", "Asian Leopard", "Jaguar", "Lion", "Amur Tiger", "Bengal Tiger","Sumatran Tiger", "Malayan Tiger", "Snow Leopard", "Cheetah", "Puma" ))+
  theme_classic()+ 
  ylim(-0.3,0.75)+ 
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

wilcox.test(SLsubet$F_highcovOnly, JagSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, AfLeopSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, AsLeopSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, Lionsubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, AmurSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, BenSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, SumSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, MalSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, pumaSubset$F_highcovOnly)
wilcox.test(SLsubet$F_highcovOnly, CheSubset$F_highcovOnly)
