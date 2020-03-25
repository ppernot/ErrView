output$methodsDelta <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)
  if(length(methList) < 2)
    return(NULL)

  meth1 = 1
  meth2 = 2
  # If possible, pick first method as reference (lowest MUE)
  if(!is.null(bsList())) {
    S = bsList()
    if(!is.null(S$mue)) {
      meth1 = which.min(S$mue$val)
      if(meth1 == 2)
        meth2 = 1
    }
  }

  tagList(
    selectInput(
      "selMethDelta1",
      label = "Choose Meth 1",
      choices = methList,
      selected = methList[meth1],
      multiple = FALSE
    ),
    selectInput(
      "selMethDelta2",
      label = "Choose Meth 2",
      choices = methList,
      selected = methList[meth2],
      multiple = FALSE
    )
  )

})
output$plotDelta <- renderPlot({
  validate(
    need(
      !is.null(input$dataFile),
      'Please choose a datafile !'
    ),
    need(
      length(methList) > 1,
      'Requires more than one error set !'
    )
  )
  validate(
    need(
      input$selMethDelta1 != input$selMethDelta2,
      'Please choose two different methods !'
    )
  )

  if(!is.null(outSel()))
    Errors = abs(Errors[ !outSel(), ])

  gpLoc = gPars
  gpLoc$mar = c(3, 3, 1.5, 1)
  gpLoc$pty = 'm'

  ErrViewLib::plotDeltaCDF(
    Errors,
    input$selMethDelta1,
    input$selMethDelta2,
    eps   = NULL,
    xmax  = NULL,
    xlab  = NULL,
    units = dataUnits(),
    main  = '',
    nboot = 1000,
    label = 0,
    gPars     = gpLoc
  )
},
width = plotWidth, height = plotHeight)
