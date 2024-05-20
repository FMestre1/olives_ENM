################################################################################
#                    LOADING OF VARIABLES FOR PROJECTION
################################################################################


###########################################################
######################### CURRENT ######################### 
###########################################################

# 8. Load the variables
#loaded before as high_res_preds

#Clean environment
#current
#rm(b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15,b16,b17,
#   b18,b19,ahm,shm,nffd,eref,pH)


###########################################################
########################## FUTURE ######################### 
###########################################################
#2050
#Load variables from https://worldclim.org/data/cmip5_30s.html
#https://sites.ualberta.ca/~ahamann/data/climateeu.html

######################## CCSM4 (CC) ########################
#system("unzip ./2050/CC/rcp45/cc45bi50.zip -d ./2050/CC/rcp45/")
#system("unzip ./2050/CC/rcp85/cc85bi50.zip -d ./2050/CC/rcp85/")

########## RCP45 ########## 
bio2_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi502.tif")     
bio3_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi503.tif")       
bio8_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi508.tif")
bio9_cc_45  <- raster("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi509.tif")     
bio18_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi5018.tif")     
bio19_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/cc45bi5019.tif")       
ahm_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/AHM.asc") 
shm_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/SHM.asc") 
nffd_cc_45 <- raster("D:/SDM_OLIVES/2050/CC/rcp45/NFFD.asc")      
#pH #Use allways the same pH raster
pH <- raster("D:/SDM_OLIVES/current_vars/ph_wgs84.tif")

#Reproject
ahm_cc_45 <- projectRaster(from = ahm_cc_45, to = bio19_cc_45, method="bilinear")
shm_cc_45 <- projectRaster(from = shm_cc_45, to = bio19_cc_45, method="bilinear")
nffd_cc_45 <- projectRaster(from = nffd_cc_45, to = bio19_cc_45, method="bilinear")

#Cut
pH <- resample(pH, bio2_cc_45, method="bilinear")
pH <- crop(pH, study_site)
pH <- mask(pH, study_site)
#
bio2_cc_45 <- crop(bio2_cc_45, study_site)
bio2_cc_45 <- mask(bio2_cc_45, study_site)
bio2_cc_45 <- bio2_cc_45/10
#
bio3_cc_45 <- crop(bio3_cc_45, study_site)
bio3_cc_45 <- mask(bio3_cc_45, study_site)
#
bio8_cc_45 <- crop(bio8_cc_45, study_site)
bio8_cc_45 <- mask(bio8_cc_45, study_site)
bio8_cc_45 <- bio8_cc_45/10
#
bio9_cc_45 <- crop(bio9_cc_45, study_site)
bio9_cc_45 <- mask(bio9_cc_45, study_site)
bio9_cc_45 <- bio9_cc_45/10
#
bio18_cc_45 <- crop(bio18_cc_45, study_site)
bio18_cc_45 <- mask(bio18_cc_45, study_site)
#
bio19_cc_45 <- crop(bio19_cc_45, study_site)
bio19_cc_45 <- mask(bio19_cc_45, study_site)
#
ahm_cc_45 <- crop(ahm_cc_45, study_site)
ahm_cc_45 <- mask(ahm_cc_45, study_site)
#
shm_cc_45 <- crop(shm_cc_45, study_site)
shm_cc_45 <- mask(shm_cc_45, study_site)
#
nffd_cc_45 <- crop(nffd_cc_45, study_site)
nffd_cc_45 <- mask(nffd_cc_45, study_site)


#Create raster stack
CC_rcp45_vars <- stack( bio2_cc_45, bio3_cc_45, bio8_cc_45, bio9_cc_45, 
                  bio18_cc_45, bio19_cc_45, ahm_cc_45, shm_cc_45, 
                  nffd_cc_45, pH)

names(CC_rcp45_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_cc_45, bio3_cc_45, bio8_cc_45, bio9_cc_45, bio18_cc_45, bio19_cc_45, ahm_cc_45, 
    shm_cc_45, nffd_cc_45)

########## RCP85 ########## 
#CC_rcp85_vars
bio2_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/cc85bi502.tif")     
bio3_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/cc85bi503.tif")       
bio8_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/cc85bi508.tif")
bio9_cc_85  <- raster("D:/SDM_OLIVES/2050/CC/rcp85/cc85bi509.tif")     
bio18_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/cc85bi5018.tif")     
bio19_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/cc85bi5019.tif")       
ahm_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/AHM.asc") 
shm_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/SHM.asc") 
nffd_cc_85 <- raster("D:/SDM_OLIVES/2050/CC/rcp85/NFFD.asc")      

