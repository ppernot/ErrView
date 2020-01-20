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
