function(input, output, session) {

  # Initialize ####
  # if (!dir.exists("outputDir")) {
  #   dir.create("outputDir", showWarnings = FALSE)
  # }

  # Load Server files ####
  files <- c(
    "loadData.R",
    "outliers.R",
    "stats.R",
    "histDist.R",
    "ecdf.R",
    "correl.R",
    "ranking.R",
    "sip.R",
    "delta.R"
  )

  for (f in files)
    source(
      file.path("server_files", f),
      local = TRUE
    )
}
