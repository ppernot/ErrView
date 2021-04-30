function(input, output, session) {

  # Load Server files ####
  files <- c(
    "loadData.R",
    "eda.R",
    "outliers.R",
    "stats.R",
    "histDist.R",
    "qqPlot.R",
    "pdf.R",
    "ecdf.R",
    "lorenz.R",
    "correl.R",
    "ranking.R",
    "sip.R",
    "delta.R",
    "sim.R",
    "UQ.R"
  )

  for (f in files)
    source(
      file.path("server_files", f),
      local = TRUE
    )
}
