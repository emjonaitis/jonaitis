#  pkg_chk
#' Wrapper for installing and updating the packages I use regularly. Installs dependencies as well.
#' 
#' @export
#' @return Null
#' 
#' @examples
#' pkg_chk()
#' 
#' @seealso \code{\link{update.packages}}, \code{\link{install.packages}}
#' @keywords update, library


pkg_chk <- function() {

liblist <- c("bbmle",
             "boot",
             "car",
             "devtools",
             "e1071",
             "faraway",
             "gdata",
             "ggplot2",
             "gmodels",
             "grid",
             "gridExtra",
             "Hmisc",
             "knitr",
             "lattice",
             "lme4",
             "lubridate",
             "MASS",
             "mvtnorm",
             "nlme",
             "openxlsx",
             "ordinal",
             "pander",
             "plyr",
             "quantreg",
             "Rcpp",
             "RColorBrewer",
             "reshape2",
             "rmarkdown",
             "roxygen2",
             "RPostgreSQL",
             "scales",
             "stringr",
             "xtable")
present <- data.frame(installed.packages())
misslist <- liblist[!(liblist %in% present$Package)]
update.packages()
install.packages(misslist,dependencies=TRUE)
}