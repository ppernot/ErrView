output$methodsHD <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  selectInput(
    "selMethHD",
    label = "Select method",
    choices = methList,
    multiple = FALSE
  )

})
output$plotHistDist <- renderPlot({
  validate(
    need(
      !is.null(input$dataFile),
      'Please choose a datafile !'
    )
  )

  if(!is.null(outSel()) &
     input$removeGlobOut) {
    Errors = Errors[ !outSel(), ]
    Data   = Data[ !outSel(), ]
    systems= systems[ !outSel() ]
  }

  gpLoc = gPars
  gpLoc$pty = 'm'

  x = Data[ ,input$selMethHD,drop = FALSE]
  y = Errors[ ,input$selMethHD,drop = FALSE]

  if (input$corTrendHD)
    y = trendCorr(x, y, input$cthdDegree)

  nclass = input$nbClass
  if(nclass == 0)
    nclass = nclass.scott(y)

  plotDistHist(
    unlist(x), unlist(y),
    uy        = NULL,
    nclass    = nclass,       # Nb class for histogram
    xlab      = paste0('Data [',dataUnits(),']'),
    ylab      = paste0('Errors [',dataUnits(),']'),
    plotGauss = input$normHD, # Plot Gaussian fit of hist.
    outLiers  = input$outHD,  # Mark outliers
    p         = 0.95,         # Width of proba interval to detect outliers
    labels    = systems,
    select    = NULL,         # Indices of points to colorize
    main      = input$selMethHD,
    plotReg   = input$regHD,  # Regression line
    plotConf  = input$regHD,  # Confidence limits on reg-line
    degree    = if(input$corTrendHD) 1 else input$cthdDegree,
                 # Basic trend line if already corrected
    plotBA    = input$baHD,   # Bland-Altman LOAs
    plotBAci  = input$baCI,   # 95% CI on Bland-Altman LOAs
    xlim      = c(min(x),1.1*max(x)),# Leave space for labels
    ylim      = if(input$yScale) range(Errors) else range(y),
    scaleLegBA= 1,
    gPars     = gpLoc
  )
},
width = plotWidth, height = plotHeight)

output$plotlyHistDist <- renderPlotly({
  validate(
    need(
      !is.null(input$dataFile),
      'Please choose a datafile !'
    ),
    need(
      !is.null(input$selMethHD) &
        input$selMethHD %in% methList,
      'Please choose a method !'
    )
  )

  if(!is.null(outSel()) &
     input$removeGlobOut) {
    Errors  = Errors[ !outSel(), ]
    Data    = Data[ !outSel(), ]
    systems = systems[ !outSel() ]
  }

  gpLoc = gPars
  gpLoc$pty = 'm'

  x = Data[ ,input$selMethHD,drop = FALSE]
  y = Errors[ ,input$selMethHD,drop = FALSE]

  if (input$corTrendHD)
    y = trendCorr(x, y, input$cthdDegree)

  nclass = input$nbClass
  if(nclass == 0)
    nclass = nclass.FD(unlist(y))

  plotlyDistHist(
    unlist(x), unlist(y),
    uy        = NULL,
    nclass    = nclass,       # Nb class for histogram
    xlab      = paste0(input$selMethHD,' Data [',dataUnits(),']'),
    ylab      = paste0('Errors [',dataUnits(),']'),
    plotGauss = input$normHD, # Plot Gaussian fit of hist.
    outLiers  = input$outHD,  # Mark outliers
    p         = 0.95,         # Width of proba interval to detect outliers
    labels    = systems,
    select    = NULL,         # Indices of points to colorize
    # main      = input$selMethHD,
    plotReg   = input$regHD,  # Regression line
    plotConf  = input$regHD,  # Confidence limits on reg-line
    degree    = if(input$corTrendHD) 1 else input$cthdDegree,
    # Basic trend line if already corrected
    plotBA    = input$baHD,   # Bland-Altman LOAs
    plotBAci  = input$baCI,   # 95% CI on Bland-Altman LOAs
    xlim      = c(min(x),1.1*max(x)),# Leave space for labels
    ylim      = if(input$yScale) range(Errors) else range(y),
    scaleLegBA= 1,
    gPars     = gpLoc
  )
})
