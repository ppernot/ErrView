sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Statistics"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width=6,
        checkboxGroupInput(
          "statsChoice",
          label = "Choose stats:",
          choices = list(
            'MUE'     = 'mue',
            'Q95'     = 'q95',
            'Q95(HD)' = 'q95hd',
            'MSE'     = 'mse',
            'HR-Mode' = 'hrmode',
            'HS-Mode' = 'hsmode',
            'RMSD'    = 'rmsd',
            'MAD_SD'  = 'mad_sd',
            'Skew'    = 'skew',
            'SkewGM'  = 'skewgm',
            'Kurt'    = 'kurt',
            'KurtCS'  = 'kurtcs',
            'W'       = 'W',
            'Gini'    = 'gini',
            'GMCF'    = 'gimc',
            'LAC'     = 'lasym',
            'Pietra'  = 'pietra',
            'Zanardi' = 'Zanardi'
          ),
          selected = c('mue','q95hd','mse','rmsd','gimc')
        ),
        checkboxInput(
          "sipChoice",
          label = "SIP analysis",
          value = FALSE
        )
      ),
      column(
        width =6,
        actionButton(
          "genStats",
          label = "Generate",
          icon = icon('cog')
        ),
        hr(style="border-color: #666;"),
        strong('Uncertainty'),
        checkboxInput(
          "formUnc",
          label = "Compact",
          value = TRUE
        ),
        numericInput(
          'numDig',
          label = 'Digits',
          value = 1,
          min   = 1,
          max   = 2,
          step  = 1,
          width = '100px'
        ),
        hr(style="border-color: #666;"),
        strong('Trends'),
        checkboxInput(
          'corTrendStat',
          label = 'Correct',
          value = FALSE
        ),
        numericInput(
          'ctsDegree',
          label = 'Trend degree',
          value = 0,
          min   = 0,
          max   = 2,
          step  = 1,
          width = '100px'
        ),
        hr(style="border-color: #666;"),
        checkboxInput(
          "pinvChoice",
          label = "Show Pinv",
          value = TRUE
        )
      )
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
