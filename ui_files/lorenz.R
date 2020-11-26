sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Lorenz Curves"),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          "giniVsLAC",
          label = "Gini vs. LAC",
          value = FALSE
        )
      ),
      column(
        width = 6,
        checkboxInput(
          "remGlobOutLorenz",
          label = "Remove glob. outl.",
          value = FALSE
        )
      )
    ),
    # hr( style="border-color: #666;"),
    fixedRow(
      column(
        width = 6,
        checkboxInput(
          'corTrendLorenz',
          label = 'Correct trend',
          value = FALSE
        )
      ),
      column(
        width = 6,
        numericInput(
          'ctlDegree',
          label = 'Trend degree',
          value = 0,
          min   = 0,
          max   = 2,
          step  = 1,
          width = '100px'
        )
      )
    ),
    # hr( style="border-color: #666;"),
    fixedRow(
      column(
        6,
        checkboxInput(
          "identGridLorenz",
          label = "Identity grid",
          value = FALSE
        )
      ),
      column(
        6,
        checkboxInput(
          "lorenzNorm",
          label = "Normal curve",
          value = TRUE
        )
      )
    ),
    checkboxInput(
      "varLorenz",
      label = "Var-based",
      value = FALSE
    ),
    hr( style="border-color: #666;"),
    fixedRow(
      column(
        6,
        uiOutput("methodsLorenz")
      ),
      column(
        6,
        actionButton(
          "lorenzCheckAll",
          label = "Check All"
        ),
        br(),br(),
        actionButton(
          "lorenzCheckNone",
          label = "Reset"
        )
      )
    )
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
