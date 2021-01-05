output$methodsQQ <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  selectInput(
    "selMethQQ",
    label = "Select method",
    choices = methList,
    multiple = FALSE
  )

})
output$plotQQ <- renderPlot({
  validate(
    need(
      !is.null(input$dataFile),
      'Please choose a datafile !'
    )
  )

  if(!is.null(outSel()) &
     input$removeGlobOutQQ)
    Errors = Errors[ !outSel(), ]

  X = Errors[ ,input$selMethQQ]

  ErrViewLib::plotZscoreQqnorm(
    R = scale(X, center = TRUE, scale = TRUE),
    sig = 1,
    lim = input$limQQ,
    plotCI = input$ciQQ,
    plotReg = input$regQQ,
    # markOutliers = input$moQQ,
    # labels = systems,
    title = 'Centered and scaled errors',
    gPars = gPars
  )
},
width = plotWidth, height = plotHeight)
