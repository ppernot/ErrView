observe({
  output$benchAuthority <- renderPlot({
    if(is.null(input$dataFile))
      return(NULL)

    bsR = input$bsSizeRatio

    figRank(
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
