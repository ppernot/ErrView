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
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendOut',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'ctoDegree',
          label = 'Trend degree',
          value = 0,
          min   = 0,
          max   = 2,
          step  = 1,
          width = '100px'
        )
      )
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
      label = "Scramble points",
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
    ),
    sliderInput(
      "outliersCexLab",
      label = "Labels size",
      min = 0,
      max = 1,
      value = 1,
      step = 0.1
    ),
    sliderInput(
      "outliersCexMeth",
      label = "Methods size",
      min = 0,
      max = 1,
      value = 1,
      step = 0.1
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "outliersPlot",
      # inline = TRUE,
      dblclick = "outliers_dblclick",
      brush = brushOpts(
        id = "outliers_brush",
        resetOnNew = TRUE
      )
    )
  )
)
