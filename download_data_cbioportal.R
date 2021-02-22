

url <- "https://github.com/cBioPortal/datahub/raw/master/public/kirp_tcga_pan_can_atlas_2018/data_RNA_Seq_v2_expression_median.txt"
destfile <- "data/kirp_exp.txt"
download.file(url, destfile)


url <- "https://github.com/cBioPortal/datahub/raw/master/public/kirp_tcga_pan_can_atlas_2018/data_clinical_patient.txt"
destfile <- "data/data_clinical.txt"
download.file(url, destfile)


data_clinical <- read.delim("~/gene_signature-master/data/data_clinical.txt", comment.char="#", na.strings=c("NA", ""))

kirp_exp <- read.delim("~/gene_signature-master/data/kirp_exp.txt", comment.char="#", na.strings=c("NA", ""))

kirp_exp <- kirp_exp[!is.na(kirp_exp$Hugo_Symbol),]
kirp_exp <- kirp_exp[!duplicated(kirp_exp$Hugo_Symbol),]
rownames(kirp_exp) <- as.character(kirp_exp$Hugo_Symbol)
kirp_exp$Entrez_Gene_Id <- NULL
kirp_exp$Hugo_Symbol <- NULL



