outSel <- reactiveVal()
observe({
  output$outliersPlot <- renderPlot({
    validate(
      need(
        !is.null(input$dataFile),
        'Please choose a datafile !'
      ),
      need(
        K() > 1,
        'Requires more than one error set !'
      )
    )

    order  = 1:ncol(Errors)
    if(input$clusterParaPlot)
      order = hclust(dist(t(Errors)))$order
    X = Errors[,order]

    lab.thresh = 0
    labels = rownames(X)
    if(input$scaleParaPlot){
      lab.thresh = input$labelParaPlot
    }

    gpLoc = gPars
    gpLoc$pty = 'm'
    out = ErrViewLib::plotParallel(
      X,
      rescale  = input$scaleParaPlot,
      scramble = input$scrambleParaPlot,
      labels   = labels,
      units    = dataUnits(),
      lab.thresh = lab.thresh,
      outliers = input$outliersParaPlot,
      gPars    = gpLoc)

    outSel(NULL)
    if(input$outliersParaPlot != "no")
      outSel(out)
  },
  width  = min(plotWidth,round(plotWidth  * K()^0.5 / nomSize)),
  height = plotHeight
  )
})
