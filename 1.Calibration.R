#FMestre
#30/07/2021

getmethodNames()

#6. Build Models
M_olive_W <- sdm::sdm(occ~.,data=data_olive_W,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
M_olive_D <- sdm::sdm(occ~.,data=data_olive_D,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
M_olive_WD <- sdm::sdm(occ~.,data=data_olive_WD,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
#
M_vine_W <- sdm::sdm(occ~.,data=data_vine_W,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
M_vine_D <- sdm::sdm(occ~.,data=data_vine_D,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
M_vine_WD <- sdm::sdm(occ~.,data=data_vine_WD,methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
#

# 7.Model metrics and variable importance
#Olives
getModelInfo(M_olive_W)
getVarImp(M_olive_W)
plot(getVarImp(M_olive_W),'auc')
rcurve(M_olive_W, id=, mean=TRUE, smooth=TRUE)
ev_metrics_olive_W <- getEvaluation(M_olive_W,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(kappa)")
mean_ev_metrics_olive_W <- as.data.frame(colMeans(x=ev_metrics_olive_W))
#
getModelInfo(M_olive_D)
getVarImp(M_olive_D)
plot(getVarImp(M_olive_D),'auc')
rcurve(M_olive_D, id=, mean=TRUE, smooth=TRUE)
ev_metrics_olive_D <- getEvaluation(M_olive_D,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(kappa)")
mean_ev_metrics_olive_D <- as.data.frame(colMeans(x=ev_metrics_olive_D))
#
getModelInfo(M_olive_WD)
getVarImp(M_olive_WD)
plot(getVarImp(M_olive_WD),'auc')
rcurve(M_olive_WD, id=, mean=TRUE, smooth=TRUE)
ev_metrics_olive_WD <- getEvaluation(M_olive_WD,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(kappa)")
mean_ev_metrics_olive_WD <- as.data.frame(colMeans(x=ev_metrics_olive_WD))

#Vines
getModelInfo(M_vine_W)
getVarImp(M_vine_W)
plot(getVarImp(M_vine_W),'auc')
rcurve(M_vine_W, id=, mean=TRUE, smooth=TRUE)
ev_metrics_vine_W <- getEvaluation(M_vine_W,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(kappa)")
mean_ev_metrics_vine_W <- as.data.frame(colMeans(x=ev_metrics_vine_W))
#
getModelInfo(M_vine_D)
getVarImp(M_vine_D)
plot(getVarImp(M_vine_D),'auc')
rcurve(M_vine_D, id=, mean=TRUE, smooth=TRUE)
ev_metrics_vine_D <- getEvaluation(M_vine_D,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(kappa)")
mean_ev_metrics_vine_D <- as.data.frame(colMeans(x=ev_metrics_vine_D))
#
getModelInfo(M_vine_WD)
getVarImp(M_vine_WD)
plot(getVarImp(M_vine_WD),'auc')
rcurve(M_vine_WD, id=, mean=TRUE, smooth=TRUE)
ev_metrics_vine_WD <- getEvaluation(M_vine_WD,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(kappa)")
mean_ev_metrics_vine_WD <- as.data.frame(colMeans(x=ev_metrics_vine_WD))

#Save
save.image("olive_vines_RData")
