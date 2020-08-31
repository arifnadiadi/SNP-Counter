#Reference Genome Length
genL <- 16650

#Select SNP count file
win_snps <- read.csv(file.choose(), header = FALSE)

#Select List of accession numbers:
acc_list <- read.table(file.choose())

#Calculate Mean SNPs in each window
snps_Means <- rowMeans(win_snps[, -1])
#Calculate number of accessions
x  <- nrow(acc_list)+1
#pdf(file="output.pdf", paper='A4r')
#Plot Each Accession and Mean
{matplot(win_snps$V1, win_snps[,-1], col= 2:x, type = "l", lwd=1, lty=2, xlab= "Window Start Position", ylab="SNPs", xaxt='n', main="SNPs in Sliding Window")
  lines(snps_Means~win_snps$V1, col=1, lwd=2)
  legend("topleft", legend=acc_list$V1, fill=c(2:x), cex=.65)
  axis(side=1, at=seq(0,genL, 100), labels=seq(0,genL,100))
}
