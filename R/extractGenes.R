# Function to extract data for target genes from SummarizedExperiment object
#

extractGenes <- function(fpkm, meta, genes) {
  # extract all expression data
  fpkmDat <- as.data.frame(assays(fpkm)[[1]])
  # select only desired genes
  fpkmGene <- as.data.frame(t(filter(fpkmDat,
                                     rownames(fpkmDat) %in% genes$ensembl_gene_id)))
  # replace gene column names
  rename_with(fpkmGene, ~ genes$external_gene_name[match(., genes$ensembl_gene_id)])
  # bind metadata to gene expression data
  fpkmGene <- full_join(meta, fpkmGene, by="barcode")
  return(fpkmGene)
}
