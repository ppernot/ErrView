observe({
  output$benchAuthority <- renderPlot({
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

    nMC   = 1000
    bsR   = input$bsSizeRatio
    M     = round(nrow(Errors)*bsR)
    score = input$stat

    # Calculate or load rank table
    if( M == nrow(Errors) ) {
      if(is.na(rankMat[[score]]$bs)) {
        tab = rankBS(Errors, score, nMC)
        rankMat[[score]]$bs <<- tab
      } else {
        tab = rankMat[[score]]$bs
      }
    } else {
      # Do not save, as M can vary
      # if(is.na(rankMat[[score]]$bs2)) {
        tab = rankBS2(Errors, score, nMC, M)
        # rankMat[[score]]$bs2 <<- tab
      # } else {
        # tab = rankMat[[score]]$bs2
      # }
    }

    plotRankMat(
      E         = Errors,
      tab       = tab,
      score     = score,
      type      = input$baType,
      show.main = FALSE,
      offset    = 0.8,
      cex.lab   = input$rankCexLab,
      M         = M,
      gPars     = gPars)

  },
  # Best with square plot, except for small matrices
  width  = max(300,round(plotHeight * K()^0.5 / nomSize)),
  height = max(200,round(plotHeight * K()^0.5 / nomSize))
  )
})
