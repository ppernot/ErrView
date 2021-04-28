# Ranges of plot limits for dendrograms
# (PCA requires a scaling yet to be found...)
rangesPCA <- reactiveValues(x = NULL, y = NULL)
observeEvent(input$pca_dblclick, {
  brush <- input$pca_brush
  if (!is.null(brush)) {
    rangesPCA$x <- c(brush$xmin, brush$xmax)
    rangesPCA$y <- c(brush$ymin, brush$ymax)
  } else {
    rangesPCA$x <- NULL
    rangesPCA$y <- NULL
  }
})

observe({
  output$edaPlot <- renderPlot({
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

    if (input$corTrendEDA)
      Errors = trendCorr (Data, Errors, input$corDegreeEDA)

    if (input$edaChoice == "pca") {
      xlim = NULL
      ylim = NULL
      ErrViewLib::plotPCA(
        Errors,
        labels = rownames(Errors),
        xlim = xlim,
        ylim = ylim,
        cex.lab = input$edaCexLab,
        gPars = gPars
      )

    } else {
      # Clustering
      if (is.null(rangesPCA$x)) {
        xlim = NULL
      } else {
        xlim = rangesPCA$x; print(xlim)
      }

      if (is.null(rangesPCA$y)) {
        ylim = NULL
      } else {
        ylim = rangesPCA$y; print(ylim)
      }

      ErrViewLib::plotClusters(
        Errors,
        type    = input$edaChoice,
        method  = input$clustMethod,
        cex.lab = input$edaCexLab,
        xlim    = xlim,
        ylim    = ylim,
        gPars = gPars
      )
    }
  },
  width  = 1.25*plotWidth, height = plotHeight
  )
})


