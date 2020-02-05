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
      cex.lab   = input$rankCexLab,
      M         = round(nrow(Errors)*bsR),
      gPars     = gPars)

  },
  # Best with square plot, except for small matrices
  width  = max(300,round(plotHeight * K()^0.5 / nomSize)),
  height = max(200,round(plotHeight * K()^0.5 / nomSize))
  )
})
