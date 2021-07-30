#FMestre
#30/07/2021

#Load required packages
library(sdm)
#installAll()
library(raster)
#library(rgdal)
#library(maptools)
#library(rgeos)

#SDM Olives
#Vars from Arenas-Castro et al. (2020)
#soil pH (SLPH)(unitless); 
#slope (SLPC; %); 
#solar orientation (SLOR; degrees); 
#evapotranspiration (EVTP; mm/year);
#summer precipitation (PRSM; mm); 
#autumn precipitation (PRAU; mm), 
#average winter temperature (TPWT;°C) 
#continentality index (IDCT; °C).

#Check these sources
#https://sites.ualberta.ca/~ahamann/data/climateeu.html - ClimateEU - water deficit, continentality
#https://www.worldclim.org/data/worldclim21.html - Worldclim - solar radiation
#https://figshare.com/articles/dataset/Global_Aridity_Index_and_Potential_Evapotranspiration_ET0_Climate_Database_v2/7504448/3
#Above: Global Aridity Index and Potential Evapotranspiration (ET0) Climate Database v2

#Study site
study_site <- raster::shapefile("C:/fw_space/PIberica2.shp")
#raster::plot(study_site)

#Soil property variables

#Aridity

#Bioclimatic variables
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



preds <- stack()

#Load vars

#Load species presente
#olive_D <-
#Olive_W <-

#VIF
vif2 <- usdm::vifstep(preds)#stepwise elimination of highly inflating variables
usdm::vifcor(preds)
vif2@results

#Using the full result of the VIF
preds2 <- exclude(preds, vif2)

#Format data
data1 <- sdmData(train=olive_D, predictors=preds2, bg=nrow(olive_D@data),method='gRandom',remove=TRUE)
