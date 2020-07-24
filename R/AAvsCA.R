# Extract data from black and white patients who are not latinx
#

AAvsCA <- function(dat){
  dat %>%
    filter(race == "white" | race == "black or african american") %>%
    filter(ethnicity == "not hispanic or latino")
}
