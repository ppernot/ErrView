sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Delta CDF of |Err|"),
    hr( style="border-color: #666;"),
    uiOutput("methodsDelta")
  ),
  mainPanel(
    width = mainWidth,
    plotOutput("plotDelta")
  )
)
