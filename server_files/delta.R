output$methodsDelta <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  tagList(
    selectInput(
      "selMethDelta1",
      label = "Choose Meth 1",
      choices = methList,
      multiple = FALSE
    ),
    selectInput(
      "selMethDelta2",
      label = "Choose Meth 2",
      choices = methList,
      selected = methList[2],
      multiple = FALSE
    )
  )

})
output$plotDelta <- renderPlot({
  if(is.null(input$dataFile)) {
    validate(
      need(
        !is.null(input$dataFile),
        'Please choose a datafile !'
      )
    )
    return()
  }

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
