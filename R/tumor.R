# Extract only tumor data
#

tumor <- function(dat){
  dat %>%
    filter(shortLetterCode == "TP")
}
