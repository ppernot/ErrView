observe({
  output$outliersPlot <- renderPlot({
    if(is.null(input$dataFile))
      return(NULL)

    order  = 1:ncol(Errors)
    if(input$clusterParaPlot)
      order = hclust(dist(t(Errors)))$order

    plotParallel(
      Errors[,order],
      rescale  = input$scaleParaPlot,
      scramble = input$scrambleParaPlot,
      labels   = systems,
      gPars    = gPars)

  },
  width  = plotWidth, #round(plotWidth  * K()^0.5 / nomSize),
  height = plotHeight
  )
})
