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
    textInput(
      "units",
      label = "Units",
      value = 'a.u.'
    ),
    checkboxInput(
      "useRelative",
      label = "Swich to relative errors",
      value = FALSE
    ),
    hr( style="border-color: #666;"),
    wellPanel(
      h5("Author      : P. Pernot"),
      h5("Affiliation : CNRS"),
      h5(paste0("Version     : ",version)),
      hr( style="border-color: #666;"),
      a(href="https://ppernot.github.io/ErrView","User's Manual"),
      br(),
      a(href="https://github.com/ppernot/ErrView","How to cite"),
      br(),
      a(href="https://github.com/ppernot/ErrView","code@github"),
      br(),
      a(href="https://github.com/ppernot/ErrView/issues",
        "Bug report, Feature request")
    )
  ),
  mainPanel(
    width = mainWidth,
    verbatimTextOutput("selectMsg"),
    htmlOutput("howTo"),
  )
)
