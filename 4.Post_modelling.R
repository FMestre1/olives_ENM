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
library(forcats)
library(sdm)

#Load rasters
#MEAN
ensemble_olive_D <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_current.img")
#ensemble_olive_D_2050_MEAN_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_MEAN_45.tif")
#ensemble_olive_D_2050_MEAN_85 <- raster("C:\\Users\\asus\\Documents\\0. Artigos\\4. SUBMETIDOS\\Oliveiras_SDM\\june_results\\ensembles\\ensemble_olive_D_2050_MEAN_85.tif")
#RCP45
ensemble_olive_D_2050_HE_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_HE_45.img")
ensemble_olive_D_2050_GF_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_GF_45.img")
ensemble_olive_D_2050_CC_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_CC_45.img")
ensemble_olive_D_2050_IN_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_IN_45.img")
ensemble_olive_D_2050_IP_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_IP_45.img")
ensemble_olive_D_2050_MP_45 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_MP_45.img")
#RCP84
ensemble_olive_D_2050_HE_85 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_HE_85.img") 
ensemble_olive_D_2050_GF_85 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_GF_85.img") 
ensemble_olive_D_2050_CC_85 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_CC_85.img")
ensemble_olive_D_2050_IN_85 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_IN_85.img")
ensemble_olive_D_2050_IP_85 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_IP_85.img")
ensemble_olive_D_2050_MP_85 <- raster("C:\\Users\\mestr\\Desktop\\ensembles\\ensemble_olive_D_2050_MP_85.img")

################################################################################
#             Fig S1 - Individual suitability for each GCM - RCP 4.5
################################################################################


################################################################################
#             Fig S2 - Individual suitability for each GCM - RCP 8.5
################################################################################


################################################################################
#                         Fig S3 - Variable Importance
################################################################################


#M_olive_D <- sdm::read.sdm("C:\\Users\\mestr\\Desktop\\datasets e modelo\\M_olive_D-001.rds")
#class(M_olive_D)
pdf("figS3_varim.pdf")
plot(getVarImp(M_olive_D),'auc')
dev.off()

################################################################################
#                         Fig S4 - Suitability Curves
################################################################################

sdm::rcurve(M_olive_D)

pdf("figS4_suitability_curves_1.pdf")
sdm::rcurve(M_olive_D, n = names(preds2)[1:5], mean=TRUE, smooth=TRUE)
#sdm::rcurve(M_olive_D, n = names(preds2)[6:10], mean=TRUE, smooth=TRUE)
dev.off()

pdf("figS4_suitability_curves_2.pdf")
#sdm::rcurve(M_olive_D, n = names(preds2)[1:5], mean=TRUE, smooth=TRUE)
sdm::rcurve(M_olive_D, n = names(preds2)[6:10], mean=TRUE, smooth=TRUE)
dev.off()

################################################################################
#                      Figs xx to xx - Suitability
################################################################################

dop <- raster::shapefile("C:/Users/asus/Documents/0. Artigos/4. SUBMETIDOS/Oliveiras_SDM/shapes/dop2_sem_mallorca.shp")

#Palette
colours_RYB <- colorRampPalette(c("white" ,"darkolivegreen1","darkolivegreen2","darkolivegreen"))
myTheme <- rasterVis::rasterTheme(region = colours_RYB(100))

my.at <- seq(0, 1, 0.01)
rasterVis::levelplot(ensemble_olive_D, at=my.at, margin = list(FUN = 'median'), contour=FALSE, par.settings = myTheme)
rasterVis::levelplot(ensemble_olive_D_2050_MEAN_45, at=my.at, margin = list(FUN = 'median'), contour=FALSE, par.settings = myTheme)
rasterVis::levelplot(ensemble_olive_D_2050_MEAN_85, at=my.at, margin = list(FUN = 'median'), contour=FALSE, par.settings = myTheme)

################################################################################
#                   Figs xx and xx - Suitability differences
################################################################################

#Changes in suitability (maps) - Figure 2 and suplementary
delta_rcp45 <- ensemble_olive_D_2050_MEAN_45 - ensemble_olive_D
delta_rcp85 <- ensemble_olive_D_2050_MEAN_85 - ensemble_olive_D

my.at2 <- seq(-1, 1, 0.1)
colours_RYB_delta <- colorRampPalette(c("red" ,"white","green"))
myTheme2 <- rasterVis::rasterTheme(region = colours_RYB_delta(100))
#Fig2
rasterVis::levelplot(delta_rcp45, margin = NA, at = my.at2, contour=FALSE, par.settings = myTheme2, main = "Suitability difference with RCP4.5")
#Supplementary
rasterVis::levelplot(delta_rcp85, margin = NA, at = my.at2, contour=FALSE, par.settings = myTheme2, main = "Suitability difference with RCP8.5")

################################################################################
#                       Fig 3 - DOP Suitability
################################################################################

dop <- raster::shapefile("C:/Users/mestr/Documents/0. Artigos/4. SUBMETIDOS/Oliveiras_SDM/shapes/dop2_sem_mallorca.shp")
dop@data

#Load rasters
ensemble_olive_D <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensemble_olive_D_current.img")

