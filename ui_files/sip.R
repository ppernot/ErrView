sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Systematic Improvement\n Probability Matrix"),
    hr( style="border-color: #666;"),
    sliderInput(
      "sipCexLab",
      label = "Label size",
      min = 0,
      max = 1,
      value = 1,
      step = 0.1
    )
  ),
  mainPanel(
    width = mainWidth,
    shinycssloaders::withSpinner(
      plotOutput(
        "sipPlot",
        inline = TRUE
      ),
      type = 4
    )
  )
)
