# Collapse substages (e.g., IIA -> II) into new column named collapsed_stages
#

collapse_stages <- function(dat, stage_column) {
  return(dat %>% mutate(collapsed_stages = str_remove({{ stage_column }}, "[ABCD]")))
}
