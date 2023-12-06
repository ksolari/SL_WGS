setwd("~/Documents/R")
library("devtools")
library(rEEMSplots)
library(rgdal)
library(rworldmap)
library(rworldxtra)
library(RColorBrewer)


projection_none <- "+proj=longlat +datum=WGS84" 
projection_mercator <- "+proj=merc +datum=WGS84"


######## FINAL?? EEMS run - updated outline and updated GPS for Leo AND U01, U08, AF_06, KYG_F4 removed###
mcmc200a = "EMMS_nIndiv27_nSites1343552_nDemes200_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run1"
mcmc200b = "EMMS_nIndiv27_nSites1343552_nDemes200_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run2"
mcmc200c = "EMMS_nIndiv27_nSites1343552_nDemes200_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run3"
mcmc400a = "EMMS_nIndiv27_nSites1343552_nDemes400_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run1"
mcmc400b = "EMMS_nIndiv27_nSites1343552_nDemes400_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run2"
mcmc400c = "EMMS_nIndiv27_nSites1343552_nDemes400_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run3"
mcmc600a = "EMMS_nIndiv27_nSites1343552_nDemes600_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run1"
mcmc600b = "EMMS_nIndiv27_nSites1343552_nDemes600_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run2"
mcmc600c = "EMMS_nIndiv27_nSites1343552_nDemes600_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run3"
eems.plots(mcmcpath = c(mcmc200a,mcmc200b,mcmc200c,mcmc400a,mcmc400b,mcmc400c,mcmc600a,mcmc600b,mcmc600c),
           plotpath = paste0("EMMS_nIndiv27_nSites1343552_nDemes200_400_600_Param_x30_mseed10_mrate05_8mil_newOutline_newLeoGPS_run3-rEEMSplots_map_BrBG", "-geographic-map"), longlat = FALSE,
           projection.in = projection_none,
           projection.out = projection_mercator,
           add.map = TRUE, add.outline = TRUE, add.demes=TRUE, eems.colors = brewer.pal(11, "BrBG"), m.colscale = c(-1.5,1.5),
           col.map = "grey", out.png=FALSE, 
           lwd.map = 5)



###Final 3 reps of 8mill for 200, 400 and 600 of microsat data
mcmc200a = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d200"
mcmc200b = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d200_runb"
mcmc200c = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d200_runc"
mcmc400a = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d400_runa"
mcmc400b = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d400_runb"
mcmc400c = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d400_runc"
mcmc600a = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d600_runa"
mcmc600b = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d600_runb"
mcmc600c = "EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_d600_runc"
projection_none <- "+proj=longlat +datum=WGS84" 
projection_mercator <- "+proj=merc +datum=WGS84"
eems.plots(mcmcpath = c(mcmc200a,mcmc200b,mcmc200c,mcmc400a,mcmc400b,mcmc400c,mcmc600a,mcmc600b,mcmc600c),
           plotpath = paste0("EMMS_SL_microsat_qE03_qS3_mE3_mS1_mr05_3x_200_400_600_demes-rEEMSplots_map_BrBG", "-geographic-map"), longlat = FALSE,
           projection.in = projection_none,
           projection.out = projection_mercator,
           add.map = TRUE, add.outline = TRUE, add.demes=TRUE, eems.colors = brewer.pal(11, "BrBG"), m.colscale = c(-1.5,1.5),
           col.map = "grey", out.png=FALSE, 
           lwd.map = 5)


