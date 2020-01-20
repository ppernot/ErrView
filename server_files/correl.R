observe({
  output$correlPlot <- renderPlot({
    if(is.null(input$dataFile))
      return(NULL)

    data   = input$corSample
    order  = 'original'
    if(input$dendro)
      order = 'hclust'

    method = input$corMethod
    # margin = input$corMargin

    if (data == "data") {
      cmat = cor(Errors, method = method)
    } else if (data == "mue") {
      S = estBS2 (Errors,
                  props = 'mue',
                  est.corr = TRUE,
                  est.sip = FALSE,
                  nboot = 1000)
      cmat = S$mue$corr
    } else {
      S = estBS2 (Errors,
                  props = 'q95hd',
                  est.corr = TRUE,
                  est.sip = FALSE,
                  nboot = 1000)
      cmat = S$q95hd$corr
    }

    plotCorMat(X = cmat, order = order, gPars=gPars)

  },
  width  = round(plotWidth  * K()^0.5 / nomSize),
  height = round(plotHeight * K()^0.5 / nomSize)
  )
})
