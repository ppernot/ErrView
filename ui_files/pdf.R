sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("ECDF"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "absErrPDF",
          label = "Absolute Errors",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "remGlobOutPDF",
          label = "Remove glob. outl.",
          value = FALSE
        )
      )
    ),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "showMSEPDF",
          label = "Show Mean",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "showQ95PDF",
          label = "Show Q95",
          value = FALSE
        )
      )
    ),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendPDF',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'ctDegreePDF',
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
        width = 6,
        checkboxInput(
          "fillPDF",
          label = "Fill curves",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "fixColorsPDF",
          label = "Fix colors",
          value = TRUE
        )
      )
    ),
    sliderInput(
      'adjBwPDF',
      label = 'Adjust bandwidth',
      min = 0.1,
      max = 2.0,
      step = 0.1,
      value = 1
    ),
    hr( style="border-color: #666;"),
    uiOutput("methodsPDF")
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "plotPDF",
      dblclick = "PDF_dblclick",
      brush = brushOpts(
        id = "PDF_brush",
        resetOnNew = TRUE
      )
    )
  )
)
