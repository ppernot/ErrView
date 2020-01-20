function(input, output, session) {

  # Initialize ####
  if (!dir.exists("outputDir")) {
    dir.create("outputDir", showWarnings = FALSE)
  }

  K <- reactiveVal()

  # Load Server files ####
  files <- c(
    "loadData.R",
    "correl.R",
    "analysis.R"
  )

  for (f in files)
    source(
      file.path("server_files", f),
      local = TRUE
    )
}
