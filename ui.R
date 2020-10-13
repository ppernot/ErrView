function(request) {
  source_ui <- function(...) {
    source(
      file.path("ui_files", ...),
      local = TRUE
    )$value
  }

  navbarPage(
    "ErrView",
    theme = shinythemes::shinytheme(
      c("cosmo", "cerulean", "spacelab", "yeti")[3]
    ),
    tabPanel(
      title = "Data",
      source_ui("loadData.R")
    ),
    tabPanel(
      title = "Outliers",
      source_ui("outliers.R")
    ),
    tabPanel(
      title = "Statistics",
      source_ui("stats.R")
    ),
    tabPanel(
      title = "HistDist",
      source_ui("histDist.R")
    ),
    tabPanel(
      title = "QQ-Plot",
      source_ui("qqPlot.R")
    ),
    tabPanel(
      title = "ECDFs",
      source_ui("ecdf.R")
    ),
    tabPanel(
      title = "Lorenz",
      source_ui("lorenz.R")
    ),
    tabPanel(
      title = "Correlations",
      source_ui("correl.R")
    ),
    tabPanel(
      title = "Ranking",
      source_ui("ranking.R")
    ),
    tabPanel(
      title = "SIP mat.",
      source_ui("sip.R")
    ),
    tabPanel(
      title = "Delta |Err|",
      source_ui("delta.R")
    ),
    tabPanel(
      title = "UQ",
      source_ui("UQ.R")
    )
  )

}