#Reproject
ahm_cc_85 <- projectRaster(from = ahm_cc_85, to = bio19_cc_85, method="bilinear")
shm_cc_85 <- projectRaster(from = shm_cc_85, to = bio19_cc_85, method="bilinear")
nffd_cc_85 <- projectRaster(from = nffd_cc_85, to = bio19_cc_85, method="bilinear")

#Cut
bio2_cc_85 <- crop(bio2_cc_85, study_site)
bio2_cc_85 <- mask(bio2_cc_85, study_site)
bio2_cc_85 <- bio2_cc_85/10
#
bio3_cc_85 <- crop(bio3_cc_85, study_site)
bio3_cc_85 <- mask(bio3_cc_85, study_site)
#
bio8_cc_85 <- crop(bio8_cc_85, study_site)
bio8_cc_85 <- mask(bio8_cc_85, study_site)
bio8_cc_85 <- bio8_cc_85/10
#
bio9_cc_85 <- crop(bio9_cc_85, study_site)
bio9_cc_85 <- mask(bio9_cc_85, study_site)
bio9_cc_85 <- bio9_cc_85/10
#
bio18_cc_85 <- crop(bio18_cc_85, study_site)
bio18_cc_85 <- mask(bio18_cc_85, study_site)
#
bio19_cc_85 <- crop(bio19_cc_85, study_site)
bio19_cc_85 <- mask(bio19_cc_85, study_site)
#
ahm_cc_85 <- crop(ahm_cc_85, study_site)
ahm_cc_85 <- mask(ahm_cc_85, study_site)
#
shm_cc_85 <- crop(shm_cc_85, study_site)
shm_cc_85 <- mask(shm_cc_85, study_site)
#
nffd_cc_85 <- crop(nffd_cc_85, study_site)
nffd_cc_85 <- mask(nffd_cc_85, study_site)

#Create raster stack
CC_rcp85_vars <- stack( bio2_cc_85, bio3_cc_85, bio8_cc_85, bio9_cc_85, 
                        bio18_cc_85, bio19_cc_85, ahm_cc_85, shm_cc_85, 
                        nffd_cc_85, pH)
names(CC_rcp85_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_cc_85, bio3_cc_85, bio8_cc_85, bio9_cc_85, bio18_cc_85, bio19_cc_85, ahm_cc_85, 
    shm_cc_85, nffd_cc_85)


######################## CNRM-CM5 (CN) ######################## 
#CN_rcp45_vars
#CN_rcp85_vars
#system("unzip ./2050/CN/rcp45/cn45bi50.zip -d ./2050/CN/rcp45/")
#system("unzip ./2050/CN/rcp85/cn85bi50.zip -d ./2050/CN/rcp85/")

########## RCP45 ########## 
#AHM and SHM have problems!
########## RCP85 ########## 
#AHM and SHM have problems!

######################## GFDL-CM3	(GF) ######################## 

########## RCP45 ########## 
bio2_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/gf45bi502.tif")     
bio3_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/gf45bi503.tif")       
bio8_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/gf45bi508.tif")
bio9_gf_45  <- raster("D:/SDM_OLIVES/2050/GF/rcp45/gf45bi509.tif")     
bio18_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/gf45bi5018.tif")     
bio19_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/gf45bi5019.tif")       
ahm_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/AHM.asc") 
shm_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/SHM.asc") 
nffd_gf_45 <- raster("D:/SDM_OLIVES/2050/GF/rcp45/NFFD.asc")      

#Reproject
ahm_gf_45 <- projectRaster(from = ahm_gf_45, to = bio19_gf_45, method="bilinear")
shm_gf_45 <- projectRaster(from = shm_gf_45, to = bio19_gf_45, method="bilinear")
nffd_gf_45 <- projectRaster(from = nffd_gf_45, to = bio19_gf_45, method="bilinear")

