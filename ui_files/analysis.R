sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Ranking Probability"),
    hr( style="border-color: #666;"),
    radioButtons(
      "baType",
      label = "Plot type",
      choices = list(
        "Levels" = "levels",
        "CI"     = "ci"
      )
    ),
    radioButtons(
      "stat",
      label   = "Statistic",
      choices = list(
        "MUE"  = "mue",
        "Q95"  = "q95hd",
        "MSIP" = "msip"
      )
    ),
    sliderInput(
      "bsSizeRatio",
      label = "Bootstrap M/N",
      min = 0,
      max = 1,
      value = 1,
      step = 0.1
    )
  ),
  mainPanel(
    width = mainWidth,
    plotOutput(
      "benchAuthority",
      inline = TRUE
    )
  )
)
