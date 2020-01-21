sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Outliers"),
    hr( style="border-color: #666;"),
    checkboxInput(
      "scaleParaPlot",
      label = "Scale",
      value = FALSE
    ),
    checkboxInput(
      "scrambleParaPlot",
      label = "Scramble",
      value = FALSE
    ),
    checkboxInput(
      "clusterParaPlot",
      label = "Clustering",
      value = FALSE
    ),
    radioButtons(
      "outliersParaPlot",
      label = "Outliers",
      choices = list(
        "No" = "no",
        "Q+IQR" = "iqr",
        "CI95" = "ci95"
      )
    ),
    sliderInput(
      "labelParaPlot",
      label = "Labels Thresh.",
      min = 0,
      max = 5,
      step = 0.1,
      value = 3
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