#Cut
bio2_gf_45 <- crop(bio2_gf_45, study_site)
bio2_gf_45 <- mask(bio2_gf_45, study_site)
bio2_gf_45 <- bio2_gf_45/10
#
bio3_gf_45 <- crop(bio3_gf_45, study_site)
bio3_gf_45 <- mask(bio3_gf_45, study_site)
#
bio8_gf_45 <- crop(bio8_gf_45, study_site)
bio8_gf_45 <- mask(bio8_gf_45, study_site)
bio8_gf_45 <- bio8_gf_45/10
#
bio9_gf_45 <- crop(bio9_gf_45, study_site)
bio9_gf_45 <- mask(bio9_gf_45, study_site)
bio9_gf_45 <- bio9_gf_45/10
#
bio18_gf_45 <- crop(bio18_gf_45, study_site)
bio18_gf_45 <- mask(bio18_gf_45, study_site)
#
bio19_gf_45 <- crop(bio19_gf_45, study_site)
bio19_gf_45 <- mask(bio19_gf_45, study_site)
#
ahm_gf_45 <- crop(ahm_gf_45, study_site)
ahm_gf_45 <- mask(ahm_gf_45, study_site)
#
shm_gf_45 <- crop(shm_gf_45, study_site)
shm_gf_45 <- mask(shm_gf_45, study_site)
#
nffd_gf_45 <- crop(nffd_gf_45, study_site)
nffd_gf_45 <- mask(nffd_gf_45, study_site)

#Create raster stack
GF_rcp45_vars <- stack( bio2_gf_45, bio3_gf_45, bio8_gf_45, bio9_gf_45, 
                        bio18_gf_45, bio19_gf_45, ahm_gf_45, shm_gf_45, 
                        nffd_gf_45, pH)
names(GF_rcp45_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_gf_45, bio3_gf_45, bio8_gf_45, bio9_gf_45, bio18_gf_45, bio19_gf_45, ahm_gf_45, 
    shm_gf_45, nffd_gf_45)

########## RCP85 ########## 
bio2_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/gf85bi502.tif")     
bio3_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/gf85bi503.tif")       
bio8_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/gf85bi508.tif")
bio9_gf_85  <- raster("D:/SDM_OLIVES/2050/GF/rcp85/gf85bi509.tif")     
bio18_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/gf85bi5018.tif")     
bio19_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/gf85bi5019.tif")       
ahm_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/AHM.asc") 
shm_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/SHM.asc") 
nffd_gf_85 <- raster("D:/SDM_OLIVES/2050/GF/rcp85/NFFD.asc")      

#Reproject
ahm_gf_85 <- projectRaster(from = ahm_gf_85, to = bio19_gf_85, method="bilinear")
shm_gf_85 <- projectRaster(from = shm_gf_85, to = bio19_gf_85, method="bilinear")
nffd_gf_85 <- projectRaster(from = nffd_gf_85, to = bio19_gf_85, method="bilinear")

#Cut
bio2_gf_85 <- crop(bio2_gf_85, study_site)
bio2_gf_85 <- mask(bio2_gf_85, study_site)
bio2_gf_85 <- bio2_gf_85/10
#
bio3_gf_85 <- crop(bio3_gf_85, study_site)
bio3_gf_85 <- mask(bio3_gf_85, study_site)
#
bio8_gf_85 <- crop(bio8_gf_85, study_site)
bio8_gf_85 <- mask(bio8_gf_85, study_site)
bio8_gf_85 <- bio8_gf_85/10
#
bio9_gf_85 <- crop(bio9_gf_85, study_site)
bio9_gf_85 <- mask(bio9_gf_85, study_site)
bio9_gf_85 <- bio9_gf_85/10
#
bio18_gf_85 <- crop(bio18_gf_85, study_site)
bio18_gf_85 <- mask(bio18_gf_85, study_site)
#
bio19_gf_85 <- crop(bio19_gf_85, study_site)
bio19_gf_85 <- mask(bio19_gf_85, study_site)
#
ahm_gf_85 <- crop(ahm_gf_85, study_site)
ahm_gf_85 <- mask(ahm_gf_85, study_site)
#
shm_gf_85 <- crop(shm_gf_85, study_site)
shm_gf_85 <- mask(shm_gf_85, study_site)
#
nffd_gf_85 <- crop(nffd_gf_85, study_site)
nffd_gf_85 <- mask(nffd_gf_85, study_site)

#Create raster stack
GF_rcp85_vars <- stack( bio2_gf_85, bio3_gf_85, bio8_gf_85, bio9_gf_85, 
                        bio18_gf_85, bio19_gf_85, ahm_gf_85, shm_gf_85, 
                        nffd_gf_85, pH)
names(GF_rcp85_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_gf_85, bio3_gf_85, bio8_gf_85, bio9_gf_85, bio18_gf_85, bio19_gf_85, ahm_gf_85, 
    shm_gf_85, nffd_gf_85)

######################## HadGEM2-ES	(HE) ######################## 

