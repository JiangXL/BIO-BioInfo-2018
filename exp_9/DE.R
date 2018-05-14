## File:      First R script to identifying the differential experssion 
##	      genes between resting T cell and stimulated T cel based on FDR
## Author:    Source from Prof.jin 20180514 
## Output:    1-10 row is same to input file, 11-14 crow are 
##	      logFC(log fold change), log count pre million of all the
##	      libraries(logCPM), pValue, FDR
## Reference: https://www.tanboyu.com/edger-users-guide.html

library("limma")
library("edgeR")
xx <- read.table("Human_CD4_stim_refGene_RPKM.txt")

x = xx[,c(7:10)]
Lx = log(xx[, 7:10]+1)
row.names(x) = row.names(xx)

group <- factor(c(1,1,2,2))	         	#对样品分组
dge <- 	DGEList(counts = x, group = group)	#建立基因表达列表， 
Norm <- calcNormFactors(dge)			#计算样本内标准化因子
y <- estimateCommonDisp(Norm)			#计算普通的离散度
y <- estimateTagwiseDisp(y)			#计算基因间范围内的离散度
et <- exactTest(y)				#进行精确检验
topTags(et, n=dim(et)[1])$table -> CMP		#输出排名靠前的差异表达基因信息

cbind(xx[row.names(CMP),],CMP) -> AL
write.table(AL,file="Human_CD4_stim_RPKM_Count_FDR.csv", sep="\t", quote=FALSE, row.names=FALSE)
plot(CMP[11:14,])


