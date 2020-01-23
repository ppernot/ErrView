observe({
  output$sipPlot <- renderPlot({
    if(is.null(input$dataFile))
      return(NULL)

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
