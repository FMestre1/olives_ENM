######## SDM Olives + Vines ######## 
#FMestre
#30/07/2021

#Load required packages
library(sdm)
library(usdm)
#installAll()
library(raster)
#library(rgdal)
#library(maptools)
#library(rgeos)

#Check these sources
#https://www.worldclim.org/data/worldclim21.html - Worldclim - solar radiation
#https://figshare.com/articles/dataset/Global_Aridity_Index_and_Potential_Evapotranspiration_ET0_Climate_Database_v2/7504448/3
#Above: Global Aridity Index and Potential Evapotranspiration (ET0) Climate Database v2

#Study site
study_site <- raster::shapefile("C:/fw_space/PIberica2.shp")
#raster::plot(study_site)

#Load bioclimatic 10x10 km to calibrate ############################
bio1 <- raster("D:/Doc/Rasters_PI_geotif/bio1.tif")
bio2 <- raster("D:/Doc/Rasters_PI_geotif/bio2.tif")
bio3 <- raster("D:/Doc/Rasters_PI_geotif/bio3.tif")
bio4 <- raster("D:/Doc/Rasters_PI_geotif/bio4.tif")
bio5 <- raster("D:/Doc/Rasters_PI_geotif/bio5.tif")
bio6 <- raster("D:/Doc/Rasters_PI_geotif/bio6.tif")
bio7 <- raster("D:/Doc/Rasters_PI_geotif/bio7.tif")
bio8 <- raster("D:/Doc/Rasters_PI_geotif/bio8.tif")
bio9 <- raster("D:/Doc/Rasters_PI_geotif/bio9.tif")
bio10 <- raster("D:/Doc/Rasters_PI_geotif/bio10.tif")
bio11 <- raster("D:/Doc/Rasters_PI_geotif/bio11.tif")
bio12 <- raster("D:/Doc/Rasters_PI_geotif/bio12.tif")
bio13 <- raster("D:/Doc/Rasters_PI_geotif/bio13.tif")
bio14 <- raster("D:/Doc/Rasters_PI_geotif/bio14.tif")
bio15 <- raster("D:/Doc/Rasters_PI_geotif/bio15.tif")
bio16 <- raster("D:/Doc/Rasters_PI_geotif/bio16.tif")
bio17 <- raster("D:/Doc/Rasters_PI_geotif/bio17.tif")
bio18 <- raster("D:/Doc/Rasters_PI_geotif/bio18.tif")
bio19 <- raster("D:/Doc/Rasters_PI_geotif/bio19.tif")
#
moisture_S <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/Dados/moisture_10x10.shp")
moisture_10X10 <- raster::rasterize(moisture_S, bio1, field = "moistureme")
ph_S <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/Dados/ph_10x10.shp")
ph_10X10 <- raster::rasterize(ph_S, bio1, field = "phmean")
#
ahm_S <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/Dados/ahm_10x10.shp")
ahm_10X10 <- raster::rasterize(ahm_S, bio1, field = "ahmmean")
shm_S <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/Dados/shm_10x10.shp")
shm_10X10 <- raster::rasterize(shm_S, bio1, field = "shmmean")
nffd_S <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/Dados/nffd_10x10.shp")
nffd_10X10 <- raster::rasterize(nffd_S, bio1, field = "nffdmean")
eref_S <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/Dados/eref_10x10.shp")
eref_10X10 <- raster::rasterize(eref_S, bio1, field = "erefmean")

#Create stack of variables tack 
preds <- stack(bio1,bio2,bio3,bio4,bio5,bio6,bio7,bio8,bio9,bio10,bio11,bio12,
               bio13,bio14,bio15,bio16,bio17,bio18,bio19,
               ahm_10X10,shm_10X10,nffd_10X10,eref_10X10,
               moisture_10X10,ph_10X10
               )
#names(preds)
#nlayers(preds)

names(preds) <- c("bio1","bio2","bio3","bio4","bio5","bio6","bio7","bio8","bio9",
                  "bio10","bio11","bio12","bio13","bio14","bio15","bio16","bio17",
                  "bio18","bio19",
                  "ahm", "shm", "nffd", "eref",
                  "moisture","ph"
                  )

#Load species presence
olive_W <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/olive_sylv_wgs84.shp")
olive_D <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/olive_domestic_wgs84.shp")
olive_WD <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/olive_ALL_wgs84.shp")
#
vine_W <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/vines_sylv_wgs84.shp")
vine_D <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/vines_domestic_wgs84.shp")
vine_WD <- raster::shapefile("C:/Users/Frederico/Documents/0. Artigos/Oliveiras_SDM/vines_ALL_wgs84.shp")

#VIF
vif1 <- usdm::vifstep(preds)#stepwise elimination of highly inflating variables
usdm::vifcor(preds)
vif1@results

#Using VIF to select the variables to consider in the model
preds2 <- usdm::exclude(preds, vif1)

#Format data
data_olive_W <- sdmData(train=olive_W, predictors=preds2, bg=nrow(olive_W@data),method='gRandom',remove=TRUE, filename = "data_olive_W")
data_olive_D <- sdmData(train=olive_D, predictors=preds2, bg=nrow(olive_D@data),method='gRandom',remove=TRUE, filename = "data_olive_D")
data_olive_WD <- sdmData(train=olive_WD, predictors=preds2, bg=nrow(olive_WD@data),method='gRandom',remove=TRUE, filename = "data_olive_WD")
#
data_vine_W <- sdmData(train=vine_W, predictors=preds2, bg=nrow(vine_W@data),method='gRandom',remove=TRUE, filename = "data_vine_W")
data_vine_D <- sdmData(train=vine_D, predictors=preds2, bg=nrow(vine_D@data),method='gRandom',remove=TRUE, filename = "data_vine_D")
data_vine_WD <- sdmData(train=vine_WD, predictors=preds2, bg=nrow(vine_WD@data),method='gRandom',remove=TRUE, filename = "data_vine_WD")