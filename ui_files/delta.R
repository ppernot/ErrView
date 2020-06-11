sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Delta CDF of |Err|"),
    hr( style="border-color: #666;"),
    uiOutput("methodsDelta")#,
    # hr( style="border-color: #666;"),
    # sliderInput(
    #   "scaleDelta",
    #   label = "Scale X axis",
    #   min = 0,
    #   max = 1,
    #   step = 0.1,
    #   value = 1
    # )
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
