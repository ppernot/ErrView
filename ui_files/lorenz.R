sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Lorenz Curves"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "giniVsLAC",
          label = "Gini vs. LAC",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "remGlobOutLorenz",
          label = "Remove outliers",
          value = FALSE
        )
      )
    ),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendLorenz',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'ctlDegree',
          label = 'Trend degree',
          value = 0,
          min   = 0,
          max   = 2,
          step  = 1,
          width = '100px'
        )
      )
    ),
    fixedRow(
      column(
        6,
        checkboxInput(
          "identGridLorenz",
          label = "Identity grid",
          value = FALSE
        )
      ),
      column(
        6,
        checkboxInput(
          "lorenzNorm",
          label = "Normal curve",
          value = TRUE
        )
      )
    ),
    hr( style="border-color: #666;"),
    uiOutput("methodsLorenz")
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "plotLorenz"#,
      # dblclick = "Lorenz_dblclick",
      # brush = brushOpts(
      #   id = "Lorenz_brush",
      #   resetOnNew = TRUE
      # )
    )
  )
)
