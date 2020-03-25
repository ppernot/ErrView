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

     if(is.null(bsList()) |
       is.null(bsList()$sip)) {
      S = estBS1 (Errors,
                  props  = "mse",
                  do.sip = TRUE,
                  silent = TRUE)
    } else {
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
