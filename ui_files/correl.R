sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Correlations"),
    hr( style="border-color: #666;"),
    radioButtons(
      "corSample",
      label = "Echantillons",
      choices = list(
        "Data"   = "data",
        "Errors" = "errors",
        "MUE"    = "mue",
        "Q95"    = "q95hd"
      ),
      selected = "errors"
    ),
    radioButtons(
      "corMethod",
      label = "Method for Errors",
      choices = list(
        "Pearson"  = "pearson",
        "Spearman" = "spearman",
        "Kendall"  = "kendall"
      ),
      selected = "spearman"
    ),
    checkboxInput(
      "dendro",
      label = "Clustering",
      value = FALSE
    )
    # sliderInput(
    #   "corMargin",
    #   label = "Plot Margin",
    #   min   = 3,
    #   max   = 20,
    #   step  = 1,
    #   value = 5
    # )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "correlPlot",
      inline = TRUE
    )
  )
)
