sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("ECDF"),
    hr( style="border-color: #666;"),
    checkboxInput(
      "showMUE",
      label = "Show MUE",
      value = FALSE
    ),
    checkboxInput(
      "showQ95",
      label = "Show Q95",
      value = TRUE
    ),
    checkboxInput(
      "Qalgo",
      label = "HD quantiles",
      value = TRUE
    ),
    checkboxInput(
      "corTrendEcdf",
      label = "Correct trend",
      value = FALSE
    ),
    # sliderInput(
    #   "scaleEcdf",
    #   label = "Scale X axis",
    #   min = 0,
    #   max = 1,
    #   step = 0.1,
    #   value = 1
    # ),
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
