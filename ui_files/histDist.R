sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Errors vs. Data"),
    hr( style="border-color: #666;"),
    uiOutput("methodsHD"),
    hr( style="border-color: #666;"),
    checkboxInput(
      'removeGlobOut',
      label = 'Remove glob. outl.',
      value = FALSE
    ),
    checkboxInput(
      'regHD',
      label = 'Reg. line',
      value = FALSE
    ),
    checkboxInput(
      'untHD',
      label = 'Correct trend',
      value = FALSE
    ),
    checkboxInput(
      'baHD',
      label = 'Bland-Altmann',
      value = TRUE
    ),
    checkboxInput(
      'normHD',
      label = 'Normal fit',
      value = TRUE
    ),
    checkboxInput(
      'outHD',
      label = 'Tag outliers',
      value = FALSE
    ),
    checkboxInput(
      'yScale',
      label = 'Glob. error scale',
      value = TRUE
    ),
    hr( style="border-color: #666;"),
    sliderInput(
      'nbClass',
      label = '# Hist. classes',
      min   =   0,
      max   = 100,
      step  =   5,
      value =   0
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput("plotHistDist")
  )
)
