#Creation of a matrix where the data from the "varImp" function will be stored
library(caret)
varib<-as.matrix(varImp(RFmodel))
#Arranging of the "varib.ord" matrix to decreasing order so as to seperate the 50 most important genes
varib.ord<-as.matrix(varib[order(varib,decreasing=T),])
#Seperation of the 50 most important genes to the "imp.genes" matrix
imp.genes<-as.matrix(varib.ord[1:50,])
colnames(imp.genes)<-c("MeanDecreaseGini")
write.xlsx(imp.genes,"6.50 Most Important Genes.xlsx",col.names=T,row.names=T)

#Plotting the "imp.genes" matrix
#For visual reasons the order was reversed so as to have an ascending order in the plot
imp.genes.inc<-as.matrix(imp.genes[order(imp.genes,decreasing=F),])
imp.genes.inc.names<-rownames(imp.genes.inc)
plot(y=seq(1:length(imp.genes.inc)),x=imp.genes.inc,pch=19,yaxt="n",xlab="Importance",ylab="", main="50 Most Important Genes",cex.main=1.7,cex.lab=1.3,cex.axis=1.2,cex=1.3,col="steelblue4")
axis(2,at=1:length(imp.genes.inc),labels=imp.genes.inc.names,las=1,cex.axis=0.7)
