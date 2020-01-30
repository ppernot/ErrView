sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Systematic Improvement\n Probability Matrix"),
    hr( style="border-color: #666;")
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
