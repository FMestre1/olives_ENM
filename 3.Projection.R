#FMestre
#27-08-2021

# 9.Predict
#predict_olive_D <- predict(M_olive_D,newdata=high_res_preds,filename='predicted_olive_D_current.img', overwrite = TRUE)
#predict_olive_W <- predict(M_olive_W,newdata=high_res_preds,filename='predicted_olive_W_current.img', overwrite = TRUE)
#predict_olive_WD <- predict(M_olive_WD,newdata=high_res_preds,filename='predicted_olive_WD_current.img', overwrite = TRUE)
#
#predict_vine_D <- predict(M_vine_D,newdata=high_res_preds,filename='predicted_vine_D_current.img', overwrite = TRUE)
#predict_vine_W <- predict(M_vine_W,newdata=high_res_preds,filename='predicted_vine_W_current.img', overwrite = TRUE)
#predict_vine_WD <- predict(M_vine_WD,newdata=high_res_preds,filename='predicted_vine_WD_current.img', overwrite = TRUE)


#10. Build ensemble
ensemble_olive_D <- sdm::ensemble(M_olive_D,newdata=high_res_preds,filename='ensemble_olive_D_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_olive_W <- sdm::ensemble(M_olive_W,newdata=high_res_preds,filename='ensemble_olive_W_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_olive_WD <- sdm::ensemble(M_olive_WD,newdata=high_res_preds,filename='ensemble_olive_WD_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
#plot(ensemble_olive_D)
#plot(ensemble_olive_W)
#plot(ensemble_olive_WD)

ensemble_vine_D <- sdm::ensemble(M_vine_D,newdata=high_res_preds,filename='ensemble_vine_D_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_vine_W <- sdm::ensemble(M_vine_W,newdata=high_res_preds,filename='ensemble_vine_W_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
ensemble_vine_WD <- sdm::ensemble(M_vine_WD,newdata=high_res_preds,filename='ensemble_vine_WD_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
#plot(ensemble_vine_D)
#plot(ensemble_vine_W)
#plot(ensemble_vine_WD)

#Clean environment
rm(high_res_preds)

###########################################################
########################## FUTURE ######################### 
###########################################################
#2050







