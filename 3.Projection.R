#FMestre
#27-08-2021

#10. Build ensemble
ensemble_olive_D <- sdm::ensemble(M_olive_D,newdata=high_res_preds,filename='ensemble_olive_D_current.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W <- sdm::ensemble(M_olive_W,newdata=high_res_preds,filename='ensemble_olive_W_current.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD <- sdm::ensemble(M_olive_WD,newdata=high_res_preds,filename='ensemble_olive_WD_current.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#plot(ensemble_olive_D)
#plot(ensemble_olive_W)
#plot(ensemble_olive_WD)

#Metrics
metrics_olive_D <- evaluates(data_olive_D, ensemble_olive_D)
metrics_olive_D@statistics$AUC
metrics_olive_W <- evaluates(data_olive_W, ensemble_olive_W)
metrics_olive_W@statistics$AUC
metrics_olive_WD <- evaluates(data_olive_WD, ensemble_olive_WD)
metrics_olive_WD@statistics$AUC
#
#Clean environment
#rm(high_res_preds)

###########################################################
########################## FUTURE ######################### 
###########################################################
#2050

######################## CCSM4 (CC) ########################

########## RCP45 ########## 
ensemble_olive_D_2050_CC_45 <- sdm::ensemble(M_olive_D,newdata=CC_rcp45_vars,filename='ensemble_olive_D_2050_CC_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_CC_45 <- sdm::ensemble(M_olive_W,newdata=CC_rcp45_vars,filename='ensemble_olive_W_2050_CC_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_CC_45 <- sdm::ensemble(M_olive_WD,newdata=CC_rcp45_vars,filename='ensemble_olive_WD_2050_CC_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(CC_rcp45_vars)

########## RCP85 ########## 
ensemble_olive_D_2050_CC_85 <- sdm::ensemble(M_olive_D,newdata=CC_rcp85_vars,filename='ensemble_olive_D_2050_CC_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_CC_85 <- sdm::ensemble(M_olive_W,newdata=CC_rcp85_vars,filename='ensemble_olive_W_2050_CC_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_CC_85 <- sdm::ensemble(M_olive_WD,newdata=CC_rcp85_vars,filename='ensemble_olive_WD_2050_CC_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(CC_rcp85_vars)

######################## CNRM-CM5 (CN) ########################

########## RCP45 ########## 
#AHM and SHM have problems!
########## RCP85 ########## 
#AHM and SHM have problems!

######################## GFDL-CM3	(GF) ######################## 

########## RCP45 ########## 
ensemble_olive_D_2050_GF_45 <- sdm::ensemble(M_olive_D,newdata=GF_rcp45_vars,filename='ensemble_olive_D_2050_GF_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_GF_45 <- sdm::ensemble(M_olive_W,newdata=GF_rcp45_vars,filename='ensemble_olive_W_2050_GF_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_GF_45 <- sdm::ensemble(M_olive_WD,newdata=GF_rcp45_vars,filename='ensemble_olive_WD_2050_GF_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(GF_rcp45_vars)

########## RCP85 ########## 
ensemble_olive_D_2050_GF_85 <- sdm::ensemble(M_olive_D,newdata=GF_rcp85_vars,filename='ensemble_olive_D_2050_GF_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_GF_85 <- sdm::ensemble(M_olive_W,newdata=GF_rcp85_vars,filename='ensemble_olive_W_2050_GF_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_GF_85 <- sdm::ensemble(M_olive_WD,newdata=GF_rcp85_vars,filename='ensemble_olive_WD_2050_GF_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(GF_rcp85_vars)

######################## HadGEM2-ES	(HE) ######################## 

########## RCP45 ########## 
ensemble_olive_D_2050_HE_45 <- sdm::ensemble(M_olive_D,newdata=HE_rcp45_vars,filename='ensemble_olive_D_2050_HE_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_HE_45 <- sdm::ensemble(M_olive_W,newdata=HE_rcp45_vars,filename='ensemble_olive_W_2050_HE_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_HE_45 <- sdm::ensemble(M_olive_WD,newdata=HE_rcp45_vars,filename='ensemble_olive_WD_2050_HE_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(HE_rcp45_vars)

########## RCP85 ########## 
ensemble_olive_D_2050_HE_85 <- sdm::ensemble(M_olive_D,newdata=HE_rcp85_vars,filename='ensemble_olive_D_2050_HE_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_HE_85 <- sdm::ensemble(M_olive_W,newdata=HE_rcp85_vars,filename='ensemble_olive_W_2050_HE_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_HE_85 <- sdm::ensemble(M_olive_WD,newdata=HE_rcp85_vars,filename='ensemble_olive_WD_2050_HE_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(HE_rcp85_vars)

######################## INMCM4 (IN) ######################## 

########## RCP45 ########## 
ensemble_olive_D_2050_IN_45 <- sdm::ensemble(M_olive_D,newdata=IN_rcp45_vars,filename='ensemble_olive_D_2050_IN_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_IN_45 <- sdm::ensemble(M_olive_W,newdata=IN_rcp45_vars,filename='ensemble_olive_W_2050_IN_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_IN_45 <- sdm::ensemble(M_olive_WD,newdata=IN_rcp45_vars,filename='ensemble_olive_WD_2050_IN_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(IN_rcp45_vars)

########## RCP85 ########## 
ensemble_olive_D_2050_IN_85 <- sdm::ensemble(M_olive_D,newdata=IN_rcp85_vars,filename='ensemble_olive_D_2050_IN_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_IN_85 <- sdm::ensemble(M_olive_W,newdata=IN_rcp85_vars,filename='ensemble_olive_W_2050_IN_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_IN_85 <- sdm::ensemble(M_olive_WD,newdata=IN_rcp85_vars,filename='ensemble_olive_WD_2050_IN_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(IN_rcp85_vars)

######################## IPSL-CM5A-LR	(IP) ######################## 

########## RCP45 ########## 
ensemble_olive_D_2050_IP_45 <- sdm::ensemble(M_olive_D,newdata=IP_rcp45_vars,filename='ensemble_olive_D_2050_IP_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_IP_45 <- sdm::ensemble(M_olive_W,newdata=IP_rcp45_vars,filename='ensemble_olive_W_2050_IP_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_IP_45 <- sdm::ensemble(M_olive_WD,newdata=IP_rcp45_vars,filename='ensemble_olive_WD_2050_IP_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(IP_rcp45_vars)

########## RCP85 ########## 
ensemble_olive_D_2050_IP_85 <- sdm::ensemble(M_olive_D,newdata=IP_rcp85_vars,filename='ensemble_olive_D_2050_IP_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_IP_85 <- sdm::ensemble(M_olive_W,newdata=IP_rcp85_vars,filename='ensemble_olive_W_2050_IP_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_IP_85 <- sdm::ensemble(M_olive_WD,newdata=IP_rcp85_vars,filename='ensemble_olive_WD_2050_IP_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(IP_rcp85_vars)

######################## MPI-ESM-LR	(MP) ######################## 

########## RCP45 ########## 
ensemble_olive_D_2050_MP_45 <- sdm::ensemble(M_olive_D,newdata=MP_rcp45_vars,filename='ensemble_olive_D_2050_MP_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_MP_45 <- sdm::ensemble(M_olive_W,newdata=MP_rcp45_vars,filename='ensemble_olive_W_2050_MP_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_MP_45 <- sdm::ensemble(M_olive_WD,newdata=MP_rcp45_vars,filename='ensemble_olive_WD_2050_MP_45.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(MP_rcp45_vars)

########## RCP85 ########## 
ensemble_olive_D_2050_MP_85 <- sdm::ensemble(M_olive_D,newdata=MP_rcp85_vars,filename='ensemble_olive_D_2050_MP_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_W_2050_MP_85 <- sdm::ensemble(M_olive_W,newdata=MP_rcp85_vars,filename='ensemble_olive_W_2050_MP_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
ensemble_olive_WD_2050_MP_85 <- sdm::ensemble(M_olive_WD,newdata=MP_rcp85_vars,filename='ensemble_olive_WD_2050_MP_85.img',setting=list(method='weighted',stat='TSS',power=2),overwrite=TRUE) 
#rm(MP_rcp85_vars)


############################################################ 
save.image("olives.RData")
