function(input, output, session) {

  # Load Server files ####
  files <- c(
    "loadData.R",
    "outliers.R",
    "stats.R",
    "histDist.R",
    "qqPlot.R",
    "ecdf.R",
    "correl.R",
    "ranking.R",
    "sip.R",
    "delta.R",
    "UQ.R"
  )

  for (f in files)
    source(
      file.path("server_files", f),
      local = TRUE
    )
}
