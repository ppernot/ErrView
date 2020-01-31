version = 1.1

source("R/packages.R")

# Proportions of Side/Main Panels ####
sideWidth  <- 3
mainWidth  <- 12 - sideWidth
plotHeight <- 550
plotWidth  <- 750
nomSize    <- 5 # Size of matrix for good plot with plotHeight px

# Graphical parameters ####
gPars = list(
  cols     = rev(inlmisc::GetColors(8))[1:7],
  cols_tr  = rev(inlmisc::GetColors(8, alpha = 0.1))[1:7],
  cols_tr2 = rev(inlmisc::GetColors(8, alpha = 0.4))[1:7],
  pty      = 's',
  mar      = c(3, 3, 1, 1),
  mgp      = c(2, .75, 0),
  tcl      = -0.5,
  lwd      = 2,
  cex      = 1.4,
  cex.leg  = 0.8
)

options(boot.parallel = "multicore")
options(boot.ncpus = 4)
