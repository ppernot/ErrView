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
  if(is.null(input$dataFile))
    return(NULL)

  if(!is.null(outSel())) {
    Errors = Errors[ !outSel(), ]
    Data   = Data[ !outSel(), ]
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
    xlab      = 'Data',
    ylab      = 'Errors',
    plotGauss = input$normHD, # Plot Gaussian fit of hist.
    outLiers  = input$outHD,  # Mark outliers
    p         = 0.95,         # Width of proba interval to detect outliers
    labels    = 1:length(x),
    select    = NULL,         # Indices of points to colorize
    main      = NULL,
    plotReg   = input$regHD,  # Regression line
    plotConf  = input$regHD,  # Confidence limits on reg-line
    plotBA    = input$baHD,   # Bland-Altman LOAs
    plotBAci  = input$baHD,   # 95% CI on Bland-Altman LOAs
    xlim      = c(min(x),1.1*max(x)),
    ylim      = range(y),
    scaleLegBA= 1,
    gPars     = gpLoc
  )

})
