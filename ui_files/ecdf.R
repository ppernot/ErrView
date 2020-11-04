sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("ECDF"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "absErrECDF",
          label = "Absolute Errors",
          value = TRUE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "remGlobOutECDF",
          label = "Remove glob. outl.",
          value = FALSE
        )
      )
    ),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "showMUE",
          label = "Show MUE",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "showQ95",
          label = "Show Q95",
          value = TRUE
        )
      )
    ),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendECDF',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'ctecDegree',
          label = 'Trend degree',
          value = 0,
          min   = 0,
          max   = 2,
          step  = 1,
          width = '100px'
        )
      )
    ),
    checkboxInput(
      "Qalgo",
      label = "HD quantiles",
      value = TRUE
    ),
    hr( style="border-color: #666;"),
    uiOutput("methodsEcdf")
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "plotECDF",
      dblclick = "ECDF_dblclick",
      brush = brushOpts(
        id = "ECDF_brush",
        resetOnNew = TRUE
      )
    )
  )
)
