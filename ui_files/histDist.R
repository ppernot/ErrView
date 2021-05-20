sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Hist-Dist"),
    hr( style="border-color: #666;"),
    uiOutput("methodsHD"),
    checkboxInput(
      'removeGlobOut',
      label = 'Remove glob. outl.',
      value = FALSE
    ),

    hr( style="border-color: #666;"),
    sliderInput(
      'nbClass',
      label = '# Hist. classes',
      min   =   0,
      max   = 100,
      step  =   5,
      value =   0
    ),
    checkboxInput(
      'normHD',
      label = 'Normal fit',
      value = TRUE
    ),

    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'regHD',
          label = 'Plot trend line',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'cthdDegree',
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
      'corTrendHD',
      label = 'Correct trend',
      value = FALSE
    ),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'baHD',
          label = 'Bland-Altmann',
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          'baCI',
          label = '95 % CIs',
          value = FALSE
        )
      )
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
    )
  ),
  mainPanel(
    width = mainWidth,
    plotlyOutput("plotlyHistDist",
                 width  = "800px",
                 height = "550px")
  )
)