########## RCP45 ########## 
bio2_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/he45bi502.tif")     
bio3_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/he45bi503.tif")       
bio8_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/he45bi508.tif")
bio9_he_45  <- raster("D:/SDM_OLIVES/2050/HE/rcp45/he45bi509.tif")     
bio18_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/he45bi5018.tif")     
bio19_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/he45bi5019.tif")       
ahm_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/AHM.asc") 
shm_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/SHM.asc") 
nffd_he_45 <- raster("D:/SDM_OLIVES/2050/HE/rcp45/NFFD.asc")      

#Reproject
ahm_he_45 <- projectRaster(from = ahm_he_45, to = bio19_he_45, method="bilinear")
shm_he_45 <- projectRaster(from = shm_he_45, to = bio19_he_45, method="bilinear")
nffd_he_45 <- projectRaster(from = nffd_he_45, to = bio19_he_45, method="bilinear")

#Cut
bio2_he_45 <- crop(bio2_he_45, study_site)
bio2_he_45 <- mask(bio2_he_45, study_site)
bio2_he_45 <- bio2_he_45/10
#
bio3_he_45 <- crop(bio3_he_45, study_site)
bio3_he_45 <- mask(bio3_he_45, study_site)
#
bio8_he_45 <- crop(bio8_he_45, study_site)
bio8_he_45 <- mask(bio8_he_45, study_site)
bio8_he_45 <- bio8_he_45/10
#
bio9_he_45 <- crop(bio9_he_45, study_site)
bio9_he_45 <- mask(bio9_he_45, study_site)
bio9_he_45 <- bio9_he_45/10
#
bio18_he_45 <- crop(bio18_he_45, study_site)
bio18_he_45 <- mask(bio18_he_45, study_site)
#
bio19_he_45 <- crop(bio19_he_45, study_site)
bio19_he_45 <- mask(bio19_he_45, study_site)
#
ahm_he_45 <- crop(ahm_he_45, study_site)
ahm_he_45 <- mask(ahm_he_45, study_site)
#
shm_he_45 <- crop(shm_he_45, study_site)
shm_he_45 <- mask(shm_he_45, study_site)
#
nffd_he_45 <- crop(nffd_he_45, study_site)
nffd_he_45 <- mask(nffd_he_45, study_site)

#Create raster stack
HE_rcp45_vars <- stack( bio2_he_45, bio3_he_45, bio8_he_45, bio9_he_45, 
                        bio18_he_45, bio19_he_45, ahm_he_45, shm_he_45, 
                        nffd_he_45, pH)
names(HE_rcp45_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_he_45, bio3_he_45, bio8_he_45, bio9_he_45, bio18_he_45, bio19_he_45, ahm_he_45, 
    shm_he_45, nffd_he_45)

########## RCP85 ########## 
bio2_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/he85bi502.tif")     
bio3_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/he85bi503.tif")       
bio8_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/he85bi508.tif")
bio9_he_85  <- raster("D:/SDM_OLIVES/2050/HE/rcp85/he85bi509.tif")     
bio18_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/he85bi5018.tif")     
bio19_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/he85bi5019.tif")       
ahm_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/AHM.asc") 
shm_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/SHM.asc") 
nffd_he_85 <- raster("D:/SDM_OLIVES/2050/HE/rcp85/NFFD.asc")      

#Reproject
ahm_he_85 <- projectRaster(from = ahm_hev_85, to = bio19_he_85, method="bilinear")
shm_he_85 <- projectRaster(from = shm_he_85, to = bio19_he_85, method="bilinear")
nffd_he_85 <- projectRaster(from = nffd_he_85, to = bio19_he_85, method="bilinear")

#Cut
bio2_he_85 <- crop(bio2_he_85, study_site)
bio2_he_85 <- mask(bio2_he_85, study_site)
bio2_he_85 <- bio2_he_85/10
#
bio3_he_85 <- crop(bio3_he_85, study_site)
bio3_he_85 <- mask(bio3_he_85, study_site)
#
bio8_he_85 <- crop(bio8_he_85, study_site)
bio8_he_85 <- mask(bio8_he_85, study_site)
bio8_he_85 <- bio8_he_85/10
#
bio9_he_85 <- crop(bio9_he_85, study_site)
bio9_he_85 <- mask(bio9_he_85, study_site)
bio9_he_85 <- bio9_he_85/10
#
bio18_he_85 <- crop(bio18_he_85, study_site)
bio18_he_85 <- mask(bio18_he_85, study_site)
#
bio19_he_85 <- crop(bio19_he_85, study_site)
bio19_he_85 <- mask(bio19_he_85, study_site)
#
ahm_he_85 <- crop(ahm_he_85, study_site)
ahm_he_85 <- mask(ahm_he_85, study_site)
#
shm_he_85 <- crop(shm_he_85, study_site)
shm_he_85 <- mask(shm_he_85, study_site)
#
nffd_he_85 <- crop(nffd_he_85, study_site)
nffd_he_85 <- mask(nffd_he_85, study_site)

