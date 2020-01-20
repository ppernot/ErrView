observe({
  output$outliersPlot <- renderPlot({
    if(is.null(input$dataFile))
      return(NULL)

    order  = 1:ncol(Errors)
    if(input$clusterParaPlot)
      order = hclust(dist(t(Errors)))$order

    lab.thresh = 0
    labels = NULL
    if(input$scaleParaPlot){
      lab.thresh = 2
      labels = systems
    }

    gpLoc = gPars
    gpLoc$pty = 'm'
    plotParallel(
      Errors[,order],
      rescale  = input$scaleParaPlot,
      scramble = input$scrambleParaPlot,
      labels   = labels,
      lab.thresh = lab.thresh,
      gPars    = gpLoc)

  },
  width  = round(plotWidth  * K()^0.5 / nomSize),
  height = plotHeight
  )
})
# output$outliersPlot <- renderParcoords({
#   if(is.null(input$dataFile))
#     return(NULL)
#
#   order  = 1:ncol(Errors)
#   if(input$clusterParaPlot)
#     order = hclust(dist(t(Errors)))$order
#
#   # lab.thresh = 0
#   # labels = NULL
#   # if(input$scaleParaPlot){
#   #   lab.thresh = 2
#   #   labels = systems
#   # }
#
#   # hcparcords( head(data.frame(Errors),10) )
#   df = Errors[,order]
#   if(input$scaleParaPlot)
#     df = apply(df,2,scale)
#
#   parcoords(
#     data.frame(df),
#     rownames = FALSE,
#     brushMode = "1d-axes",
#     color = list(
#       colorBy = colnames(Errors)[1],
#       colorScale = "scaleDiverging",
#       colorScheme = "interpolateSpectral"
#     ),
#     withD3 = TRUE
#   )
#
# })
