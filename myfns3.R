#' A function to read csv 
#' based on input at select input
#' returns all csvs as selected
#' compares selected names with files in directory
library(tools)
source("global_vars.R")

readert <- function(x) {
  y<- list.files( pattern=".csv")
  y2 <- as.numeric(regmatches(y, regexpr("[[:digit:]]+", y)))
  z <- y[match(x, y2)]
  myfiles <- lapply(z, read_csv)
  sitesmer <- bind_rows(myfiles)
  return(sitesmer)
}


numextractor <- function(x) {
  sitenum <- sitenames$Site_ID[match(x, sitenames$Site_Name)]
  return(sitenum)
}