#Create raster stack
HE_rcp85_vars <- stack( bio2_he_85, bio3_he_85, bio8_he_85, bio9_he_85, 
                        bio18_he_85, bio19_he_85, ahm_he_85, shm_he_85, 
                        nffd_he_85, pH)
names(HE_rcp85_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_he_85, bio3_he_85, bio8_he_85, bio9_he_85, bio18_he_85, bio19_he_85, ahm_he_85, 
    shm_he_85, nffd_he_85)


######################## INMCM4 (IN) ######################## 

########## RCP45 ########## 
bio2_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/in45bi502.tif")     
bio3_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/in45bi503.tif")       
bio8_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/in45bi508.tif")
bio9_in_45  <- raster("D:/SDM_OLIVES/2050/IN/rcp45/in45bi509.tif")     
bio18_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/in45bi5018.tif")     
bio19_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/in45bi5019.tif")       
ahm_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/AHM.asc") 
shm_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/SHM.asc") 
nffd_in_45 <- raster("D:/SDM_OLIVES/2050/IN/rcp45/NFFD.asc")      

#Reproject
ahm_in_45 <- projectRaster(from = ahm_in_45, to = bio19_in_45, method="bilinear")
shm_in_45 <- projectRaster(from = shm_in_45, to = bio19_in_45, method="bilinear")
nffd_in_45 <- projectRaster(from = nffd_in_45, to = bio19_in_45, method="bilinear")

#Cut
bio2_in_45 <- crop(bio2_in_45, study_site)
bio2_in_45 <- mask(bio2_in_45, study_site)
bio2_in_45 <- bio2_in_45/10
#
bio3_in_45 <- crop(bio3_in_45, study_site)
bio3_in_45 <- mask(bio3_in_45, study_site)
#
bio8_in_45 <- crop(bio8_in_45, study_site)
bio8_in_45 <- mask(bio8_in_45, study_site)
bio8_in_45 <- bio8_in_45/10
#
bio9_in_45 <- crop(bio9_in_45, study_site)
bio9_in_45 <- mask(bio9_in_45, study_site)
bio9_in_45 <- bio9_in_45/10
#
bio18_in_45 <- crop(bio18_in_45, study_site)
bio18_in_45 <- mask(bio18_in_45, study_site)
#
bio19_in_45 <- crop(bio19_in_45, study_site)
bio19_in_45 <- mask(bio19_in_45, study_site)
#
ahm_in_45 <- crop(ahm_in_45, study_site)
ahm_in_45 <- mask(ahm_in_45, study_site)
#
shm_in_45 <- crop(shm_in_45, study_site)
shm_in_45 <- mask(shm_in_45, study_site)
#
nffd_in_45 <- crop(nffd_in_45, study_site)
nffd_in_45 <- mask(nffd_in_45, study_site)

#Create raster stack
IN_rcp45_vars <- stack( bio2_in_45, bio3_in_45, bio8_in_45, bio9_in_45, 
                        bio18_in_45, bio19_in_45, ahm_in_45, shm_in_45, 
                        nffd_in_45, pH)
names(IN_rcp45_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_in_45, bio3_in_45, bio8_in_45, bio9_in_45, bio18_in_45, bio19_in_45, ahm_in_45, 
    shm_in_45, nffd_in_45)

########## RCP85 ########## 
bio2_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/in85bi502.tif")     
bio3_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/in85bi503.tif")       
bio8_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/in85bi508.tif")
bio9_in_85  <- raster("D:/SDM_OLIVES/2050/IN/rcp85/in85bi509.tif")     
bio18_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/in85bi5018.tif")     
bio19_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/in85bi5019.tif")       
ahm_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/AHM.asc") 
shm_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/SHM.asc") 
nffd_in_85 <- raster("D:/SDM_OLIVES/2050/IN/rcp85/NFFD.asc")      

#Reproject
ahm_in_85 <- projectRaster(from = ahm_in_85, to = bio19_in_85, method="bilinear")
shm_in_85 <- projectRaster(from = shm_in_85, to = bio19_in_85, method="bilinear")
nffd_in_85 <- projectRaster(from = nffd_in_85, to = bio19_in_85, method="bilinear")

