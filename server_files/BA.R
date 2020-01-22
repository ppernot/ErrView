output$methodsHistDist <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  radioButtons(
    "selMethBA",
    label = "Choose methods",
    choiceNames = methList,
    choiceValues = methList,
    selected = methList[1]
  )

})
output$plotHistDist <- renderPlot({
  if(is.null(input$dataFile))
    return(NULL)

  if(!is.null(outSel()))
    Errors = Errors[ !outSel(), ]

  gpLoc = gPars
  gpLoc$pty      = 'm'

  X = Errors[ ,input$selMethEcdf]
  plotDistHist = function(
    x,
    y,
    uy        = NULL,
    nclass    = NULL,  # Nb class for histogram
    xlab      = 'x',
    ylab      = 'y',
    plotGauss = FALSE,# Plot Gaussian fit of hist.
    outLiers  = FALSE, # Mark outliers
    p         = 0.9,   # Width of proba interval to detect outliers
    labels    = 1:length(x),
    select    = NULL,  # Indices of points to colorize
    main      = NULL,
    plotReg   = TRUE,  # Regression line
    plotConf  = FALSE, # Confidence limits on reg-line
    plotBA    = FALSE, # Bland-Altman LOAs
    plotBAci  = FALSE, # 95% CI on Bland-Altman LOAs
    xlim      = range(x),
    ylim      = range(y),
    gPars
  )
})
