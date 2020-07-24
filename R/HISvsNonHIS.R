# Extract data from latinx and non-latinx patients who are also white
#

HISvsNonHIS <- function(dat){
  dat %>%
    filter(race == "white") %>%
    filter(ethnicity == "hispanic or latino" | ethnicity == "not hispanic or latino")
}
