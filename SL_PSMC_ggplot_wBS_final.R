setwd("~/Documents/R")
library(ggplot2)

AF_BS <- read.csv('AF_IN_MG_CP_30bs.csv', head = T, sep = ',')
p <- ggplot() + geom_step(data=AF_BS, mapping=aes(x=(AF_time), y=AF), color = "#654CFF", size = 1) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs1), y=AF_bs1), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs2), y=AF_bs2), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs3), y=AF_bs3), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs4), y=AF_bs4), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs5), y=AF_bs5), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs6), y=AF_bs6), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs7), y=AF_bs7), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs8), y=AF_bs8), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs9), y=AF_bs9), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs10), y=AF_bs10), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs11), y=AF_bs11), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs12), y=AF_bs12), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs13), y=AF_bs13), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs14), y=AF_bs14), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs15), y=AF_bs15), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs16), y=AF_bs16), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs17), y=AF_bs17), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs18), y=AF_bs18), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs19), y=AF_bs19), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs20), y=AF_bs20), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs21), y=AF_bs21), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs22), y=AF_bs22), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs23), y=AF_bs23), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs24), y=AF_bs24), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs25), y=AF_bs25), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs26), y=AF_bs26), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs27), y=AF_bs27), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs28), y=AF_bs28), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs29), y=AF_bs29), color = "#654CFF", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(AF_time_bs30), y=AF_bs30), color = "#654CFF", alpha = 0.15, size = 0.3) +
  
  geom_step(data=AF_BS, mapping=aes(x=(IN_time), y=IN), color = "#E51932", size=1) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs1), y=IN_bs1), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs2), y=IN_bs2), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs3), y=IN_bs3), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs4), y=IN_bs4), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs5), y=IN_bs5), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs6), y=IN_bs6), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs7), y=IN_bs7), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs8), y=IN_bs8), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs9), y=IN_bs9), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs10), y=IN_bs10), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs11), y=IN_bs11), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs12), y=IN_bs12), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs13), y=IN_bs13), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs14), y=IN_bs14), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs15), y=IN_bs15), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs16), y=IN_bs16), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs17), y=IN_bs17), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs18), y=IN_bs18), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs19), y=IN_bs19), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs20), y=IN_bs20), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs21), y=IN_bs21), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs22), y=IN_bs22), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs23), y=IN_bs23), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs24), y=IN_bs24), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs25), y=IN_bs25), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs26), y=IN_bs26), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs27), y=IN_bs27), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs28), y=IN_bs28), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs29), y=IN_bs29), color = "#E51932", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(IN_time_bs30), y=IN_bs30), color = "#E51932", alpha = 0.15, size = 0.3) +
  
  geom_step(data=AF_BS, mapping=aes(x=(MG_time), y=MG), color = "green3", size=1) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs1), y=MG_bs1), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs2), y=MG_bs2), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs3), y=MG_bs3), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs4), y=MG_bs4), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs5), y=MG_bs5), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs6), y=MG_bs6), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs7), y=MG_bs7), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs8), y=MG_bs8), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs9), y=MG_bs9), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs10), y=MG_bs10), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs11), y=MG_bs11), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs12), y=MG_bs12), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs13), y=MG_bs13), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs14), y=MG_bs14), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs15), y=MG_bs15), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs16), y=MG_bs16), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs17), y=MG_bs17), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs18), y=MG_bs18), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs19), y=MG_bs19), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs20), y=MG_bs20), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs21), y=MG_bs21), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs22), y=MG_bs22), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs23), y=MG_bs23), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs24), y=MG_bs24), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs25), y=MG_bs25), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs26), y=MG_bs26), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs27), y=MG_bs27), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs28), y=MG_bs28), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs29), y=MG_bs29), color = "green3", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(MG_time_bs30), y=MG_bs30), color = "green3", alpha = 0.15, size = 0.3) +
  
  geom_step(data=AF_BS, mapping=aes(x=(CP_time), y=CP), color = "black", size=1) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs1), y=CP_bs1), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs2), y=CP_bs2), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs3), y=CP_bs3), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs4), y=CP_bs4), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs5), y=CP_bs5), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs6), y=CP_bs6), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs7), y=CP_bs7), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs8), y=CP_bs8), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs9), y=CP_bs9), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs10), y=CP_bs10), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs11), y=CP_bs11), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs12), y=CP_bs12), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs13), y=CP_bs13), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs14), y=CP_bs14), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs15), y=CP_bs15), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs16), y=CP_bs16), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs17), y=CP_bs17), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs18), y=CP_bs18), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs19), y=CP_bs19), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs20), y=CP_bs20), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs21), y=CP_bs21), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs22), y=CP_bs22), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs23), y=CP_bs23), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs24), y=CP_bs24), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs25), y=CP_bs25), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs26), y=CP_bs26), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs27), y=CP_bs27), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs28), y=CP_bs28), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs29), y=CP_bs29), color = "black", alpha = 0.15, size = 0.3) +
  geom_step(data=AF_BS, mapping=aes(x=(CP_time_bs30), y=CP_bs30), color = "black", alpha = 0.15, size = 0.3) +
  
  labs(x = "log(time)", y = "effective population size x 10,000", color = "Legend") + scale_color_manual(values = colors) +
  theme_classic()+
  theme(axis.text.x = element_text(size = 13), 
        axis.text.y = element_text(size = 13), 
        axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        strip.text = element_text(size = 13),
        legend.position="bottomright",
        panel.grid.major.y = element_line(color = "grey90"),
        plot.margin = margin(.5, 1, .5, .5, "cm")) 
p + scale_x_continuous(trans='log10')

