sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Improvement Proba"),
    hr( style="border-color: #666;")
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "sipPlot",
      inline = TRUE
    )
  )
)
