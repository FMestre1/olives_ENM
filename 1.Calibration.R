#FMestre
#30/07/2021

getmethodNames()

#1. Build Model
#Only olive
M_olive_D <- sdm::sdm(occurrence~.,data=d,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
getVarImp(mD)
plot(getVarImp(mD),'auc')
rcurve(mD, id=, mean=TRUE, smooth=TRUE)

#Only wild olive
M_olive_W

#Olive, wild and domesticated
M_olive_WD <- sdm::sdm(occurrence~.,data=d,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
getVarImp(mWD)
plot(getVarImp(mWD),'auc')
rcurve(mWD, id=, mean=TRUE, smooth=TRUE)

#2. Predict
pW <- predict(mD,newdata=preds2,filename='predicted_olive_D_current.img', overwrite = TRUE)
pWD <- predict(mWD,newdata=preds2,filename='predicted_olive_WD_current.img', overwrite = TRUE)

#3. Build ensemble
eD <- ensemble(mD,newdata=preds,filename='ensemble_olive_D_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
plot(eD)

eWD <- ensemble(mWD,newdata=preds,filename='ensemble_olive_WD_current.img',setting=list(method='weighted',stat='TSS'),overwrite=TRUE) 
plot(eWD)

