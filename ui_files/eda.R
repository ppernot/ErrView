sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Exploratory Data Analysis"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendEDA',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'corDegreeEDA',
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
      "edaCexLab",
      label = "Labels size",
      min = 0,
      max = 1,
      value = 0.7,
      step = 0.1
    ),
    radioButtons(
      "edaChoice",
      label = "Analysis type",
      choices = list(
        "PCA" = "pca",
        "Systems cluster" = "systems",
        "Methods cluster" = "methods"
      )
    ),
    radioButtons(
      "clustMethod",
      label = "Clustering method",
      choices = list(
        "Complete" = "complete",
        "Single"   = "single"
      )
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "edaPlot",
      dblclick = "pca_dblclick",
      brush = brushOpts(
        id = "pca_brush",
        resetOnNew = TRUE
      )
    )
  )
)
