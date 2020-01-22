sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Select Data FIle"),
    hr( style="border-color: #666;"),
    fileInput(
      "dataFile",
      label = "Choose CSV File",
      multiple = FALSE,
      accept = c(
        "text/csv",
        "text/comma-separated-values,text/plain",
        ".csv")
    ),
    checkboxInput(
      "useRelative",
      label = "Swich to relative errors",
      value = FALSE
    )
  ),
  mainPanel(
    width = mainWidth,
    verbatimTextOutput("selectMsg")
  )
)
