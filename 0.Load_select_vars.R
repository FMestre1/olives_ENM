################################################################################
#         VARIABLES FOR MODEL CALIBRATION - GENERATING SDM DATA OBJECT
################################################################################

#FMestre
#30/07/2021

# 0.Load required packages
library(devtools)
devtools::install_github("babaknaimi/sdm")
library(sdm)
library(usdm)
installAll()
library(raster)
#library(rgdal)
#library(maptools)
#library(rgeos)
#install.packages("exactextractr")
library(exactextractr)

# 1.Study site
study_site <- raster::shapefile("D:\\SDM_OLIVES\\shape\\PIberica2.shp")
#raster::plot(study_site)

# 2.Load bioclimatic variables ############################

#### Bioclimatic variables to project the model to (may not all be required)
#CMIP5 - 30 seconds - https://www.worldclim.org/data/v1.4/cmip5_30s.html

b1 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_1.tif")
b1 <- crop(b1, study_site)
b1 <- mask(b1, study_site)
#plot(b1)
b2 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_2.tif")
b2 <- crop(b2, study_site)
b2 <- mask(b2, study_site)
#plot(b2)
b3 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_3.tif")
b3 <- crop(b3, study_site)
b3 <- mask(b3, study_site)
#plot(b3)
b4 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_4.tif")
b4 <- crop(b4, study_site)
b4 <- mask(b4, study_site)
#plot(b4)
b5 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_5.tif")
b5 <- crop(b5, study_site)
b5 <- mask(b5, study_site)
#plot(b5)
b6 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_6.tif")
b6 <- crop(b6, study_site)
b6 <- mask(b6, study_site)
#plot(b6)
b7 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_7.tif")
b7 <- crop(b7, study_site)
b7 <- mask(b7, study_site)
#plot(b7)
b8 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_8.tif")
b8 <- crop(b8, study_site)
b8 <- mask(b8, study_site)
#plot(b8)
b9 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_9.tif")
b9 <- crop(b9, study_site)
b9 <- mask(b9, study_site)
#plot(b9)
b10 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_10.tif")
b10 <- crop(b10, study_site)
b10 <- mask(b10, study_site)
#plot(b10)
b11 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_11.tif")
b11 <- crop(b11, study_site)
b11 <- mask(b11, study_site)
#plot(b11)
b12 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_12.tif")
b12 <- crop(b12, study_site)
b12 <- mask(b12, study_site)
#plot(b12)
b13 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_13.tif")
b13 <- crop(b13, study_site)
b13 <- mask(b13, study_site)
#plot(b13)
b14 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_14.tif")
b14 <- crop(b14, study_site)
b14 <- mask(b14, study_site)
#plot(b14)
b15 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_15.tif")
b15 <- crop(b15, study_site)
b15 <- mask(b15, study_site)
#plot(b15)
b16 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_16.tif")
b16 <- crop(b16, study_site)
b16 <- mask(b16, study_site)
#plot(b16)
b17 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_17.tif")
b17 <- crop(b17, study_site)
b17 <- mask(b17, study_site)
#plot(b17)
b18 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_18.tif")
b18 <- crop(b18, study_site)
b18 <- mask(b18, study_site)
#plot(b18)
b19 <- raster("D:\\SDM_OLIVES\\current_vars\\wc2.1_30s_bio_19.tif")
b19 <- crop(b19, study_site)
b19 <- mask(b19, study_site)
#plot(b19)

#Adjust the CRS of the study site vector
crs(study_site) <- crs(b1)

#Other climatic variables - ClimateEU
#https://sites.ualberta.ca/~ahamann/data/climateeu.html

#Annual heat:moisture index (MAT+10)/(MAP/1000))
ahm <- raster("D:\\SDM_OLIVES\\current_vars\\ahm_wgs84.tif")
ahm <- resample(ahm, b1, method="bilinear")
ahm <- crop(ahm, study_site)
ahm <- mask(ahm, study_site)

#Summer heat:moisture index ((MWMT)/(MSP/1000))
shm <- raster("D:\\SDM_OLIVES\\current_vars\\shm_wgs84.tif")
shm <- resample(shm, b1, method="bilinear")
shm <- crop(shm, study_site)
shm <- mask(shm, study_site)

