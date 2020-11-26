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
        'KurtCS'  = 'kurtcs',
        'W'       = 'W',
        'Gini'    = 'gini',
        'LAC'     = 'lasym',
        'Pietra'  = 'pietra'
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
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendStat',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'ctsDegree',
          label = 'Trend degree',
          value = 0,
          min   = 0,
          max   = 2,
          step  = 1,
          width = '100px'
        )
      )
    ),
    hr( style="border-color: #666;"),
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
