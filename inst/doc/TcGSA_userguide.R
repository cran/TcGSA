## ----pre, echo=FALSE, warning=FALSE, include=FALSE-----------------------
library(knitr)
is_check <- ("CheckExEnv" %in% search()) || any(c("_R_CHECK_TIMINGS_", "_R_CHECK_LICENSE_") %in% names(Sys.getenv()))
knitr::opts_chunk$set(echo = TRUE, eval=!is_check, cache=TRUE)
#rmarkdown::render("vignettes/TcGSA_userguide.Rmd")

## ----GEOquery, include=FALSE, message=FALSE, cache=FALSE-----------------
if (!requireNamespace("GEOquery", quietly = TRUE)) {
	source("https://bioconductor.org/biocLite.R")
	biocLite("GEOquery")
}

