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
data1 <- sdmData(train=olive_D, predictors=preds2, bg=nrow(olive_D@data),method='gRandom',remove=TRUE))