#Number of frost-free days
nffd <- raster("D:\\SDM_OLIVES\\current_vars\\nffd_wgs84.tif")
nffd <- resample(nffd, b1, method="bilinear")
nffd <- crop(nffd, study_site)
nffd <- mask(nffd, study_site)

#Hargreaves reference evaporation
eref <- raster("D:\\SDM_OLIVES\\current_vars\\eref_wgs84.tif")
eref <- resample(eref, b1, method="bilinear")
eref <- crop(eref, study_site)
eref <- mask(eref, study_site)

#soil pH
pH <- raster("D:\\SDM_OLIVES\\current_vars\\ph_wgs84.tif")
pH <- resample(pH, b1, method="bilinear")
pH <- crop(pH, study_site)
pH <- mask(pH, study_site)
#plot(pH)

#Create high resolution raster stack
high_res_preds <- stack(b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,
                        b18,b19,ahm,shm,nffd,eref,pH)


#names(preds)
#nlayers(preds)

names(high_res_preds) <- c("bio1","bio2","bio3","bio4","bio5","bio6","bio7","bio8","bio9",
                           "bio10","bio11","bio12","bio13","bio14","bio15","bio16","bio17",
                           "bio18","bio19","ahm", "shm", "nffd", "eref","pH"
)


#Create 10x10 km to calibrate models
utm10 <- sf::read_sf("D:\\SDM_OLIVES\\shape\\UTM_10x10_km.shp")
bio1_10x10 <- exactextractr::exact_extract(b1, utm10, 'mean')
utm_bio1_10x10_df <- data.frame(utm = utm10$UTMCODE, bio1_10x10)
names(utm_bio1_10x10_df)[1] <- "UTMCODE"
bio1_10x10_poly <- merge(utm10, utm_bio1_10x10_df, by = 'UTMCODE')
bio1_10x10_raster <- raster()
extent(bio1_10x10_raster) <- extent(bio1_10x10_poly)
bio1_10x10_raster <- rasterize(bio1_10x10_poly, bio1_10x10_raster, field ="bio1_10x10")
plot(bio1_10x10_raster)
#
bio2_10x10 <- exactextractr::exact_extract(b2, utm10, 'mean')
utm_bio2_10x10_df <- data.frame(utm = utm10$UTMCODE, bio2_10x10)
names(utm_bio2_10x10_df)[1] <- "UTMCODE"
bio2_10x10_poly <- merge(utm10, utm_bio2_10x10_df, by = 'UTMCODE')
bio2_10x10_raster <- raster()
extent(bio2_10x10_raster) <- extent(bio2_10x10_poly)
bio2_10x10_raster <- rasterize(bio2_10x10_poly, bio2_10x10_raster, field ="bio2_10x10")
plot(bio2_10x10_raster)
#
bio3_10x10 <- exactextractr::exact_extract(b3, utm10, 'mean')
utm_bio3_10x10_df <- data.frame(utm = utm10$UTMCODE, bio3_10x10)
names(utm_bio3_10x10_df)[1] <- "UTMCODE"
bio3_10x10_poly <- merge(utm10, utm_bio3_10x10_df, by = 'UTMCODE')
bio3_10x10_raster <- raster()
extent(bio3_10x10_raster) <- extent(bio3_10x10_poly)
bio3_10x10_raster <- rasterize(bio3_10x10_poly, bio3_10x10_raster, field ="bio3_10x10")
plot(bio3_10x10_raster)
#
bio4_10x10 <- exactextractr::exact_extract(b4, utm10, 'mean')
utm_bio4_10x10_df <- data.frame(utm = utm10$UTMCODE, bio4_10x10)
names(utm_bio4_10x10_df)[1] <- "UTMCODE"
bio4_10x10_poly <- merge(utm10, utm_bio4_10x10_df, by = 'UTMCODE')
bio4_10x10_raster <- raster()
extent(bio4_10x10_raster) <- extent(bio4_10x10_poly)
bio4_10x10_raster <- rasterize(bio4_10x10_poly, bio4_10x10_raster, field ="bio4_10x10")
plot(bio4_10x10_raster)
#
bio5_10x10 <- exactextractr::exact_extract(b5, utm10, 'mean')
utm_bio5_10x10_df <- data.frame(utm = utm10$UTMCODE, bio5_10x10)
names(utm_bio5_10x10_df)[1] <- "UTMCODE"
bio5_10x10_poly <- merge(utm10, utm_bio5_10x10_df, by = 'UTMCODE')
bio5_10x10_raster <- raster()
extent(bio5_10x10_raster) <- extent(bio5_10x10_poly)
bio5_10x10_raster <- rasterize(bio5_10x10_poly, bio5_10x10_raster, field ="bio5_10x10")
plot(bio5_10x10_raster)
#
bio6_10x10 <- exactextractr::exact_extract(b6, utm10, 'mean')
utm_bio6_10x10_df <- data.frame(utm = utm10$UTMCODE, bio6_10x10)
names(utm_bio6_10x10_df)[1] <- "UTMCODE"
bio6_10x10_poly <- merge(utm10, utm_bio6_10x10_df, by = 'UTMCODE')
bio6_10x10_raster <- raster()
extent(bio6_10x10_raster) <- extent(bio6_10x10_poly)
bio6_10x10_raster <- rasterize(bio6_10x10_poly, bio6_10x10_raster, field ="bio6_10x10")
plot(bio6_10x10_raster)
#
bio7_10x10 <- exactextractr::exact_extract(b7, utm10, 'mean')
utm_bio7_10x10_df <- data.frame(utm = utm10$UTMCODE, bio7_10x10)
names(utm_bio7_10x10_df)[1] <- "UTMCODE"
bio7_10x10_poly <- merge(utm10, utm_bio7_10x10_df, by = 'UTMCODE')
bio7_10x10_raster <- raster()
extent(bio7_10x10_raster) <- extent(bio7_10x10_poly)
bio7_10x10_raster <- rasterize(bio7_10x10_poly, bio7_10x10_raster, field ="bio7_10x10")
plot(bio7_10x10_raster)
#
bio8_10x10 <- exactextractr::exact_extract(b8, utm10, 'mean')
utm_bio8_10x10_df <- data.frame(utm = utm10$UTMCODE, bio8_10x10)
names(utm_bio8_10x10_df)[1] <- "UTMCODE"
bio8_10x10_poly <- merge(utm10, utm_bio8_10x10_df, by = 'UTMCODE')
bio8_10x10_raster <- raster()
extent(bio8_10x10_raster) <- extent(bio8_10x10_poly)
bio8_10x10_raster <- rasterize(bio8_10x10_poly, bio8_10x10_raster, field ="bio8_10x10")
plot(bio8_10x10_raster)
#
bio9_10x10 <- exactextractr::exact_extract(b9, utm10, 'mean')
utm_bio9_10x10_df <- data.frame(utm = utm10$UTMCODE, bio9_10x10)
names(utm_bio9_10x10_df)[1] <- "UTMCODE"
bio9_10x10_poly <- merge(utm10, utm_bio9_10x10_df, by = 'UTMCODE')
bio9_10x10_raster <- raster()
extent(bio9_10x10_raster) <- extent(bio9_10x10_poly)
bio9_10x10_raster <- rasterize(bio9_10x10_poly, bio9_10x10_raster, field ="bio9_10x10")
plot(bio9_10x10_raster)
#
bio10_10x10 <- exactextractr::exact_extract(b10, utm10, 'mean')
utm_bio10_10x10_df <- data.frame(utm = utm10$UTMCODE, bio10_10x10)
names(utm_bio10_10x10_df)[1] <- "UTMCODE"
bio10_10x10_poly <- merge(utm10, utm_bio10_10x10_df, by = 'UTMCODE')
bio10_10x10_raster <- raster()
extent(bio10_10x10_raster) <- extent(bio10_10x10_poly)
bio10_10x10_raster <- rasterize(bio10_10x10_poly, bio10_10x10_raster, field ="bio10_10x10")
plot(bio10_10x10_raster)
#
bio11_10x10 <- exactextractr::exact_extract(b11, utm10, 'mean')
utm_bio11_10x10_df <- data.frame(utm = utm10$UTMCODE, bio11_10x10)
names(utm_bio11_10x10_df)[1] <- "UTMCODE"
bio11_10x10_poly <- merge(utm10, utm_bio11_10x10_df, by = 'UTMCODE')
bio11_10x10_raster <- raster()
extent(bio11_10x10_raster) <- extent(bio11_10x10_poly)
bio11_10x10_raster <- rasterize(bio11_10x10_poly, bio11_10x10_raster, field ="bio11_10x10")
plot(bio11_10x10_raster)
#
bio12_10x10 <- exactextractr::exact_extract(b12, utm10, 'mean')
utm_bio12_10x10_df <- data.frame(utm = utm10$UTMCODE, bio12_10x10)
names(utm_bio12_10x10_df)[1] <- "UTMCODE"
bio12_10x10_poly <- merge(utm10, utm_bio12_10x10_df, by = 'UTMCODE')
bio12_10x10_raster <- raster()
extent(bio12_10x10_raster) <- extent(bio12_10x10_poly)
bio12_10x10_raster <- rasterize(bio12_10x10_poly, bio12_10x10_raster, field ="bio12_10x10")
plot(bio12_10x10_raster)
#
bio13_10x10 <- exactextractr::exact_extract(b13, utm10, 'mean')
utm_bio13_10x10_df <- data.frame(utm = utm10$UTMCODE, bio13_10x10)
names(utm_bio13_10x10_df)[1] <- "UTMCODE"
bio13_10x10_poly <- merge(utm10, utm_bio13_10x10_df, by = 'UTMCODE')
bio13_10x10_raster <- raster()
extent(bio13_10x10_raster) <- extent(bio13_10x10_poly)
bio13_10x10_raster <- rasterize(bio13_10x10_poly, bio13_10x10_raster, field ="bio13_10x10")
plot(bio13_10x10_raster)
#
bio14_10x10 <- exactextractr::exact_extract(b14, utm10, 'mean')
utm_bio14_10x10_df <- data.frame(utm = utm10$UTMCODE, bio14_10x10)
names(utm_bio14_10x10_df)[1] <- "UTMCODE"
bio14_10x10_poly <- merge(utm10, utm_bio14_10x10_df, by = 'UTMCODE')
bio14_10x10_raster <- raster()
extent(bio14_10x10_raster) <- extent(bio14_10x10_poly)
bio14_10x10_raster <- rasterize(bio14_10x10_poly, bio14_10x10_raster, field ="bio14_10x10")
plot(bio14_10x10_raster)
#
bio15_10x10 <- exactextractr::exact_extract(b15, utm10, 'mean')
utm_bio15_10x10_df <- data.frame(utm = utm10$UTMCODE, bio15_10x10)
names(utm_bio15_10x10_df)[1] <- "UTMCODE"
bio15_10x10_poly <- merge(utm10, utm_bio15_10x10_df, by = 'UTMCODE')
bio15_10x10_raster <- raster()
extent(bio15_10x10_raster) <- extent(bio15_10x10_poly)
bio15_10x10_raster <- rasterize(bio15_10x10_poly, bio15_10x10_raster, field ="bio15_10x10")
plot(bio15_10x10_raster)
#
bio16_10x10 <- exactextractr::exact_extract(b16, utm10, 'mean')
utm_bio16_10x10_df <- data.frame(utm = utm10$UTMCODE, bio16_10x10)
names(utm_bio16_10x10_df)[1] <- "UTMCODE"
bio16_10x10_poly <- merge(utm10, utm_bio16_10x10_df, by = 'UTMCODE')
bio16_10x10_raster <- raster()
extent(bio16_10x10_raster) <- extent(bio16_10x10_poly)
bio16_10x10_raster <- rasterize(bio16_10x10_poly, bio16_10x10_raster, field ="bio16_10x10")
plot(bio16_10x10_raster)
#
bio17_10x10 <- exactextractr::exact_extract(b17, utm10, 'mean')
utm_bio17_10x10_df <- data.frame(utm = utm10$UTMCODE, bio17_10x10)
names(utm_bio17_10x10_df)[1] <- "UTMCODE"
bio17_10x10_poly <- merge(utm10, utm_bio17_10x10_df, by = 'UTMCODE')
bio17_10x10_raster <- raster()
extent(bio17_10x10_raster) <- extent(bio17_10x10_poly)
bio17_10x10_raster <- rasterize(bio17_10x10_poly, bio17_10x10_raster, field ="bio17_10x10")
plot(bio17_10x10_raster)
#
bio18_10x10 <- exactextractr::exact_extract(b18, utm10, 'mean')
utm_bio18_10x10_df <- data.frame(utm = utm10$UTMCODE, bio18_10x10)
names(utm_bio18_10x10_df)[1] <- "UTMCODE"
bio18_10x10_poly <- merge(utm10, utm_bio18_10x10_df, by = 'UTMCODE')
bio18_10x10_raster <- raster()
extent(bio18_10x10_raster) <- extent(bio18_10x10_poly)
bio18_10x10_raster <- rasterize(bio18_10x10_poly, bio18_10x10_raster, field ="bio18_10x10")
plot(bio18_10x10_raster)
#
bio19_10x10 <- exactextractr::exact_extract(b19, utm10, 'mean')
utm_bio19_10x10_df <- data.frame(utm = utm10$UTMCODE, bio19_10x10)
names(utm_bio19_10x10_df)[1] <- "UTMCODE"
bio19_10x10_poly <- merge(utm10, utm_bio19_10x10_df, by = 'UTMCODE')
bio19_10x10_raster <- raster()
extent(bio19_10x10_raster) <- extent(bio19_10x10_poly)
bio19_10x10_raster <- rasterize(bio19_10x10_poly, bio19_10x10_raster, field ="bio19_10x10")
plot(bio19_10x10_raster)
#ahm
ahm_10x10 <- exactextractr::exact_extract(ahm, utm10, 'mean')
utm_ahm_10x10_df <- data.frame(utm = utm10$UTMCODE, ahm_10x10)
names(utm_ahm_10x10_df)[1] <- "UTMCODE"
ahm_10x10_poly <- merge(utm10, utm_ahm_10x10_df, by = 'UTMCODE')
ahm_10x10_raster <- raster()
extent(ahm_10x10_raster) <- extent(ahm_10x10_poly)
ahm_10x10_raster <- rasterize(ahm_10x10_poly, ahm_10x10_raster, field ="ahm_10x10")
plot(ahm_10x10_raster)
#shm
shm_10x10 <- exactextractr::exact_extract(shm, utm10, 'mean')
utm_shm_10x10_df <- data.frame(utm = utm10$UTMCODE, shm_10x10)
names(utm_shm_10x10_df)[1] <- "UTMCODE"
shm_10x10_poly <- merge(utm10, utm_shm_10x10_df, by = 'UTMCODE')
shm_10x10_raster <- raster()
extent(shm_10x10_raster) <- extent(shm_10x10_poly)
shm_10x10_raster <- rasterize(shm_10x10_poly, shm_10x10_raster, field ="shm_10x10")
plot(shm_10x10_raster)
#nffd
nffd_10x10 <- exactextractr::exact_extract(nffd, utm10, 'mean')
utm_nffd_10x10_df <- data.frame(utm = utm10$UTMCODE, nffd_10x10)
names(utm_nffd_10x10_df)[1] <- "UTMCODE"
nffd_10x10_poly <- merge(utm10, utm_nffd_10x10_df, by = 'UTMCODE')
nffd_10x10_raster <- raster()
extent(nffd_10x10_raster) <- extent(nffd_10x10_poly)
nffd_10x10_raster <- rasterize(nffd_10x10_poly, nffd_10x10_raster, field ="nffd_10x10")
plot(nffd_10x10_raster)
#eref
eref_10x10 <- exactextractr::exact_extract(eref, utm10, 'mean')
utm_eref_10x10_df <- data.frame(utm = utm10$UTMCODE, eref_10x10)
names(utm_eref_10x10_df)[1] <- "UTMCODE"
eref_10x10_poly <- merge(utm10, utm_eref_10x10_df, by = 'UTMCODE')
eref_10x10_raster <- raster()
extent(eref_10x10_raster) <- extent(eref_10x10_poly)
eref_10x10_raster <- rasterize(eref_10x10_poly, eref_10x10_raster, field ="eref_10x10")
plot(eref_10x10_raster)
#pH
ph_10x10 <- exactextractr::exact_extract(pH, utm10, 'mean')
utm_ph_10x10_df <- data.frame(utm = utm10$UTMCODE, ph_10x10)
names(utm_ph_10x10_df)[1] <- "UTMCODE"
ph_10x10_poly <- merge(utm10, utm_ph_10x10_df, by = 'UTMCODE')
ph_10x10_raster <- raster()
extent(ph_10x10_raster) <- extent(ph_10x10_poly)
ph_10x10_raster <- rasterize(ph_10x10_poly, ph_10x10_raster, field ="ph_10x10")
plot(ph_10x10_raster)


