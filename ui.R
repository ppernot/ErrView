function(request) {
  source_ui <- function(...) {
    source(
      file.path("ui_files", ...),
      local = TRUE
    )$value
  }

  navbarPage(
    "Reactor",
    theme = shinythemes::shinytheme(
      c("cosmo", "cerulean", "spacelab", "yeti")[3]
    ),
    tabPanel(
      title = "Data",
      source_ui("loadData.R")
    ),
    tabPanel(
      title = "Correlations",
      source_ui("correl.R")
    ),
    tabPanel(
      title = "Outliers",
      source_ui("outliers.R")
    ),
    tabPanel(
      title = "Ranking",
      source_ui("analysis.R")
    ),
    tabPanel(
      title = "About",
      source_ui("about.R")
    )
  )

}
