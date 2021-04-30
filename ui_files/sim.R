sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Similarity Metric"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendSim',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'corDegreeSim',
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
      "simCexLab",
      label = "Labels size",
      min = 0,
      max = 1,
      value = 0.7,
      step = 0.1
    ),
    radioButtons(
      "simView",
      label = "Analysis type",
      choices = list(
        "Matrix" = "matrix",
        "Dendrogram" = "cluster"
      )
    ),
    radioButtons(
      "simClustMethod",
      label = "Clustering method",
      choices = list(
        "Complete" = "complete",
        "Single"   = "single"
      )
    ),
    numericInput(
      "simEps",
      label = "Similarity criterion",
      min = 0,
      value = 1.0
    ),
    sliderInput(
      "simPcut",
      label = "Similarity threshold",
      min = 0,
      max = 1,
      step = 0.05,
      value = 0.
    ),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "simAbs",
          label = "|Errors|",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "simRed",
          label = "Reduce mat.",
          value = FALSE
        )
      )
    )

  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "simPlot"
      # ,
      # dblclick = "pca_dblclick",
      # brush = brushOpts(
      #   id = "pca_brush",
      #   resetOnNew = TRUE
      # )
    )
  )
)
