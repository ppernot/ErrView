sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Lorenz Curves"),
    hr( style="border-color: #666;"),
    checkboxInput(
      "corTrendLorenz",
      label = "Correct trend",
      value = FALSE
    ),
    checkboxInput(
      "lorenzNorm",
      label = "Normal curve",
      value = FALSE
    ),
    checkboxInput(
      "giniVsLAC",
      label = "Gini vs. LAC",
      value = FALSE
    ),
    hr( style="border-color: #666;"),
    uiOutput("methodsLorenz")
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "plotLorenz"#,
      # dblclick = "Lorenz_dblclick",
      # brush = brushOpts(
      #   id = "Lorenz_brush",
      #   resetOnNew = TRUE
      # )
    )
  )
)
