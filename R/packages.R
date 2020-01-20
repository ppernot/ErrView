# Options ####
Sys.setlocale(category = "LC_NUMERIC", locale = "C")

options(
  shiny.maxRequestSize = 20 * 1024^2,
  width = 60,
  warn = 0
)

# options(shiny.json.digits=32)

# CRAN Libraries ####
libs <- c(
  "devtools","Hmisc", "rlist","boot",
  "shiny", "shinyBS", "shinycssloaders", "shinyFiles",
  "DT", "tools", "inlmisc","distillery","parcoords"
)
for (lib in libs) {
  if (!require(lib, character.only = TRUE, quietly = TRUE)) {
    install.packages(
      lib,
      dependencies = TRUE,
      repos = "https://cran.univ-paris1.fr"
    )
    library(lib, character.only = TRUE, quietly = TRUE)
  }
}