#RCP45
ensemble_olive_D_2050_HE_45 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_HE_45.img")
ensemble_olive_D_2050_GF_45 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_GF_45.img")
ensemble_olive_D_2050_CC_45 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_CC_45.img")
ensemble_olive_D_2050_IN_45 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_IN_45.img")
ensemble_olive_D_2050_IP_45 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_IP_45.img")
ensemble_olive_D_2050_MP_45 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_MP_45.img")

#RCP84
ensemble_olive_D_2050_HE_85 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_HE_85.img") 
ensemble_olive_D_2050_GF_85 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_GF_85.img") 
ensemble_olive_D_2050_CC_85 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_CC_85.img")
ensemble_olive_D_2050_IN_85 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_IN_85.img")
ensemble_olive_D_2050_IP_85 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_IP_85.img")
ensemble_olive_D_2050_MP_85 <- raster("C:\\Users\\mestr\\Documents\\github\\olives_SDM\\ensembles\\ensemble_olive_D_2050_MP_85.img")

#rcp45 - mean
ensemble_olive_D_2050_MEAN_45 <- terra::mean(ensemble_olive_D_2050_HE_45,
                                             ensemble_olive_D_2050_GF_45,
                                             ensemble_olive_D_2050_CC_45,
                                             ensemble_olive_D_2050_IN_45,
                                             ensemble_olive_D_2050_IP_45,
                                             ensemble_olive_D_2050_MP_45
)

#rcp85 - mean
ensemble_olive_D_2050_MEAN_85 <- terra::mean(ensemble_olive_D_2050_HE_85,
                                             ensemble_olive_D_2050_GF_85,
                                             ensemble_olive_D_2050_CC_85,
                                             ensemble_olive_D_2050_IN_85,
                                             ensemble_olive_D_2050_IP_85,
                                             ensemble_olive_D_2050_MP_85
)

current_DOP_current_SUIT <- raster::extract(ensemble_olive_D, dop)
current_DOP_future_SUIT_45 <- raster::extract(ensemble_olive_D_2050_MEAN_45, dop)
current_DOP_future_SUIT_85 <- raster::extract(ensemble_olive_D_2050_MEAN_85, dop)
#
codes <- dop@data$number
names <- dop@data$NAME_0

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
names(all_suits)
str(all_suits)
head(all_suits)

all_suits$DOP <- as.factor(all_suits$DOP)

pdf("figSx_suitability_boxplot.pdf", height = 150, width = 50)
ggplot(all_suits, aes(fct_reorder(DOP, suitability), suitability, fill=factor(scenario))) +
  geom_boxplot(outlier.colour = "lightgrey", outlier.size = 0.5) +   
  coord_flip() +
  scale_fill_brewer(palette="Greens") + 
  ggtitle("PDO suitability in each scenario") +
  xlab("PDO") + ylab("Climatic suitability") +
  theme(axis.text = element_text(size = 40), legend.text = element_text(size = 60), legend.title = element_text(size = 60))      
dev.off()

### Second version (without the RCP 8.5) ###

dop <- raster::shapefile("C:/Users/mestr/Documents/0. Artigos/4. SUBMETIDOS/Oliveiras_SDM/shapes/dop2_sem_mallorca.shp")

dop@data
current_DOP_current_SUIT <- raster::extract(ensemble_olive_D, dop)
current_DOP_future_SUIT_45 <- raster::extract(ensemble_olive_D_2050_MEAN_45, dop)

codes <- dop@data$number
names <- dop@data$NAME_0

names(current_DOP_current_SUIT) <- codes
names(current_DOP_future_SUIT_45) <- codes

current_DOP_current_SUIT_DF <- data.frame()
current_DOP_future_SUIT_45_DF <- data.frame()

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

current_DOP_current_SUIT_DF <- cbind(current_DOP_current_SUIT_DF, rep("current", nrow(current_DOP_current_SUIT_DF)))
names(current_DOP_current_SUIT_DF)[3] <- "scenario"
names(current_DOP_current_SUIT_DF)[1] <- "suitability"
names(current_DOP_current_SUIT_DF)[2] <- "DOP"
#View(current_DOP_current_SUIT_DF)

current_DOP_future_SUIT_45_DF <- cbind(current_DOP_future_SUIT_45_DF, rep("rcp4.5", nrow(current_DOP_future_SUIT_45_DF)))
names(current_DOP_future_SUIT_45_DF)[3] <- "scenario"
names(current_DOP_future_SUIT_45_DF)[1] <- "suitability"
names(current_DOP_future_SUIT_45_DF)[2] <- "DOP"
#View(current_DOP_future_SUIT_45_DF)

all_suits <- rbind(current_DOP_current_SUIT_DF, current_DOP_future_SUIT_45_DF)
names(all_suits)
str(all_suits)

all_suits$DOP <- as.factor(all_suits$DOP)

pdf("fig3_suitability_boxplot.pdf")
#tiff("fig3_suitability_boxplot.tif", width = 4000, height = 6500, res = 600)
ggplot(all_suits, aes(fct_reorder(DOP, suitability), suitability, fill=factor(scenario))) +
  geom_boxplot(outlier.colour = "lightgrey", outlier.size = 0.5) +   
  coord_flip() +
  scale_fill_brewer(palette="Greens") + 
  ggtitle("PDO suitability in each scenario") +
  xlab("PDO") + ylab("Climatic suitability")
dev.off()
