#original script from Romain Lopez:
#https://github.com/romain-lopez/scVI-reproducibility/blob/master/additional/PBMC.R
#modified by Will Townes

library(Matrix)
library(scone)
library(plyr)
pth<-"data/pbmc"
fp<-file.path

# get cleaned data by merging genes from original scone pipeline and microarray
load(fp(pth,"scVI_scone.rda"))

barcodes = scone_obj@colData@rownames
list_qc = scone_obj@colData@listData[names(scone_obj@colData@listData)[1:9]]
qc.df = do.call("cbind", lapply(list_qc, as.data.frame))
colnames(qc.df) = names(scone_obj@colData@listData)[1:9]
batch = get_batch(scone_obj)
gene_names = scone_obj@NAMES
design = get_design(scone_obj, method = "none,fq,qc_k=8,no_bio,no_batch" )

write.csv(barcodes, fp(pth,"barcodes.csv"))
write.csv(batch, fp(pth,"batch.csv"))
write.csv(qc.df, fp(pth,"full_qc.csv"))
write.csv(gene_names, fp(pth,"gene_names.csv"))
write.csv(design, fp(pth,"design.csv"))

# load cells information from SEURAT, included in the original scone object
load(fp(pth,"scone_all_wposcon_extendim_biostrat2_q.rda"))
bio = get_bio(scone_obj)
write.csv(bio, fp(pth,"bio.csv"))


