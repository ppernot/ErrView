sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Global Outliers"),
    hr( style="border-color: #666;"),
    checkboxInput(
      "scaleParaPlot",
      label = "Scaled Errors",
      value = TRUE
    ),
    sliderInput(
      "labelParaPlot",
      label = "Labels Thresh.",
      min = 0,
      max = 5,
      step = 0.1,
      value = 3
    ),
    checkboxInput(
      "scrambleParaPlot",
      label = "Scramble X",
      value = FALSE
    ),
    checkboxInput(
      "clusterParaPlot",
      label = "Methods Clustering",
      value = FALSE
    ),
    radioButtons(
      "outliersParaPlot",
      label = "Outliers",
      choices = list(
        "No" = "no",
        "Q+IQR" = "iqr",
        "CI90" = "ci90",
        "CI95" = "ci95"
      )
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "outliersPlot",
      inline = TRUE
    )
    # parcoordsOutput(
    #   "outliersPlot"
    # )
  )
)
