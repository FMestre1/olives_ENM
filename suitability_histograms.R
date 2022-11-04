################################################################################
#                            SUITABILITY HISTOGRAMS
################################################################################
#FMestre
#04-11-2022

library(raster)
library(ggplot2)

suit_current <- raster::raster("C:/Users/FMest/Documents/0. Artigos/Oliveiras_SDM/first_output/ensemble_olive_D_current.img")#current suitability
suit_rcp45 <- raster::raster("C:/Users/FMest/Documents/0. Artigos/Oliveiras_SDM/first_output/ensemble_olive_D_2050_MEAN_45.tif")#future suitability RCP45
suit_rcp85 <- raster::raster("C:/Users/FMest/Documents/0. Artigos/Oliveiras_SDM/first_output/ensemble_olive_D_2050_MEAN_85.tif")#future suitability RCP85
#########################################
current_DOP <- raster::shapefile("C:/Users/FMest/Documents/0. Artigos/Oliveiras_SDM/shapes_DOP/dopcomnumeracao/dop_azeite_PI.shp")#current DOP
RCP45_DOP <- raster::shapefile("C:/Users/FMest/Documents/0. Artigos/Oliveiras_SDM/shapes_DOP/agregated_future_dop_RCP45.shp")#future DOP RCP45
RCP85_DOP <- raster::shapefile("C:/Users/FMest/Documents/0. Artigos/Oliveiras_SDM/shapes_DOP/agregated_future_dop_RCP85.shp")#future DOP RCP85
#
plot(suit_current)
plot(suit_rcp45)
plot(suit_rcp85)
#
plot(suit_current)
plot(current_DOP, add=TRUE)
#
plot(suit_rcp45)
plot(RCP45_DOP, add=TRUE)
#
plot(suit_rcp85)
plot(RCP85_DOP, add=TRUE)
#########################################
#Extract values

#RCP45
current_DOP_current_SUIT <- raster::extract(suit_current, current_DOP)
current_DOP_future_SUIT_45 <- raster::extract(suit_rcp45, current_DOP)
future_DOP_future_SUIT_45 <- raster::extract(suit_rcp45, RCP45_DOP)
#
current_DOP_current_SUIT_2 <- unlist(current_DOP_current_SUIT)
current_DOP_current_SUIT_3 <- data.frame(rep("current_DOP_current_SUIT", length(current_DOP_current_SUIT_2)), current_DOP_current_SUIT_2)
names(current_DOP_current_SUIT_3) <- c("combination", "suitability")
#
current_DOP_future_SUIT_45_2 <- unlist(current_DOP_future_SUIT_45)
current_DOP_future_SUIT_45_3 <- data.frame(rep("current_DOP_future_SUIT_45", length(current_DOP_future_SUIT_45_2)), current_DOP_future_SUIT_45_2)
names(current_DOP_future_SUIT_45_3) <- c("combination", "suitability")
#
future_DOP_future_SUIT_45_2 <- unlist(future_DOP_future_SUIT_45)
future_DOP_future_SUIT_45_3 <- data.frame(rep("future_DOP_future_SUIT_45", length(future_DOP_future_SUIT_45_2)), future_DOP_future_SUIT_45_2)
names(future_DOP_future_SUIT_45_3) <- c("combination", "suitability")
#
hist_data_45 <- rbind(current_DOP_current_SUIT_3, current_DOP_future_SUIT_45_3, future_DOP_future_SUIT_45_3)
#
boxplot(hist_data_45$suitability ~ hist_data_45$combination, names = c("current DOP - current suitability", 
                                                                       "current DOP - future suitability", 
                                                                       "future DOP - future suitability"))

ggplot(hist_data_45, aes(x = combination, y = suitability, fill = combination)) +
  geom_boxplot(outlier.colour = "lightgrey") +
  labs(
    title = "Relation between suitability and DOP location - RCP4.5",
    x = "Suitability-DOP",
    y = "Suitability"
  ) + 
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "YePu")

###################

#RCP85
#current_DOP_current_SUIT <- raster::extract(suit_current, current_DOP)
current_DOP_future_SUIT_85 <- raster::extract(suit_rcp85, current_DOP)
future_DOP_future_SUIT_85 <- raster::extract(suit_rcp85, RCP45_DOP)
#
#current_DOP_current_SUIT_2 <- unlist(current_DOP_current_SUIT)
#current_DOP_current_SUIT_3 <- data.frame(rep("current_DOP_current_SUIT", length(current_DOP_current_SUIT_2)), current_DOP_current_SUIT_2)
#names(current_DOP_current_SUIT_3) <- c("combination", "suitability")
#
current_DOP_future_SUIT_85_2 <- unlist(current_DOP_future_SUIT_85)
current_DOP_future_SUIT_85_3 <- data.frame(rep("current_DOP_future_SUIT_85", length(current_DOP_future_SUIT_85_2)), current_DOP_future_SUIT_85_2)
names(current_DOP_future_SUIT_85_3) <- c("combination", "suitability")
#
future_DOP_future_SUIT_85_2 <- unlist(future_DOP_future_SUIT_85)
future_DOP_future_SUIT_85_3 <- data.frame(rep("future_DOP_future_SUIT_85", length(future_DOP_future_SUIT_85_2)), future_DOP_future_SUIT_85_2)
names(future_DOP_future_SUIT_85_3) <- c("combination", "suitability")
#
hist_data_85 <- rbind(current_DOP_current_SUIT_3, current_DOP_future_SUIT_85_3, future_DOP_future_SUIT_85_3)
#
boxplot(hist_data_45$suitability ~ hist_data_45$combination, names = c("current DOP - current suitability", 
                                                                       "current DOP - future suitability", 
                                                                       "future DOP - future suitability"))

ggplot(hist_data_85, aes(x = combination, y = suitability, fill = combination)) +
  geom_boxplot(outlier.colour = "lightgrey") +
  labs(
    title = "Relation between suitability and DOP location - RCP8.5",
    x = "Suitability-DOP",
    y = "Suitability"
  ) + 
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "YePu")
