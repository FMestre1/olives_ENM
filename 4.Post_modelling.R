################################################################################
#                               POST MODELLING
################################################################################

#FMestre
#01/10/2021

#install.packages('rasterVis')
library("rasterVis")
library("raster")
library("ggplot2")
library("latticeExtra")

#Load rasters  #######################################
#MEAN
ensemble_olive_D <- raster("ensemble_olive_D_current.img")
ensemble_olive_D_2050_MEAN_45 <- raster("ensemble_olive_D_2050_MEAN_45.tif")
ensemble_olive_D_2050_MEAN_85 <- raster("ensemble_olive_D_2050_MEAN_85.tif")
#RCP45
ensemble_olive_D_2050_HE_45 <- raster("ensemble_olive_D_2050_HE_45.img")
ensemble_olive_D_2050_GF_45 <- raster("ensemble_olive_D_2050_GF_45.img")
ensemble_olive_D_2050_CC_45 <- raster("ensemble_olive_D_2050_CC_45.img")
ensemble_olive_D_2050_IN_45 <- raster("ensemble_olive_D_2050_IN_45.img")
ensemble_olive_D_2050_IP_45 <- raster("ensemble_olive_D_2050_IP_45.img")
ensemble_olive_D_2050_MP_45 <- raster("ensemble_olive_D_2050_MP_45.img")
#RCP84
ensemble_olive_D_2050_HE_85 <- raster("ensemble_olive_D_2050_HE_85.img") 
ensemble_olive_D_2050_GF_85 <- raster("ensemble_olive_D_2050_GF_85.img") 
ensemble_olive_D_2050_CC_85 <- raster("ensemble_olive_D_2050_CC_85.img")
ensemble_olive_D_2050_IN_85 <- raster("ensemble_olive_D_2050_IN_85.img")
ensemble_olive_D_2050_IP_85 <- raster("ensemble_olive_D_2050_IP_85.img")
ensemble_olive_D_2050_MP_85 <- raster("ensemble_olive_D_2050_MP_85.img")


######################################################

#Plot the average  ###################################
#FIG3

dop <- raster::shapefile("D:\\SDM_OLIVES\\shape\\dop_azeite_PI.shp")

#Palette
colours_RYB <- colorRampPalette(c("white" ,"darkolivegreen1","darkolivegreen2","darkolivegreen"))
myTheme <- rasterVis::rasterTheme(region = colours_RYB(100))

mean_stack <-raster::stack(ensemble_olive_D,
                           ensemble_olive_D_2050_MEAN_45,
                           ensemble_olive_D_2050_MEAN_85)


my.at <- seq(0, 1, 0.01)
rasterVis::levelplot(mean_stack, layers = 1, at=my.at, margin = list(FUN = 'median'), contour=FALSE, par.settings = myTheme)
rasterVis::levelplot(mean_stack, layers = 2, at=my.at, margin = list(FUN = 'median'), contour=FALSE, par.settings = myTheme)
rasterVis::levelplot(mean_stack, layers = 3, at=my.at, margin = list(FUN = 'median'), contour=FALSE, par.settings = myTheme)

#Changes in suitability
delta_rcp45 <- ensemble_olive_D_2050_MEAN_45 - ensemble_olive_D
delta_rcp85 <- ensemble_olive_D_2050_MEAN_85 - ensemble_olive_D

my.at2 <- seq(-1, 1, 0.1)
colours_RYB_delta <- colorRampPalette(c("red" ,"white","green"))
myTheme2 <- rasterVis::rasterTheme(region = colours_RYB_delta(100))
rasterVis::levelplot(delta_rcp45, margin = NA, at = my.at2, contour=FALSE, par.settings = myTheme2)
rasterVis::levelplot(delta_rcp85, margin = NA, at = my.at2, contour=FALSE, par.settings = myTheme2)
