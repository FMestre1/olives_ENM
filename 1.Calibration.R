################################################################################
#                            MODEL CALIBRATION
################################################################################

#FMestre
#30/07/2021

#load package
#remove.packages("sdm")
#devtools::install_github("babaknaimi/sdm")
library(sdm)

# Example 3: fits using 5 models, and evaluates using 10 runs of both 5-folds 
#cross-validation and bootsrapping replication methods

#m <- sdm(sp~.,data=d,methods=c('gbm','tree','mars','mda','fda'), replication=c('cv','boot'),cv.folds=5, n=10)

#6. Build Models
#?sdm

M_olive_D <- sdm::sdm(occ~.,data=data_olive_D,
                      methods=c('maxent','cart','rf','fda','glm','gam','mars','svm','brt'),
                      replication='cv',
            		      cv.folds=nrow(olive_D), #number of presences 
		                  ncore = 4, #number of cores
                      n=1
                      )

#Save
write.sdm(M_olive_D,filename = "sdm.olives")
#Load
#read.sdm("")

# 7.Model metrics and variable importance
#
#getModelInfo(M_olive_D)
plot(getVarImp(M_olive_D),'auc')
#To get the curves plotted in two layers of graphs
?sdm::rcurve
sdm::rcurve(M_olive_D)
rcurve(M_olive_D,n = names(preds2)[1:5], mean=TRUE, smooth=TRUE)
rcurve(M_olive_D,n = names(preds2)[6:10], mean=TRUE, smooth=TRUE)
#
ev_metrics_olive_D <- getEvaluation(M_olive_D,stat=c('TSS','Kappa','AUC', 'specificity', 'sensitivity'),opt="max(se+sp)")
mean_ev_metrics_olive_D <- as.data.frame(round(colMeans(x=ev_metrics_olive_D),3))
#

#Save the project
#save.image("olives.RData")
#load("olives.RData")

