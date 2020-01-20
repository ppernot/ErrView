observe({
  output$sipPlot <- renderPlot({
    if(is.null(input$dataFile))
      return(NULL)

    S = estBS2 (Errors,
                props = "mse",
                est.corr = FALSE,
                est.sip  = TRUE,
                nboot = 1000)
    plotSIPMat(
      S$sip,
      gPars = gPars)

  },
  width  = round(plotWidth  * K()^0.5 / nomSize),
  height = round(plotHeight * K()^0.5 / nomSize)
  )
})
