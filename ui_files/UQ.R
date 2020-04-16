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
      'untUQ',
      label = 'Correct trend',
      value = FALSE
    ),
    fixedRow(
      column(
        width = 6,
        numericInput(
          'untDegree',
          label = 'Trend degree',
          value = 1,
          min = 0,
          max = 4,
          step = 1,
          width = '100px'
        )
      ),
      column(
        width = 6,
        numericInput(
          'qrDegree',
          label = 'QReg degree',
          value = 2,
          min = 0,
          max = 4,
          step = 1,
          width = '100px'
        )
      )
    ),
    radioButtons(
      'qrMeth',
      label = 'QReg method',
      inline = TRUE,
      choices = c(
        'br' = 'br',
        'lasso' = 'lasso'
      ),
      selected = 'lasso'
    ),

    checkboxInput(
      'unifxUQ',
      label = 'Uniformize abscissa',
      value = FALSE
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
