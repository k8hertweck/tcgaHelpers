# Transform gene expression data
#

gene_ex_transform <- function(dat, col) {
  dat %>%
    mutate(across(all_of(col), ~log2(.x + 1)))
}
