# Download gene expression data from a TCGA project
#

geneDataTCGA <- function(tcga_proj, path) {
  # identify desired data
  query_fpkm <- GDCquery(project = tcga_proj,
                         data.category = "Transcriptome Profiling",
                         data.type = "Gene Expression Quantification",
                         workflow.type = "HTSeq - FPKM-UQ")
  # download data
  GDCdownload(query_fpkm, directory = path)
  # read downloaded data
  fpkm <- GDCprepare(query_fpkm, directory = path)

  # save imported object to file
  save(fpkm, file=paste0(path, "fpkm", tcga_proj, ".RData"))
}
