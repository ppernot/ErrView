version = 1.3

# Increase max loading size to 30 Mo
options(
  shiny.maxRequestSize=30*1024^2,
  width = 70
)

source("R/packages.R")

# Proportions of Side/Main Panels ####
sideWidth  <- 3
mainWidth  <- 12 - sideWidth
plotHeight <- 550
plotWidth  <- 750
nomSize    <- 5 # Size of matrix for good plot with plotHeight px

# Graphical parameters ####
gPars = ErrViewLib::setgPars('shiny')

options(boot.parallel = "multicore")
options(boot.ncpus = 4)
