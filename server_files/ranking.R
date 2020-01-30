observe({
  output$benchAuthority <- renderPlot({
    if(is.null(input$dataFile)) {
      validate(
        need(
          !is.null(input$dataFile),
          'Please choose a datafile !'
        )
      )
      return()
    }

    bsR = input$bsSizeRatio

    plotRankMat(
      E         = Errors,
      score     = input$stat,
      type      = input$baType,
      show.main = FALSE,
      offset    = 0.8,
      cex.lab   = 1,
      M         = round(nrow(Errors)*bsR),
      gPars     = gPars)

  },
  width  = round(plotWidth  * K()^0.5 / nomSize),
  height = round(plotHeight * K()^0.5 / nomSize)
  )
})
