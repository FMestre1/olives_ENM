#FMestre
#27-08-2021

###########################################################
######################### CURRENT ######################### 
###########################################################

# 8. Load the variables with higher resolution to project the model

#### Bioclimatic variables to project the model to (many not required, not in the model)
#I'll load all just in case...

b1 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_1.tif")
b1 <- crop(b1, study_site)
b1 <- mask(b1, study_site)
#plot(b1)
b2 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_2.tif")
b2 <- crop(b2, study_site)
b2 <- mask(b2, study_site)
#plot(b2)
b3 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_3.tif")
b3 <- crop(b3, study_site)
b3 <- mask(b3, study_site)
#plot(b3)
b4 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_4.tif")
b4 <- crop(b4, study_site)
b4 <- mask(b4, study_site)
#plot(b4)
b5 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_5.tif")
b5 <- crop(b5, study_site)
b5 <- mask(b5, study_site)
#plot(b5)
b6 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_6.tif")
b6 <- crop(b6, study_site)
b6 <- mask(b6, study_site)
#plot(b6)
b7 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_7.tif")
b7 <- crop(b7, study_site)
b7 <- mask(b7, study_site)
#plot(b7)
b8 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_8.tif")
b8 <- crop(b8, study_site)
b8 <- mask(b8, study_site)
#plot(b8)
b9 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_9.tif")
b9 <- crop(b9, study_site)
b9 <- mask(b9, study_site)
#plot(b9)
b10 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_10.tif")
b10 <- crop(b10, study_site)
b10 <- mask(b10, study_site)
#plot(b10)
b11 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_11.tif")
b11 <- crop(b11, study_site)
b11 <- mask(b11, study_site)
#plot(b11)
b12 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_12.tif")
b12 <- crop(b12, study_site)
b12 <- mask(b12, study_site)
#plot(b12)
b13 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_13.tif")
b13 <- crop(b13, study_site)
b13 <- mask(b13, study_site)
#plot(b13)
b14 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_14.tif")
b14 <- crop(b14, study_site)
b14 <- mask(b14, study_site)
#plot(b14)
b15 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_15.tif")
b15 <- crop(b15, study_site)
b15 <- mask(b15, study_site)
#plot(b15)
b16 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_16.tif")
b16 <- crop(b16, study_site)
b16 <- mask(b16, study_site)
#plot(b16)
b17 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_17.tif")
b17 <- crop(b17, study_site)
b17 <- mask(b17, study_site)
#plot(b17)
b18 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_18.tif")
b18 <- crop(b18, study_site)
b18 <- mask(b18, study_site)
#plot(b18)
b19 <- raster("D:/Dados climáticos/WorldClim 2.0/wc2.1_30s_bio/wc2.1_30s_bio_19.tif")
b19 <- crop(b19, study_site)
b19 <- mask(b19, study_site)
#plot(b19)


#Other climatic
#Annual heat:moisture index (MAT+10)/(MAP/1000))
ahm <- raster("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/ahm_wgs84.tif")
ahm <- resample(ahm, b1, method="bilinear")
ahm <- crop(ahm, study_site)
ahm <- mask(ahm, study_site)

#Summer heat:moisture index ((MWMT)/(MSP/1000))
shm <- raster("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/shm_wgs84.tif")
shm <- resample(shm, b1, method="bilinear")
shm <- crop(shm, study_site)
shm <- mask(shm, study_site)

#Number of frost-free days
nffd <- raster("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/nffd_wgs84.tif")
nffd <- resample(nffd, b1, method="bilinear")
nffd <- crop(nffd, study_site)
nffd <- mask(nffd, study_site)

#Hargreaves reference evaporation
eref <- raster("D:/MOVING/CLIMATE/CLIMATE_PROL_EU/Albers_2.5km_Normal_1961-1990_bioclim/wgs/eref_wgs84.tif")
eref <- resample(eref, b1, method="bilinear")
eref <- crop(eref, study_site)
eref <- mask(eref, study_site)


#### Soil property variables ####
#Soil moisture
moisture <- raster("D:/Dados de Solos/Soil Moisture Storage Capacity Derived from the Soil Map of the World/smax/w001001.adf")
moisture <- resample(moisture, b1, method="bilinear")
moisture <- crop(moisture, study_site)
moisture <- mask(moisture, study_site)
#plot(moisture)

#soil pH
pH <- raster("D:/MOVING/SOILS/SOIL_Ph/ph_wgs84.tif")
pH <- resample(pH, b1, method="bilinear")
pH <- crop(pH, study_site)
pH <- mask(pH, study_site)
#plot(pH)

#Create high resolution raster stack
high_res_preds <- stack(b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,
               b18,b19,ahm,shm,nffd,eref,moisture,pH)

#names(preds)
#nlayers(preds)

names(high_res_preds) <- c("bio1","bio2","bio3","bio4","bio5","bio6","bio7","bio8","bio9",
                  "bio10","bio11","bio12","bio13","bio14","bio15","bio16","bio17",
                  "bio18","bio19","ahm", "shm", "nffd", "eref","moisture","pH"
)

# 9.Predict
predict_olive_D <- predict(M_olive_D,newdata=high_res_preds,filename='predicted_olive_D_current.img', overwrite = TRUE)
predict_olive_W <- predict(M_olive_W,newdata=high_res_preds,filename='predicted_olive_W_current.img', overwrite = TRUE)
predict_olive_WD <- predict(M_olive_WD,newdata=high_res_preds,filename='predicted_olive_WD_current.img', overwrite = TRUE)
#
predict_vine_D <- predict(M_vine_D,newdata=high_res_preds,filename='predicted_vine_D_current.img', overwrite = TRUE)
predict_vine_W <- predict(M_vine_W,newdata=high_res_preds,filename='predicted_vine_W_current.img', overwrite = TRUE)
predict_vine_WD <- predict(M_vine_WD,newdata=high_res_preds,filename='predicted_vine_WD_current.img', overwrite = TRUE)


#10. Build ensemble
ensemble_olive_D <- ensemble(M_olive_D,newdata=high_res_preds,filename='ensemble_olive_D_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_olive_W <- ensemble(M_olive_W,newdata=high_res_preds,filename='ensemble_olive_W_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_olive_WD <- ensemble(M_olive_WD,newdata=high_res_preds,filename='ensemble_olive_WD_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
#plot(ensemble_olive_D)
#plot(ensemble_olive_W)
#plot(ensemble_olive_WD)

ensemble_vine_D <- ensemble(M_vine_D,newdata=high_res_preds,filename='ensemble_vine_D_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_vine_W <- ensemble(M_vine_W,newdata=high_res_preds,filename='ensemble_vine_W_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_vine_WD <- ensemble(M_vine_WD,newdata=high_res_preds,filename='ensemble_vine_WD_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
#plot(ensemble_vine_D)
#plot(ensemble_vine_W)
#plot(ensemble_vine_WD)

rm(b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,
   b18,b19,ahm,shm,nffd,eref,moisture,pH)
rm(high_res_preds)

###########################################################
########################## FUTURE ######################### 
###########################################################



