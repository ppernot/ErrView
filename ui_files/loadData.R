sidebarLayout(
  sidebarPanel(
    width = sideWidth,
    h4("Select Errors FIle"),
    hr( style="border-color: #666;"),
    fileInput(
      "dataFile",
      label = "Choose CSV File",
      multiple = FALSE,
      accept = c(
        "text/csv",
        "text/comma-separated-values,text/plain",
        ".csv")
    )
  ),
  mainPanel(
    width = mainWidth,
    verbatimTextOutput("selectMsg")
  )
)