# 3.Create stack of variables 
preds_10x10 <- stack(
               bio1_10x10_raster,
               bio2_10x10_raster,
               bio3_10x10_raster,
               bio4_10x10_raster,
               bio5_10x10_raster,
               bio6_10x10_raster,
               bio7_10x10_raster,
               bio8_10x10_raster,
               bio9_10x10_raster,
               bio10_10x10_raster,
               bio11_10x10_raster,
               bio12_10x10_raster,
               bio13_10x10_raster,
               bio14_10x10_raster,
               bio15_10x10_raster,
               bio16_10x10_raster,
               bio17_10x10_raster,
               bio18_10x10_raster,
               bio19_10x10_raster,
               ahm_10x10_raster,
               shm_10x10_raster,
               nffd_10x10_raster,
               eref_10x10_raster,
               ph_10x10_raster
               )

names(preds_10x10) <- c("bio1","bio2","bio3","bio4","bio5","bio6","bio7","bio8","bio9",
                  "bio10","bio11","bio12","bio13","bio14","bio15","bio16","bio17",
                  "bio18","bio19","ahm", "shm", "nffd", "eref","pH"
                  )


#Clean
rm(
  bio1_10x10_raster,
  bio2_10x10_raster,
  bio3_10x10_raster,
  bio4_10x10_raster,
  bio5_10x10_raster,
  bio6_10x10_raster,
  bio7_10x10_raster,
  bio8_10x10_raster,
  bio9_10x10_raster,
  bio10_10x10_raster,
  bio11_10x10_raster,
  bio12_10x10_raster,
  bio13_10x10_raster,
  bio14_10x10_raster,
  bio15_10x10_raster,
  bio16_10x10_raster,
  bio17_10x10_raster,
  bio18_10x10_raster,
  bio19_10x10_raster,
  ahm_10x10_raster,
  shm_10x10_raster,
  nffd_10x10_raster,
  eref_10x10_raster,
  ph_10x10_raster
)


# 4.Load species presence
olive_D <- raster::shapefile("species/olive_domestic_wgs84.shp")

#VIF (no need to run this again, just keep those that we had in the first version)
#vif1 <- usdm::vifstep(preds_10x10)#stepwise elimination of highly inflating variables
#usdm::vifcor(preds_10x10)
#vif1@results

#Using VIF to select the variables to consider in the model (no need to run again
#preds2 <- usdm::exclude(preds_10x10, vif1)

#Keep the one from the first time I ran the VIF function (those actually in the manuscript)

keep_these <- c("bio2", "bio3", "bio8", "bio9", "bio18", "bio19", "nffd", 
                "ahm", "pH", "shm")

preds2 <- preds_10x10[[keep_these]]

#Add columns for species occurrence (column with value 1)
occ <- rep(1,nrow(olive_D@data))
olive_D@data <- cbind(olive_D@data, occ)


#Simplify the argument table
olive_D <- olive_D[,-c(1,2)]

#

# 5.Format data
data_olive_D <- sdmData(train=olive_D, predictors=preds2, bg=list(n=1000,method='gRandom',remove=TRUE))

#Save
write.sdm(data_olive_D, "data_olive_D")
