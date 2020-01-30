# Options ####
Sys.setlocale(category = "LC_NUMERIC", locale = "C")

options(
  # shiny.maxRequestSize = 20 * 1024^2,
  width = 60,
  warn = 0
)

# options(shiny.json.digits=32)

# CRAN Libraries ####
# libs <- c(
#   "devtools", "Hmisc", "rlist", "boot",
#   "shiny", "shinyFiles", #"shinyBS", "shinycssloaders",
#   "DT", "tools", "inlmisc", "distillery"
# )
# for (lib in libs) {
#   if (!require(lib, character.only = TRUE, quietly = TRUE)) {
#     install.packages(
#       lib,
#       dependencies = TRUE #,
#       # repos = "https://cran.univ-paris1.fr"
#     )
#     library(lib, character.only = TRUE, quietly = TRUE)
#   }
# }
# lib = "ErrViewLib"
# if(!require(lib,character.only = TRUE))
#   devtools::install_github(paste0("ppernot/",lib))
# library(lib,character.only = TRUE)

# For Shinyio.apps
library(devtools)
library(Hmisc)
library(rlist)
library(shiny)
library(shinyFiles)
library(shinycssloaders)
library(DT)
library(tools)
library(inlmisc)
library(boot)
library(distillery)
library(ErrViewLib)


