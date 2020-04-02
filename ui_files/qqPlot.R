sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Errors vs. Normal"),
    hr( style="border-color: #666;"),
    uiOutput("methodsQQ"),
    hr( style="border-color: #666;"),
    checkboxInput(
      'removeGlobOutQQ',
      label = 'Remove glob. outl.',
      value = FALSE
    ),
    checkboxInput(
      'regQQ',
      label = 'Inter-quartile Reg. line',
      value = FALSE
    ),
    checkboxInput(
      'ciQQ',
      label = 'Confidence interval',
      value = FALSE
    ),
    # checkboxInput(
    #   'moQQ',
    #   label = 'Mark QQ outliers',
    #   value = FALSE
    # ),
    sliderInput(
      'limQQ',
      label = 'Range of plot',
      min   =   0,
      max   =   8,
      step  =   1,
      value =   5
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput("plotQQ")
  )
)
