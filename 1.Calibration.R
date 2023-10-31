#FMestre
#30/07/2021

#6. Build Models
M_olive_W <- sdm::sdm(occ~.,data=data_olive_W,methods=c('cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
M_olive_D <- sdm::sdm(occ~.,data=data_olive_D,methods=c('cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
M_olive_WD <- sdm::sdm(occ~.,data=data_olive_WD,methods=c('cart','rf','fda','glm','gam','mars','svm','brt'),replication='sub',test.percent=30,n=10)
#

# 7.Model metrics and variable importance
#
#getModelInfo(M_olive_D)
plot(getVarImp(M_olive_D),'auc')
rcurve(M_olive_D, id=1:80,n =names(preds2)[1:5], mean=TRUE, smooth=TRUE)
rcurve(M_olive_D, id=1:80,n =names(preds2)[6:10], mean=TRUE, smooth=TRUE)
ev_metrics_olive_D <- getEvaluation(M_olive_D,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_olive_D <- as.data.frame(round(colMeans(x=ev_metrics_olive_D),3))
#
#getModelInfo(M_olive_W)
plot(getVarImp(M_olive_W),'auc')
rcurve(M_olive_W, id=1:80,n =names(preds2)[1:5], mean=TRUE, smooth=TRUE)
rcurve(M_olive_W, id=1:80,n =names(preds2)[6:10], mean=TRUE, smooth=TRUE)
ev_metrics_olive_W <- getEvaluation(M_olive_W,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_olive_W <- as.data.frame(round(colMeans(x=ev_metrics_olive_W),3))
#
#getModelInfo(M_olive_WD)
plot(getVarImp(M_olive_WD),'auc')
rcurve(M_olive_WD, id=1:80,n =names(preds2)[1:5], mean=TRUE, smooth=TRUE)
rcurve(M_olive_WD, id=1:80,n =names(preds2)[6:10], mean=TRUE, smooth=TRUE)
ev_metrics_olive_WD <- getEvaluation(M_olive_WD,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_olive_WD <- as.data.frame(round(colMeans(x=ev_metrics_olive_WD),3))

save.image("olives.RData")
#load("olives.RData")

