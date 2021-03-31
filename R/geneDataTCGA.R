# Download gene expression data from a TCGA project
#

geneDataTCGA <- function(tcga_proj, path) {
  filename <- paste0(path, "fpkm", tcga_proj, ".RDS")
  if (file.exists(filename)) {
    fpkm <- readRDS(filename)
  } else {
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
  saveRDS(fpkm, file=filename)
  }
  return(fpkm)
}
