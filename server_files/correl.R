observe({
  output$correlPlot <- renderPlot({
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

    data   = input$corSample
    order  = 'original'
    if(input$dendro)
      order = 'hclust'

    method = input$corMethod
    # margin = input$corMargin

    if (data == "data") {

      if(!is.null(outSel()))
        Data = Data[ !outSel(), ]
      cmat = cor(Data, method = method)

    } else if (data == "errors") {

      if(!is.null(outSel()))
        Errors = Errors[ !outSel(), ]
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

    plotCorMat(
      X = cmat,
      order = order,
      cex.lab = input$corCexLab,
      gPars = gPars
    )

  },
  # Best with square plot, except for small matrices
  width  = max(300,round(plotHeight * K()^0.5 / nomSize)),
  height = max(200,round(plotHeight * K()^0.5 / nomSize))
  )
})
