sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Statistics"),
    hr( style="border-color: #666;"),
    checkboxGroupInput(
      "statsChoice",
      label = "Choose stats:",
      choices = list(
        'MUE'  = 'mue',
        'Q95'  = 'q95',
        'Q95(HD)' = 'q95hd',
        'MSE'  = 'mse',
        'RMSD' = 'rmsd'
        ),
      selected = c('mue','q95hd')
    ),
    checkboxInput(
      "sipChoice",
      label = "SIP analysis",
      value = FALSE
    ),
    checkboxInput(
      "pinvChoice",
      label = "Inversion Proba",
      value = FALSE
    ),
    actionButton(
      "genStats",
      label = "Generate",
      icon = icon('cog')
    )
  ),
  mainPanel(
    width = mainWidth,
    verbatimTextOutput("outStats")#,
    # plotOutput("plotECDF")
  )
)
