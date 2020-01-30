output$methodsHD <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  selectInput(
    "selMethHD",
    label = "Choose a method",
    choices = methList,
    multiple = FALSE
  )

})
output$plotHistDist <- renderPlot({
  if(is.null(input$dataFile)) {
    validate(
      need(
        !is.null(input$dataFile),
        'Please choose a datafile !'
      )
    )
    return()
  }

  if(!is.null(outSel()) &
     input$removeGlobOut) {
    Errors = Errors[ !outSel(), ]
    Data   = Data[ !outSel(), ]
    systems= systems[ !outSel() ]
  }

  gpLoc = gPars
  gpLoc$pty = 'm'

  x = Data[ ,input$selMethHD]
  y = Errors[ ,input$selMethHD]

  nclass = input$nbClass
  if(nclass == 0)
    nclass = nclass.Sturges(y)

  plotDistHist(
    x, y,
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
    plotBA    = input$baHD,   # Bland-Altman LOAs
    plotBAci  = input$baHD,   # 95% CI on Bland-Altman LOAs
    xlim      = c(min(x),1.1*max(x)),# Leave space for labels
    ylim      = if(input$yScale) range(Errors) else range(y),
    scaleLegBA= 1,
    gPars     = gpLoc
  )
},
width = plotWidth, height = plotHeight)
