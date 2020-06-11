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
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'untUQ',
          label = 'Correct trend',
          value = FALSE
        )
      ),
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
      )
    ),
    fixedRow(
      column(
        width = 6,
        radioButtons(
          'qrMeth',
          label = 'QReg method',
          inline = TRUE,
          choices = c(
            'br'    = 'br',
            'lasso' = 'lasso'
          ),
          selected = 'lasso'
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
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'qLoc',
          label = 'Local quantiles',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'nbSubsets',
          label = '# subsets',
          value = 5,
          min = 1,
          max = 10,
          step = 1,
          width = '100px'
        )
      )
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
    plotOutput(
      "plotUQ"
    )
  )
)
