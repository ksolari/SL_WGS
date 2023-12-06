library(ggpubr)
library(tidyverse)
library(gridExtra)
setwd("~/Documents/R")

cbPalette = c("Mongolia (South)" = "#FFBF7F","Mongolia (SW)" = "#FF7F00","Mongolia (NW)" = "#B2FF8C","Mongolia (unknown)" = "#32FF00", 
              "Russia" = "#A5EDFF", "captive" = "black",  "Kyrgyzstan" = "#19B2FF", "Tadjikistan"="#CCBFFF",  
              "Afghanistan" = "#654CFF","Pakistan" = "#FF99BF", "India" = "#E51932"  )

######PCA with all first and second degree relatives removed 

eigenvec_all <- read.table('CombinedAnnotations_wHeaderD_filtered_pass_1nonref_90maxmis_IndRename_no10xU01U08AF06KGf4_1nonref_pca.eigenvec',head=F)
eigenval_all <- read.table('CombinedAnnotations_wHeaderD_filtered_pass_1nonref_90maxmis_IndRename_no10xU01U08AF06KGf4_1nonref_pca.eigenval',head=F)
ids <- read.csv('SampleInfo_SL_no02_12_20_10x_U01U08AF06KGf4_multMong.csv', head = T, sep = ',')

eigenval_all$V2 <- eigenval_all$V1/(sum(eigenval_all$V1))*100
eigenval_all$V2

eigenvec_table_rename <- eigenvec_all %>% 
  rename(Individual=V2)

eigenvec_with_sub <- merge(eigenvec_table_rename, ids,by="Individual")

PC1 <-ggplot(eigenvec_with_sub, aes(x=V3, y=V4, color=Location)) +
  scale_color_manual(name="Location", values=cbPalette) +
  geom_point(size=3, alpha = 3/4) +
  xlab("PC1 (7.69%)") + ylab("PC2 (6.53%)") +
  theme(legend.position = "right", legend.title = element_blank()) +
  theme_bw()
PC1

###same as above with India removed
eigenvec_all <- read.table('CombinedAnnotations_wHeaderD_filtered_pass_1nonref_90maxmis_IndRename_no10xU01U08AF06KGf4_India_1nonref_pca.eigenvec',head=F)
eigenval_all <- read.table('CombinedAnnotations_wHeaderD_filtered_pass_1nonref_90maxmis_IndRename_no10xU01U08AF06KGf4_India_1nonref_pca.eigenval',head=F)
ids <- read.csv('SampleInfo_SL_no02_12_20_10x_U01U08AF06KGf4_India_multMong.csv', head = T, sep = ',')

eigenval_all$V2 <- eigenval_all$V1/(sum(eigenval_all$V1))*100
eigenval_all$V2

eigenvec_table_rename <- eigenvec_all %>% 
  rename(Individual=V2)

eigenvec_with_sub <- merge(eigenvec_table_rename, ids,by="Individual")

PC1b <-ggplot(eigenvec_with_sub, aes(x=V3, y=V4, color=Location)) +
  scale_color_manual(name="Location", values=cbPalette) +
  geom_point(size=3, alpha = 3/4) +
  xlab("PC1 (7.69%)") + ylab("PC2 (5.78%)") +
  theme(legend.position = "right", legend.title = element_blank()) +
  theme_bw()
PC1b
###same as above with U13 removed
eigenvec_all <- read.table('CombinedAnnotations_wHeaderD_filtered_pass_1nonref_90maxmis_IndRename_no10xU01U08AF06KGf4_IndiaU13_1nonref_pca.eigenvec',head=F)
eigenval_all <- read.table('CombinedAnnotations_wHeaderD_filtered_pass_1nonref_90maxmis_IndRename_no10xU01U08AF06KGf4_IndiaU13_1nonref_pca.eigenval',head=F)
ids <- read.csv('SampleInfo_SL_no02_12_20_10x_U01U08AF06KGf4_IndiaU13_multMong.csv', head = T, sep = ',')

eigenval_all$V2 <- eigenval_all$V1/(sum(eigenval_all$V1))*100
eigenval_all$V2

eigenvec_table_rename <- eigenvec_all %>% 
  rename(Individual=V2)

eigenvec_with_sub <- merge(eigenvec_table_rename, ids,by="Individual")

PC1c <-ggplot(eigenvec_with_sub, aes(x=V3, y=V4, color=Location)) +
  scale_color_manual(name="Location", values=cbPalette) +
  geom_point(size=3, alpha = 3/4) +
  xlab("PC1 (7.70%)") + ylab("PC2 (5.14%)") +
  theme(legend.position = "right", legend.title = element_blank()) +
  theme_bw()
PC1c

legend <- get_legend(PC1)
PC1 <- PC1 + theme(legend.position="none") 
PC1b <- PC1b + theme(legend.position="none") 
PC1c <- PC1c + theme(legend.position="none") 
grid.arrange(PC1, PC1b, PC1c, ncol=3, nrow =1, widths = c(2.5, 2.5, 2.5))
