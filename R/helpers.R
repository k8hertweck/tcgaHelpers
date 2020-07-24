# Reinstall and load this package (useful after updates have been made)
#

helpers <- function(){
  library(devtools)
  install_github("k8hertweck/tcgaHelpers")
  library(tcgaHelpers)
}