#Cut
bio2_in_85 <- crop(bio2_in_85, study_site)
bio2_in_85 <- mask(bio2_in_85, study_site)
bio2_in_85 <- bio2_in_85/10
#
bio3_in_85 <- crop(bio3_in_85, study_site)
bio3_in_85 <- mask(bio3_in_85, study_site)
#
bio8_in_85 <- crop(bio8_in_85, study_site)
bio8_in_85 <- mask(bio8_in_85, study_site)
bio8_in_85 <- bio8_in_85/10
#
bio9_in_85 <- crop(bio9_in_85, study_site)
bio9_in_85 <- mask(bio9_in_85, study_site)
bio9_in_85 <- bio9_in_85/10
#
bio18_in_85 <- crop(bio18_in_85, study_site)
bio18_in_85 <- mask(bio18_in_85, study_site)
#
bio19_in_85 <- crop(bio19_in_85, study_site)
bio19_in_85 <- mask(bio19_in_85, study_site)
#
ahm_in_85 <- crop(ahm_in_85, study_site)
ahm_in_85 <- mask(ahm_in_85, study_site)
#
shm_in_85 <- crop(shm_in_85, study_site)
shm_in_85 <- mask(shm_in_85, study_site)
#
nffd_in_85 <- crop(nffd_in_85, study_site)
nffd_in_85 <- mask(nffd_in_85, study_site)

#Create raster stack
IN_rcp85_vars <- stack( bio2_in_85, bio3_in_85, bio8_in_85, bio9_in_85, 
                        bio18_in_85, bio19_in_85, ahm_in_85, shm_in_85, 
                        nffd_in_85, pH)
names(IN_rcp85_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_in_85, bio3_in_85, bio8_in_85, bio9_in_85, bio18_in_85, bio19_in_85, ahm_in_85, 
    shm_in_85, nffd_in_85) 


######################## IPSL-CM5A-LR	(IP) ######################## 

########## RCP45 ########## 
bio2_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/ip45bi502.tif")     
bio3_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/ip45bi503.tif")       
bio8_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/ip45bi508.tif")
bio9_ip_45  <- raster("D:/SDM_OLIVES/2050/IP/rcp45/ip45bi509.tif")     
bio18_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/ip45bi5018.tif")     
bio19_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/ip45bi5019.tif")       
ahm_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/AHM.asc") 
shm_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/SHM.asc") 
nffd_ip_45 <- raster("D:/SDM_OLIVES/2050/IP/rcp45/NFFD.asc")      

#Reproject
ahm_ip_45 <- projectRaster(from = ahm_ip_45, to = bio19_ip_45, method="bilinear")
shm_ip_45 <- projectRaster(from = shm_ip_45, to = bio19_ip_45, method="bilinear")
nffd_ip_45 <- projectRaster(from = nffd_ip_45, to = bio19_ip_45, method="bilinear")

#Cut
bio2_ip_45 <- crop(bio2_ip_45, study_site)
bio2_ip_45 <- mask(bio2_ip_45, study_site)
bio2_ip_45 <- bio2_ip_45/10
#
bio3_ip_45 <- crop(bio3_ip_45, study_site)
bio3_ip_45 <- mask(bio3_ip_45, study_site)
#
bio8_ip_45 <- crop(bio8_ip_45, study_site)
bio8_ip_45 <- mask(bio8_ip_45, study_site)
bio8_ip_45 <- bio8_ip_45/10
#
bio9_ip_45 <- crop(bio9_ip_45, study_site)
bio9_ip_45 <- mask(bio9_ip_45, study_site)
bio9_ip_45 <- bio9_ip_45/10
#
bio18_ip_45 <- crop(bio18_ip_45, study_site)
bio18_ip_45 <- mask(bio18_ip_45, study_site)
#
bio19_ip_45 <- crop(bio19_ip_45, study_site)
bio19_ip_45 <- mask(bio19_ip_45, study_site)
#
ahm_ip_45 <- crop(ahm_ip_45, study_site)
ahm_ip_45 <- mask(ahm_ip_45, study_site)
#
shm_ip_45 <- crop(shm_ip_45, study_site)
shm_ip_45 <- mask(shm_ip_45, study_site)
#
nffd_ip_45 <- crop(nffd_ip_45, study_site)
nffd_ip_45 <- mask(nffd_ip_45, study_site)

#Create raster stack
IP_rcp45_vars <- stack( bio2_ip_45, bio3_ip_45, bio8_ip_45, bio9_ip_45, 
                        bio18_ip_45, bio19_ip_45, ahm_ip_45, shm_ip_45, 
                        nffd_ip_45, pH)
names(IP_rcp45_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_ip_45, bio3_ip_45, bio8_ip_45, bio9_ip_45, bio18_ip_45, bio19_ip_45, ahm_ip_45, 
    shm_ip_45, nffd_ip_45)

