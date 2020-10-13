sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Statistics"),
    hr( style="border-color: #666;"),
    checkboxGroupInput(
      "statsChoice",
      label = "Choose stats:",
      choices = list(
        'MUE'     = 'mue',
        'Q95'     = 'q95',
        'Q95(HD)' = 'q95hd',
        'MSE'     = 'mse',
        'RMSD'    = 'rmsd',
        'MAD_SD'  = 'mad_sd',
        'Skew'    = 'skew',
        'Kurt'    = 'kurt',
        'W'       = 'W',
        'Gini'    = 'gini',
        'LAC'     = 'lasym'
        ),
      selected = c('mue','q95hd','mse','rmsd')
    ),
    checkboxInput(
      "sipChoice",
      label = "SIP analysis",
      value = TRUE
    ),
    checkboxInput(
      "pinvChoice",
      label = "Inversion Proba",
      value = TRUE
    ),
    actionButton(
      "genStats",
      label = "Generate",
      icon = icon('cog')
    )
  ),
  mainPanel(
    width = mainWidth,
    verbatimTextOutput("outStatsMsg"),
    shinycssloaders::withSpinner(
      DTOutput("outStats"),
      type = 4
    )
  )
)
