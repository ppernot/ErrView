
output$methodsPDF <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  checkboxGroupInput(
    "selMethPDF",
    label = "Choose methods",
    choiceNames = methList,
    choiceValues = methList,
    selected = methList[1]
  )

})
rangesPDF <- reactiveValues(x = NULL, y = NULL)
output$plotPDF <- renderPlot({
  if(is.null(input$dataFile)) {
    validate(
      need(
        !is.null(input$dataFile),
        'Please choose a datafile !'
      )
    )
    return()
  }

  if(!is.null(outSel())&
     input$remGlobOutPDF) {
    Errors = Errors[ !outSel(), ]
    Data   = Data[ !outSel(), ]
  }

  # Local set of colors
  gpLoc = gPars
  if(input$fixColorsPDF)
    nMeth = length(methList)
  else
    nMeth = length(input$selMethPDF)
  gpLoc$cols     = rev(inlmisc::GetColors(nMeth+1))[1:nMeth]
  gpLoc$cols_tr  = rev(inlmisc::GetColors(nMeth+1, alpha = 0.1))[1:nMeth]
  gpLoc$cols_tr2 = rev(inlmisc::GetColors(nMeth+1, alpha = 0.4))[1:nMeth]

  # Maximize plot space
  gpLoc$pty      = 'm'

  Errors = Errors[ ,input$selMethPDF, drop = FALSE]
  Data   = Data[ ,input$selMethPDF, drop = FALSE]

  if (input$corTrendPDF)
    Errors = trendCorr(Data, Errors, input$ctDegreePDF)

  if (is.null(rangesPDF$x)) {
    if (input$absErrPDF)
      xmin = 0
    else
      xmin = min(Errors) - 0.1 * abs(min(Errors))
    xmax = max(Errors) + 0.1 * abs(max(Errors))
  } else {
    xmin = rangesPDF$x[1]
    xmax = rangesPDF$x[2]
  }
  plotPdf(
    Errors,
    absErrors = input$absErrPDF,
    adjust    = input$adjBwPDF,
    xlab      = NULL,
    xmin      = xmin,
    xmax      = xmax,
    title     = '',
    show.leg  = TRUE,
    show.MSE  = input$showMSEPDF,
    show.Q95  = input$showQ95PDF,
    col.index = if(input$fixColorsPDF)
                  which(methList %in% input$selMethPDF)
                else
                  1:nMeth,
    weights   = NULL,
    units     = dataUnits(),
    label     = 0,
    leg.lwd   = 10,
    fill      = input$fillPDF,
    gPars     = gpLoc)
},
width = plotWidth, height = plotHeight)

observeEvent(input$PDF_dblclick, {
  brush <- input$PDF_brush
  if (!is.null(brush)) {
    rangesPDF$x <- c(brush$xmin, brush$xmax)
    rangesPDF$y <- c(brush$ymin, brush$ymax)
  } else {
    rangesPDF$x <- NULL
    rangesPDF$y <- NULL
  }
})