########## RCP85 ########## 
bio2_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/ip85bi502.tif")     
bio3_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/ip85bi503.tif")       
bio8_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/ip85bi508.tif")
bio9_ip_85  <- raster("D:/SDM_OLIVES/2050/IP/rcp85/ip85bi509.tif")     
bio18_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/ip85bi5018.tif")     
bio19_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/ip85bi5019.tif")       
ahm_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/AHM.asc") 
shm_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/SHM.asc") 
nffd_ip_85 <- raster("D:/SDM_OLIVES/2050/IP/rcp85/NFFD.asc")

#Reproject
ahm_ip_85 <- projectRaster(from = ahm_ip_85, to = bio19_ip_85, method="bilinear")
shm_ip_85 <- projectRaster(from = shm_ip_85, to = bio19_ip_85, method="bilinear")
nffd_ip_85 <- projectRaster(from = nffd_ip_85, to = bio19_ip_85, method="bilinear")

#Cut
bio2_ip_85 <- crop(bio2_ip_85, study_site)
bio2_ip_85 <- mask(bio2_ip_85, study_site)
bio2_ip_85 <- bio2_ip_85/10
#
bio3_ip_85 <- crop(bio3_ip_85, study_site)
bio3_ip_85 <- mask(bio3_ip_85, study_site)
#
bio8_ip_85 <- crop(bio8_ip_85, study_site)
bio8_ip_85 <- mask(bio8_ip_85, study_site)
bio8_ip_85 <- bio8_ip_85/10
#
bio9_ip_85 <- crop(bio9_ip_85, study_site)
bio9_ip_85 <- mask(bio9_ip_85, study_site)
bio9_ip_85 <- bio9_ip_85/10
#
bio18_ip_85 <- crop(bio18_ip_85, study_site)
bio18_ip_85 <- mask(bio18_ip_85, study_site)
#
bio19_ip_85 <- crop(bio19_ip_85, study_site)
bio19_ip_85 <- mask(bio19_ip_85, study_site)
#
ahm_ip_85 <- crop(ahm_ip_85, study_site)
ahm_ip_85 <- mask(ahm_ip_85, study_site)
#
shm_ip_85 <- crop(shm_ip_85, study_site)
shm_ip_85 <- mask(shm_ip_85, study_site)
#
nffd_ip_85 <- crop(nffd_ip_85, study_site)
nffd_ip_85 <- mask(nffd_ip_85, study_site)

#Create raster stack
IP_rcp85_vars <- stack( bio2_ip_85, bio3_ip_85, bio8_ip_85, bio9_ip_85, 
                        bio18_ip_85, bio19_ip_85, ahm_ip_85, shm_ip_85, 
                        nffd_ip_85, pH)
names(IP_rcp85_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_ip_85, bio3_ip_85, bio8_ip_85, bio9_ip_85, bio18_ip_85, bio19_ip_85, ahm_ip_85, 
    shm_ip_85, nffd_ip_85)


######################## MPI-ESM-LR	(MP) ######################## 

########## RCP45 ########## 
bio2_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/mp45bi502.tif")     
bio3_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/mp45bi503.tif")       
bio8_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/mp45bi508.tif")
bio9_mp_45  <- raster("D:/SDM_OLIVES/2050/MP/rcp45/mp45bi509.tif")     
bio18_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/mp45bi5018.tif")     
bio19_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/mp45bi5019.tif")       
ahm_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/AHM.asc") 
shm_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/SHM.asc") 
nffd_mp_45 <- raster("D:/SDM_OLIVES/2050/MP/rcp45/NFFD.asc")      

#Reproject
ahm_mp_45 <- projectRaster(from = ahm_mp_45, to = bio19_mp_45, method="bilinear")
shm_mp_45 <- projectRaster(from = shm_mp_45, to = bio19_mp_45, method="bilinear")
nffd_mp_45 <- projectRaster(from = nffd_mp_45, to = bio19_mp_45, method="bilinear")

