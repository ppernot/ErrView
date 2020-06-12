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
rangesDelta <- reactiveValues(x = NULL, y = NULL)
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

  if (is.null(rangesDelta$x)) {
    xmin = NULL
    xmax = NULL
  } else {
    xmin = rangesDelta$x[1]
    xmax = rangesDelta$x[2]
  }

  ErrViewLib::plotDeltaCDF(
    Errors,
    input$selMethDelta1,
    input$selMethDelta2,
    eps   = NULL,
    xmin  = xmin,
    xmax  = xmax,
    xlab  = NULL,
    units = dataUnits(),
    main  = '',
    nboot = 1000,
    label = 0,
    showSIP  = input$showSIP,
    showMLG  = input$showMLG,
    showDmue = input$showDmue,
    showCI = input$showCI,
    gPars     = gpLoc
  )
},
width = plotWidth, height = plotHeight)

observeEvent(input$Delta_dblclick, {
  brush <- input$Delta_brush
  if (!is.null(brush)) {
    rangesDelta$x <- c(brush$xmin, brush$xmax)
    rangesDelta$y <- c(brush$ymin, brush$ymax)
  } else {
    rangesDelta$x <- NULL
    rangesDelta$y <- NULL
  }
})
