# Function to extract data for target genes from SummarizedExperiment object
#

extractGenes <- function(fpkm, meta, genes) {
  # extract all expression data
  fpkmDat <- as.data.frame(assays(fpkm)[[1]])
  # select only desired genes and pivot table
  fpkmGene <- as.data.frame(t(filter(fpkmDat, rownames(fpkmDat) %in% genes$ensembl_gene_id)))
  fpkmGene <- rownames_to_column(fpkmGene, "barcode")
  # bind metadata to gene expression data
  fpkmGene <- full_join(meta, fpkmGene, by="barcode")
  return(fpkmGene)
}
