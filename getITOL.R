library(data.table)
#mat<-as.data.frame(fread(mat, header=T))

getSamplesVariant<-function(mat, variant)
{
	mat<-as.data.frame(fread(mat, header=T))
	mat2<-mat[which(mat$pos==variant),]
	samples<-c()
	mat2<-mat2[,-c(1:5)]
	mat2<-mat2[1,which(as.numeric(mat2[1,])==1)]
	samples<-(as.character(colnames(mat2)))
	return(samples)
}

getSamplesLocus<-function(mat, genes.txt, variant)
{
	mat<-as.data.frame(fread(mat, header=T))
	genes<-read.table(genes.txt)
	genes2<-genes[which(genes[,4]==variant),]
	genespos<-genes2$V2
	minpos<-min(genespos)
	maxpos<-max(genespos)
	mat2<-mat[which(mat$pos==maxpos):which(mat$pos==minpos),]
	samples<-c()
	for(i in 6:ncol(mat2))
	{
		a<-sum(as.integer(c(mat2[,i]), na.rm=TRUE))
		if(a==0|a==NA)
		{next}
		else
		{
			samples[i-5]<-as.character(colnames(mat2)[i])
			print(as.character(colnames(mat2)[i]))
		}
	}
	return(samples)
}


getITOL<-function(mat, variant, label, colour, locus_based=F, genes.txt)
{
	mat<-as.data.frame(fread(mat, header=T))
	if(locus_based==T)
	{
		samples<-getSamplesLocus(mat, genes.txt, gene)
	}
	else
	{samples<-getSamples(mat, variant)}
	a<-matrix(NA, ncol=3, nrow=length(samples))
	a[,1]<-samples
	a[,2]<-rep(colour, length(samples))
	a[,3]<-rep(variant, length(samples))
	write.table(a, paste(variant, 'itol.txt',sep='_'), sep=',', quote=F, row.name=F, col.name=F)
}
