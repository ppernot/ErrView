sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Uncertainty quantification"),
    hr( style="border-color: #666;"),
    uiOutput("methodsUQ"),
    hr( style="border-color: #666;"),
    checkboxInput(
      'removeGlobOutUQ',
      label = 'Remove glob. outl.',
      value = FALSE
    ),
    checkboxInput(
      'unifxUQ',
      label = 'Uniformize abscissa',
      value = FALSE
    ),
    checkboxInput(
      'untUQ',
      label = 'Correct trend',
      value = FALSE
    ),
    sliderInput(
      'untDegree',
      label = 'Trend degree',
      value = 1,
      min = 0,
      max = 4,
      step = 1
    ),
    checkboxInput(
      'outUQ',
      label = 'Tag outliers',
      value = FALSE
    ),
    hr( style="border-color: #666;"),
    sliderInput(
      'nbClassUQ',
      label = '# Hist. classes',
      min   =   0,
      max   = 100,
      step  =   5,
      value =   0
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput("plotUQ")
  )
)
