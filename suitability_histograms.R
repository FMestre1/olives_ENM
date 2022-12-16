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
hist_data_45 <- rbind(current_DOP_current_SUIT_3, current_DOP_future_SUIT_45_3)
#
boxplot(hist_data_45$suitability ~ hist_data_45$combination, names = c("current DOP - current suitability", 
                                                                       "current DOP - future suitability")
                                                                        )

ggplot(hist_data_45, aes(x = combination, y = suitability, fill = combination)) +
  geom_boxplot(outlier.shape = NA) +
  labs(
    title = "Relation between suitability and DOP location - RCP4.5",
    x = "DOP",
    y = "Suitability"
  ) + 
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "Greens") +
  coord_cartesian(ylim = quantile(hist_data_45$suitability, c(0.07, 0.999), na.rm = TRUE))

###################

#RCP85
current_DOP_current_SUIT <- raster::extract(suit_current, current_DOP)
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
hist_data_85 <- rbind(current_DOP_current_SUIT_3, current_DOP_future_SUIT_85_3)
#
boxplot(hist_data_45$suitability ~ hist_data_45$combination, names = c("current DOP - current suitability", 
                                                                       "current DOP - future suitability") 
                                                                       )

gg2 <- ggplot(hist_data_85, aes(x = combination, y = suitability, fill = combination)) +
  geom_boxplot(outlier.shape = NA) +
  labs(
    title = "Relation between suitability and DOP location - RCP8.5",
    x = "DOP",
    y = "Suitability"
  ) + 
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "Greens") +
  coord_cartesian(ylim = quantile(hist_data_45$suitability, c(0.07, 0.999), na.rm = TRUE))


################################################################################
#New boxplot with three boxes
#16-12-2022

#unique(current_future_both$combination)
hist_data_85_2 <- hist_data_85[hist_data_85$combination == "current_DOP_future_SUIT_85",]

current_future_both <- rbind(hist_data_45, hist_data_85_2)

current_future_both[current_future_both$combination == "current_DOP_current_SUIT",]$combination <- "current"
current_future_both[current_future_both$combination == "current_DOP_future_SUIT_45",]$combination <- "RCP 4.5"
current_future_both[current_future_both$combination == "current_DOP_future_SUIT_85",]$combination <- "RCP 8.5"

ggplot(current_future_both, aes(x = combination, y = suitability, fill = combination)) +
  geom_boxplot(outlier.shape = NA) +
  labs(
    title = "Relation between suitability and PDO location",
    x = "Scenario",
    y = "Suitability"
  ) + 
  theme(legend.position = "none") +
  scale_fill_brewer(palette = "Greens") +
  coord_cartesian(ylim = quantile(current_future_both$suitability, c(0.07, 0.999), na.rm = TRUE))


################################################################################
#                              DOP vs Suitability
################################################################################

length(current_DOP_current_SUIT)
length(current_DOP_future_SUIT_45)
length(current_DOP_future_SUIT_85)

codes <- current_DOP@data$ID
names <- current_DOP@data$NAME_0

#write.csv(data.frame(codes,names), "names_code.csv", row.names=FALSE)

names(current_DOP_current_SUIT) <- codes
names(current_DOP_future_SUIT_45) <- codes
names(current_DOP_future_SUIT_85) <- codes

current_DOP_current_SUIT_DF <- data.frame()
current_DOP_future_SUIT_45_DF <- data.frame()
current_DOP_future_SUIT_85_DF <- data.frame()

for(i in 1:length(current_DOP_current_SUIT)){
  
  vect1 <- current_DOP_current_SUIT[[i]]
  names1 <- rep(paste0("PDO_", names(current_DOP_current_SUIT[i])), length(vect1))
  current_DOP_current_SUIT_DF <- rbind(current_DOP_current_SUIT_DF, data.frame(vect1, names1))
  
  }

for(i in 1:length(current_DOP_future_SUIT_45)){
  
  vect2 <- current_DOP_future_SUIT_45[[i]]
  names2 <- rep(paste0("PDO_", names(current_DOP_future_SUIT_45[i])), length(vect2))
  current_DOP_future_SUIT_45_DF <- rbind(current_DOP_future_SUIT_45_DF, data.frame(vect2, names2))
  
}

for(i in 1:length(current_DOP_future_SUIT_85)){
  
  vect3 <- current_DOP_future_SUIT_85[[i]]
  names3 <- rep(paste0("PDO_", names(current_DOP_future_SUIT_85[i])), length(vect3))
  current_DOP_future_SUIT_85_DF <- rbind(current_DOP_future_SUIT_85_DF, data.frame(vect3, names3))
  
}

current_DOP_current_SUIT_DF <- cbind(current_DOP_current_SUIT_DF, rep("current", nrow(current_DOP_current_SUIT_DF)))
names(current_DOP_current_SUIT_DF)[3] <- "scenario"
names(current_DOP_current_SUIT_DF)[1] <- "suitability"
names(current_DOP_current_SUIT_DF)[2] <- "DOP"

current_DOP_future_SUIT_45_DF <- cbind(current_DOP_future_SUIT_45_DF, rep("rcp4.5", nrow(current_DOP_future_SUIT_45_DF)))
names(current_DOP_future_SUIT_45_DF)[3] <- "scenario"
names(current_DOP_future_SUIT_45_DF)[1] <- "suitability"
names(current_DOP_future_SUIT_45_DF)[2] <- "DOP"

current_DOP_future_SUIT_85_DF <- cbind(current_DOP_future_SUIT_85_DF, rep("rcp8.5", nrow(current_DOP_future_SUIT_85_DF)))
names(current_DOP_future_SUIT_85_DF)[3] <- "scenario"
names(current_DOP_future_SUIT_85_DF)[1] <- "suitability"
names(current_DOP_future_SUIT_85_DF)[2] <- "DOP"

all_suits <- rbind(current_DOP_current_SUIT_DF, current_DOP_future_SUIT_45_DF, current_DOP_future_SUIT_85_DF)

save(all_suits, file = "all_suits.RData")

library(ggplot2)

ggplot(all_suits, aes(DOP, suitability, fill=factor(scenario))) +
  geom_boxplot(outlier.colour = "lightgrey", outlier.size = 0.5) +   coord_flip() +
  scale_fill_brewer(palette="Greens")

library(forcats)

ggplot(all_suits, aes(fct_reorder(DOP, suitability), suitability, fill=factor(scenario))) +
  geom_boxplot(outlier.colour = "lightgrey", outlier.size = 0.5) +   coord_flip() +
  scale_fill_brewer("Scenario", palette="Greens") + 
  ggtitle("PDO suitability in each scenario") +
  xlab("PDO") + ylab("Climatic suitability")

#saved in 1000 x 1000

################################################################################
#Plot and create difference rasters

#suit_current
#suit_rcp45
#suit_rcp85

diff_rcp85 <- (suit_rcp85 - suit_current)
diff_rcp45 <- (suit_rcp45 - suit_current)

raster::writeRaster(diff_rcp85)

writeRaster(diff_rcp45, filename="diff_rcp45.tif", format="GTiff", overwrite=TRUE)
writeRaster(diff_rcp85, filename="diff_rcp85.tif", format="GTiff", overwrite=TRUE)

#Load & Save
save.image("olives_sdm.RData")
load("olives_sdm.RData")

