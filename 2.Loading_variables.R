
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

#soil pH
pH <- raster("D:/MOVING/SOILS/SOIL_Ph/ph_wgs84.tif")
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

#Clean environment
#current
rm(b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,
   b18,b19,ahm,shm,nffd,eref,pH)


###########################################################
########################## FUTURE ######################### 
###########################################################
#2050
#Load variables from https://worldclim.org/data/cmip5_30s.html

#ACCESS1-0 (AC)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
AC_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(AC_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
AC_vars <- resample(AC_vars, b1, method="bilinear")
AC_vars <- crop(AC_vars, study_site)
AC_vars <- mask(AC_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#BCC-CSM1-1 (BC)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
BC_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(BC_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
BC_vars <- resample(BC_vars, b1, method="bilinear")
BC_vars <- crop(BC_vars, study_site)
BC_vars <- mask(BC_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#CCSM4 (CC)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
CC_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(CC_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
CC_vars <- resample(CC_vars, b1, method="bilinear")
CC_vars <- crop(CC_vars, study_site)
CC_vars <- mask(CC_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#CNRM-CM5 (CN)	
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
CN_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(CN_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
CN_vars <- resample(CN_vars, b1, method="bilinear")
CN_vars <- crop(CN_vars, study_site)
CN_vars <- mask(CN_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#GFDL-CM3	(GF)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
GF_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(GF_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
GF_vars <- resample(GF_vars, b1, method="bilinear")
GF_vars <- crop(GF_vars, study_site)
GF_vars <- mask(GF_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#GISS-E2-R	(GS)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
GS_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(GS_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
GS_vars <- resample(GS_vars, b1, method="bilinear")
GS_vars <- crop(GS_vars, study_site)
GS_vars <- mask(GS_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#HadGEM2-AO	(HD)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
HD_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(HD_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
HD_vars <- resample(HD_vars, b1, method="bilinear")
HD_vars <- crop(HD_vars, study_site)
HD_vars <- mask(HD_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#HadGEM2-CC	(HG)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
HG_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(HG_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
HG_vars <- resample(HG_vars, b1, method="bilinear")
HG_vars <- crop(HG_vars, study_site)
HG_vars <- mask(HG_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#HadGEM2-ES	(HE)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
HE_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(HE_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
HE_vars <- resample(HE_vars, b1, method="bilinear")
HE_vars <- crop(HE_vars, study_site)
HE_vars <- mask(HE_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#INMCM4 (IN)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
IN_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(IN_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
IN_vars <- resample(IN_vars, b1, method="bilinear")
IN_vars <- crop(IN_vars, study_site)
IN_vars <- mask(IN_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#IPSL-CM5A-LR	(IP)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
IP_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(IP_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
IP_vars <- resample(IP_vars, b1, method="bilinear")
IP_vars <- crop(IP_vars, study_site)
IP_vars <- mask(IP_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#MIROC-ESM-CHEM (MI)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
MI_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(MI_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
MI_vars <- resample(MI_vars, b1, method="bilinear")
MI_vars <- crop(MI_vars, study_site)
MI_vars <- mask(MI_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#MIROC-ESM (MR)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
MR_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(MR_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
MR_vars <- resample(MR_vars, b1, method="bilinear")
MR_vars <- crop(MR_vars, study_site)
MR_vars <- mask(MR_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#MIROC5 (MC)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
MC_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(MC_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
MC_vars <- resample(MC_vars, b1, method="bilinear")
MC_vars <- crop(MC_vars, study_site)
MC_vars <- mask(MC_vars, study_site)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)


#MPI-ESM-LR	(MP)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
MP_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(MP_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
MP_vars <- resample(MP_vars, b1, method="bilinear")
MP_vars <- crop(MP_vars, study_site)
MP_vars <- mask(MP_vars)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#MRI-CGCM3	(MG)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
MG_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(MG_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
MG_vars <- resample(MG_vars, b1, method="bilinear")
MG_vars <- crop(MG_vars, study_site)
MG_vars <- mask(MG_vars)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

#NorESM1-M	(NO)
bio2 <- raster("")     
bio3 <- raster("")       
bio8 <- raster("")
bio9  <- raster("")     
bio18  <- raster("")     
bio19  <- raster("")       
ahm  <- raster("")      
shm <- raster("")      
nffd <- raster("")      
pH <- raster("")

#Create high resolution raster stack
NO_vars <- stack( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)
names(NO_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19","ahm", "shm", "nffd", "pH")
NO_vars <- resample(NO_vars, b1, method="bilinear")
NO_vars <- crop(NO_vars, study_site)
NO_vars <- mask(NO_vars)
#Clean
rm( bio2, bio3, bio8, bio9, bio18, bio19, ahm, shm, nffd, pH)

