observe({
  output$sipPlot <- renderPlot({
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

    if(is.null(bsList())) {
      # Populate bsList
      S = estBS1 (Errors,
                  props  = "mse",
                  do.sip = TRUE,
                  silent = TRUE)
      bsList(S)
    } else if(is.null(bsList()$sip)) {
      # Update bsList
      S = bsList()
      S0 = estBS1 (Errors,
                  props  = "mse",
                  do.sip = TRUE,
                  silent = TRUE)
      S$sip = S0$sip
      bsList(S)
    } else {
      # Load bsList
      S = bsList()
    }

    plotSIPMat(
      S$sip,
      gPars = gPars)

  },
  width  = round(plotWidth  * K()^0.5 / nomSize),
  height = round(plotHeight * K()^0.5 / nomSize)
  )
})
