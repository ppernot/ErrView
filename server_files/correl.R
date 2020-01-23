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
      if(is.null(bsList()) |
         is.null(bsList()$mue)) {
        S = estBS1 (Errors,
                    props  = "mue",
                    do.sip = FALSE,
                    silent = TRUE)
      } else {
        S = bsList()
      }
      cmat = S$mue$corr
    } else {
      if(is.null(bsList()) |
         is.null(bsList()$q95hd)) {
        S = estBS1 (Errors,
                    props  = "q95hd",
                    do.sip = FALSE,
                    silent = TRUE)
      } else {
        S = bsList()
      }
      cmat = S$q95hd$corr
    }

    plotCorMat(X = cmat, order = order, gPars=gPars)

  },
  width  = round(plotWidth  * K()^0.5 / nomSize),
  height = round(plotHeight * K()^0.5 / nomSize)
  )
})
