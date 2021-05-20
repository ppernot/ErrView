sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Delta CDF of |Err|"),
    hr( style="border-color: #666;"),
    uiOutput("methodsDelta"),
    hr( style="border-color: #666;"),
    checkboxInput(
      'showSIP',
      label = 'SIP',
      value = TRUE
    ),
    checkboxInput(
      'showMLG',
      label = 'ML & MG',
      value = TRUE
    ),
    checkboxInput(
      'showDmue',
      label = 'Delta MUE',
      value = TRUE
    ),
    checkboxInput(
      'showCI',
      label = '95 % CIs',
      value = FALSE
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "plotDelta",
      dblclick = "Delta_dblclick",
      brush = brushOpts(
        id = "Delta_brush",
        resetOnNew = TRUE
      )
    )
  )
)
