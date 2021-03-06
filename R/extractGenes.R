# Function to extract data for target genes from SummarizedExperiment object
#

extractGenes <- function(fpkm, meta, genes) {
  # extract all expression data
  fpkmDat <- as.data.frame(assays(fpkm)[[1]])
  # select only desired genes
  fpkmGene <- as.data.frame(t(filter(fpkmDat,
                                     rownames(fpkmDat) %in% genes$ensembl_gene_id))) %>%
    # replace gene column names
    rename_with(~ genes$external_gene_name[match(., genes$ensembl_gene_id)]) %>%
    # convert rownames to column
    rownames_to_column("barcode") %>%
    # bind metadata to gene expression data
    full_join(., meta, by="barcode")
  return(fpkmGene)
}
