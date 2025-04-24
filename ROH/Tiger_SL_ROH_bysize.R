setwd("~/Documents/R")

Tiger_SL_ROH <- read.csv("Tiger_SL_ROH_5bins.csv", header = T, sep = ',')
df_Tiger_SL_ROH <- Tiger_SL_ROH %>%
  group_by(INDV, size_class_B) %>%
  summarize(Total = sum(Genome_fraction))

Tiger_SL <- ggplot(df_Tiger_SL_ROH, aes(x = INDV, y = Total, fill = factor(size_class_B, levels=c("over_10gb","5_10gb","3_5gb","1_3gb","100kb_1gb"))))+
  geom_bar(position = "stack", stat = "identity") +  # Stacking the bars
  scale_fill_manual(values = c("black", "grey40", "grey70", "grey70","grey90"))+
  labs(title = "Stacked Bar Chart", x = "Individual", y = "Genome_fraction") +
  theme_classic()  # Optional: Use a simple theme

Tiger_SL2 <- Tiger_SL + scale_x_discrete(limits=c("U08","U04","U01","U09","U03","U06","U14","U07","U05","Mong_SRR836372",
               "Leo","AF_08","India_NCBS","Bronx_Zoo","DNAzoo",
               "SRR7152379", "SRR7152382","SRR7152383","SRR7152384",
               "SRR7152385","SRR7152386","SRR7152388", "SUM1", "SUM13", "SUM2","SUM6", 
               "SRR7152387","MAL1", "MAL14", "MAL2", "MAL3", "MAL4", "SRR7152390", 
               "SRR7152391","SRR7152393", "SRR7152394", "SRR7152396", "SRR7152397", 
               "SRR7152395", "SRR7152402", "SRR7152405", "SRR7152406", "SRR7152407", 
               "SRR7152408", "BEN_CI2","BEN_CI3","BEN_CI4","BEN_CI5", "BEN_CI6","BEN_NE1", "BEN_NE2", 
               "BEN_NE3", "BEN_NOR2", "BEN_SA3","BEN_SI1", "BEN_SI2","BEN_SI3", "BEN_SI4", "BEN_SI5", 
               "BEN_SI6","SRR5591010", "SRR7152380", "SRR7152381", "SRR7152401","AMU1","AMU11","AMU2",
               "AMU20", "AMU21","AMU24","AMU4","AMU5","AMU7","AMU8","AMU9","SRR7152399","SRR7152400",
               "SRR7152403","SRR7152404","SRR7152409","SRR7152410","SRR836306"))

Tiger_SL2 + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

