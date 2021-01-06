sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Correlations"),
    hr( style="border-color: #666;"),
    radioButtons(
      "corSample",
      label = "Samples",
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
      label = "Correlation type",
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
    ),
    sliderInput(
      "corCexLab",
      label = "Label size",
      min = 0,
      max = 1,
      value = 1,
      step = 0.1
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
