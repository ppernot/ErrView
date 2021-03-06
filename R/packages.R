# Options ####
Sys.setlocale(category = "LC_NUMERIC", locale = "C")

options(
  width = 60,
  warn = 0
)


# Local install ----

## CRAN Libraries ----
# libs <- c(
#   "devtools", "Hmisc", "rlist", "boot", "lmtest",
#   "shiny", "shinyFiles", "BiocManager","Biogenerics","Biobase",
#   "DT", "tools", "inlmisc", "distillery", "ineq","plotly",
#   "data.table","pvclust"
# )
# for (lib in libs) {
#   if (!require(lib, character.only = TRUE, quietly = TRUE))
#     install.packages( lib,
#       # repos = "https://cran.univ-paris1.fr",
#       dependencies = TRUE
#     )
#   library(lib, character.only = TRUE, quietly = TRUE)
# }
# ## Other libraries ----
# lib = "ErrViewLib"
# if(!require(lib,character.only = TRUE))
# devtools::install_github(paste0("ppernot/",lib))
# library(lib,character.only = TRUE)
# lib = "genefilter"
# if(!require(lib,character.only = TRUE))
#   BiocManager::install("genefilter", version="3.10")
# library(lib, character.only = TRUE)

# Cloud deployment ----

library(devtools)
library(Hmisc)
library(rlist)
library(shiny)
library(shinyFiles)
library(shinycssloaders)
library(DT)
library(tools)
library(htmltools)
library(inlmisc)
library(boot)
library(distillery)
library(ErrViewLib)
library(ineq)
library(data.table)
library(plotly)
library(pvclust)
library(BiocManager)
options(repos = BiocManager::repositories())
library(BiocGenerics)
library(Biobase)
library(genefilter)