#Cut
bio2_mp_45 <- crop(bio2_mp_45, study_site)
bio2_mp_45 <- mask(bio2_mp_45, study_site)
bio2_mp_45 <- bio2_mp_45/10
#
bio3_mp_45 <- crop(bio3_mp_45, study_site)
bio3_mp_45 <- mask(bio3_mp_45, study_site)
#
bio8_mp_45 <- crop(bio8_mp_45, study_site)
bio8_mp_45 <- mask(bio8_mp_45, study_site)
bio8_mp_45 <- bio8_mp_45/10
#
bio9_mp_45 <- crop(bio9_mp_45, study_site)
bio9_mp_45 <- mask(bio9_mp_45, study_site)
bio9_mp_45 <- bio9_mp_45/10
#
bio18_mp_45 <- crop(bio18_mp_45, study_site)
bio18_mp_45 <- mask(bio18_mp_45, study_site)
#
bio19_mp_45 <- crop(bio19_mp_45, study_site)
bio19_mp_45 <- mask(bio19_mp_45, study_site)
#
ahm_mp_45 <- crop(ahm_mp_45, study_site)
ahm_mp_45 <- mask(ahm_mp_45, study_site)
#
shm_mp_45 <- crop(shm_mp_45, study_site)
shm_mp_45 <- mask(shm_mp_45, study_site)
#
nffd_mp_45 <- crop(nffd_mp_45, study_site)
nffd_mp_45 <- mask(nffd_mp_45, study_site)

#Create raster stack
MP_rcp45_vars <- stack( bio2_mp_45, bio3_mp_45, bio8_mp_45, bio9_mp_45, 
                        bio18_mp_45, bio19_mp_45, ahm_mp_45, shm_mp_45, 
                        nffd_mp_45, pH)
names(MP_rcp45_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_mp_45, bio3_mp_45, bio8_mp_45, bio9_mp_45, bio18_mp_45, bio19_mp_45, ahm_mp_45, 
    shm_mp_45, nffd_mp_45)

########## RCP85 ########## 
bio2_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/mp85bi502.tif")     
bio3_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/mp85bi503.tif")       
bio8_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/mp85bi508.tif")
bio9_mp_85  <- raster("D:/SDM_OLIVES/2050/MP/rcp85/mp85bi509.tif")     
bio18_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/mp85bi5018.tif")     
bio19_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/mp85bi5019.tif")       
ahm_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/AHM.asc") 
shm_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/SHM.asc") 
nffd_mp_85 <- raster("D:/SDM_OLIVES/2050/MP/rcp85/NFFD.asc")      

#Reproject
ahm_mp_85 <- projectRaster(from = ahm_mp_85, to = bio19_mp_85, method="bilinear")
shm_mp_85 <- projectRaster(from = shm_mp_85, to = bio19_mp_85, method="bilinear")
nffd_mp_85 <- projectRaster(from = nffd_mp_85, to = bio19_mp_85, method="bilinear")

#Cut
bio2_mp_85 <- crop(bio2_mp_85, study_site)
bio2_mp_85 <- mask(bio2_mp_85, study_site)
bio2_mp_85 <- bio2_mp_85/10
#
bio3_mp_85 <- crop(bio3_mp_85, study_site)
bio3_mp_85 <- mask(bio3_mp_85, study_site)
#
bio8_mp_85 <- crop(bio8_mp_85, study_site)
bio8_mp_85 <- mask(bio8_mp_85, study_site)
bio8_mp_85 <- bio8_mp_85/10
#
bio9_mp_85 <- crop(bio9_mp_85, study_site)
bio9_mp_85 <- mask(bio9_mp_85, study_site)
bio9_mp_85 <- bio9_mp_85/10
#
bio18_mp_85 <- crop(bio18_mp_85, study_site)
bio18_mp_85 <- mask(bio18_mp_85, study_site)
#
bio19_mp_85 <- crop(bio19_mp_85, study_site)
bio19_mp_85 <- mask(bio19_mp_85, study_site)
#
ahm_mp_85 <- crop(ahm_mp_85, study_site)
ahm_mp_85 <- mask(ahm_mp_85, study_site)
#
shm_mp_85 <- crop(shm_mp_85, study_site)
shm_mp_85 <- mask(shm_mp_85, study_site)
#
nffd_mp_85 <- crop(nffd_mp_85, study_site)
nffd_mp_85 <- mask(nffd_mp_85, study_site)

#Create raster stack
MP_rcp85_vars <- stack( bio2_mp_85, bio3_mp_85, bio8_mp_85, bio9_mp_85, 
                        bio18_mp_85, bio19_mp_85, ahm_mp_85, shm_mp_85, 
                        nffd_mp_85, pH)
names(MP_rcp85_vars) <- c("bio2","bio3","bio8","bio9","bio18","bio19",
                          "ahm", "shm", "nffd", "pH")

#Clean environment
rm( bio2_mp_85, bio3_mp_85, bio8_mp_85, bio9_mp_85, bio18_mp_85, bio19_mp_85, ahm_mp_85, 
    shm_mp_85, nffd_mp_85)

