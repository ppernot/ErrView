output$methodsEcdf <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  checkboxGroupInput(
    "selMethEcdf",
    label = "Choose methods",
    choiceNames = methList,
    choiceValues = methList,
    selected = methList
  )

})
output$plotECDF <- renderPlot({
  if(is.null(input$dataFile))
    return(NULL)

  if(!is.null(outSel()))
    Errors = Errors[ !outSel(), ]

  # Local set of colors
  nMeth = length(methList)
  gpLoc = gPars
  gpLoc$cols     = rev(inlmisc::GetColors(nMeth+1))[1:nMeth]
  gpLoc$cols_tr  = rev(inlmisc::GetColors(nMeth+1, alpha = 0.1))[1:nMeth]
  gpLoc$cols_tr2 = rev(inlmisc::GetColors(nMeth+1, alpha = 0.4))[1:nMeth]
  gpLoc$pty      = 'm'

  X = abs(Errors[ ,input$selMethEcdf])
  plotUncEcdf(
    X,
    xlab      = NULL,
    xmax      = max(X)*input$scaleEcdf,
    title     = '',
    show.leg  = TRUE,
    show.MAE  = input$showMUE,
    col.index = which(methList %in% input$selMethEcdf),
    weights   = NULL,
    units     = 'a.u.',
    label     = 0,
    leg.lwd   = 10,
    gPars     = gpLoc)
})
