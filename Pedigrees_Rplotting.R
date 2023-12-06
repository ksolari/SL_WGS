setwd("~/Documents/R")
require(kinship2)

SL1 <- read.csv('SL_ped_MSB_M1_891.csv', head = T, sep = ',')
pedAll <- pedigree(id = SL1$id, dadid = SL1$father, momid = SL1$mother, 
                   sex = SL1$sex, famid = SL1$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SL1$origin)

SL2 <- read.csv('SL_ped_MSB_F1_2363.csv', head = T, sep = ',')
pedAll <- pedigree(id = SL2$id, dadid = SL2$father, momid = SL2$mother, 
                   sex = SL2$sex, famid = SL2$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SL2$origin)

SL3 <- read.csv('SL_ped_PAzoo_2662.csv', head = T, sep = ',')
pedAll <- pedigree(id = SL3$id, dadid = SL3$father, momid = SL3$mother, 
                   sex = SL3$sex, famid = SL3$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SL3$origin)

SL4 <- read.csv('SL_ped_DNAzoo_2368.csv', head = T, sep = ',')
pedAll <- pedigree(id = SL4$id, dadid = SL4$father, momid = SL4$mother, 
                   sex = SL4$sex, famid = SL4$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SL4$origin)

SL5 <- read.csv('SL_ped_10xSDzoo_18020.csv', head = T, sep = ',')
pedAll <- pedigree(id = SL5$id, dadid = SL5$father, momid = SL5$mother, 
                   sex = SL5$sex, famid = SL5$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SL5$origin)

SL6 <- read.csv('SL_ped_BronxZoo_2830.csv', head = T, sep = ',')
pedAll <- pedigree(id = SL6$id, dadid = SL6$father, momid = SL6$mother, 
                   sex = SL6$sex, famid = SL6$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SL6$origin)

SLall <- read.csv('SL_ped_ALL6samples.csv', head = T, sep = ',')
pedAll <- pedigree(id = SLall$id, dadid = SLall$father, momid = SLall$mother, 
                   sex = SLall$sex, famid = SLall$ped)
print(pedAll)
ped1basic <- pedAll["1"]
plot(ped1basic, col=SLall$origin)

kin2 <- kinship(ped1basic)
write.table(kin2, "SL_ped_ALL6samples_kinship.txt")
