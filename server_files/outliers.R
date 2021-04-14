outSel <- reactiveVal(NULL)
rangesOutliers <- reactiveValues(x = NULL, y = NULL)
observeEvent(input$outliers_dblclick, {
  brush <- input$outliers_brush
  if (!is.null(brush)) {
    rangesOutliers$x <- c(brush$xmin, brush$xmax)
    rangesOutliers$y <- c(brush$ymin, brush$ymax)
  } else {
    rangesOutliers$x <- NULL
    rangesOutliers$y <- NULL
  }
})
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

    if (input$corTrendOut)
      Errors = trendCorr (Data, Errors, input$ctoDegree)

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

    if (is.null(rangesOutliers$x)) {
      xlim = NULL
    } else {
      xlim = rangesOutliers$x
    }

    if (is.null(rangesOutliers$y)) {
      ylim = NULL
    } else {
      ylim = rangesOutliers$y
    }

    out = ErrViewLib::plotParallel(
      X,
      xlim = xlim,
      ylim = ylim,
      rescale  = input$scaleParaPlot,
      scramble = input$scrambleParaPlot,
      labels   = labels,
      units    = dataUnits(),
      outLabCex = input$outliersCexLab,
      outMethCex = input$outliersCexMeth,
      lab.thresh = lab.thresh,
      outliers = input$outliersParaPlot,
      gPars    = gpLoc)

    out0 = outSel()
    if(!identical(out,out0) &
       input$outliersParaPlot != "no")
      outSel(out)
  },
  width  = min(1000,max(300,round(plotWidth  * K()^0.5 / nomSize))),
  height = plotHeight
  )
})


