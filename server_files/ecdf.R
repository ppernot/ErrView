output$methodsEcdf <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  checkboxGroupInput(
    "selMethEcdf",
    label = "Choose methods",
    choiceNames = methList,
    choiceValues = methList,
    selected = methList[1]
  )

})
observeEvent(
  input$ecdfCheckAll,
  {
    updateCheckboxGroupInput(
      session,
      "selMethEcdf",
      choiceNames = methList,
      choiceValues = methList,
      selected = methList
    )
  }
)
observeEvent(
  input$ecdfCheckNone,
  {
    updateCheckboxGroupInput(
      session,
      "selMethEcdf",
      choiceNames = methList,
      choiceValues = methList,
      selected = methList[1]
    )
  }
)
rangesECDF <- reactiveValues(x = NULL, y = NULL)
output$plotECDF <- renderPlot({
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
     input$remGlobOutECDF) {
    Errors = Errors[ !outSel(), ]
    Data   = Data[ !outSel(), ]
  }

  # Local set of colors
  if(input$fixColorsEcdf)
    nMeth = length(methList)
  else
    nMeth = length(input$selMethEcdf)
  gpLoc = gPars
  gpLoc$cols     = rev(inlmisc::GetColors(nMeth+1))[1:nMeth]
  gpLoc$cols_tr  = rev(inlmisc::GetColors(nMeth+1, alpha = 0.1))[1:nMeth]
  gpLoc$cols_tr2 = rev(inlmisc::GetColors(nMeth+1, alpha = 0.4))[1:nMeth]
  gpLoc$pty      = 'm'

  Errors = Errors[ ,input$selMethEcdf, drop = FALSE]
  Data   = Data[ ,input$selMethEcdf, drop = FALSE]

  if (input$corTrendECDF)
    Errors = trendCorr(Data, Errors, input$ctecDegree)

  if (is.null(rangesECDF$x)) {
    if(input$absErrECDF) {
      xmin = 0
      xmax = max(abs(Errors))
    } else {
      xmin = min(Errors)
      xmax = max(Errors)
    }
  } else {
    xmin = rangesECDF$x[1]
    xmax = rangesECDF$x[2]
  }
  plotUncEcdf(
    Errors,
    absErrors = input$absErrECDF,
    xlab      = NULL,
    xmin      = xmin,
    xmax      = xmax,
    title     = '',
    show.leg  = TRUE,
    show.MAE  = input$showMUE,
    show.Q95  = input$showQ95,
    Q.algo    = input$Qalgo,
    col.index = if(input$fixColorsEcdf)
                  which(methList %in% input$selMethEcdf)
                else
                  1:nMeth,
    weights   = NULL,
    units     = dataUnits(),
    label     = 0,
    leg.lwd   = 10,
    gPars     = gpLoc)
},
width = plotWidth, height = plotHeight)

observeEvent(input$ECDF_dblclick, {
  brush <- input$ECDF_brush
  if (!is.null(brush)) {
    rangesECDF$x <- c(brush$xmin, brush$xmax)
    rangesECDF$y <- c(brush$ymin, brush$ymax)
  } else {
    rangesECDF$x <- NULL
    rangesECDF$y <- NULL
  }
})
