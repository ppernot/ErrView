# # Ranges of plot limits for dendrograms
# # (PCA requires a scaling yet to be found...)
# rangesPCA <- reactiveValues(x = NULL, y = NULL)
# observeEvent(input$pca_dblclick, {
#   brush <- input$pca_brush
#   if (!is.null(brush)) {
#     rangesPCA$x <- c(brush$xmin, brush$xmax)
#     rangesPCA$y <- c(brush$ymin, brush$ymax)
#   } else {
#     rangesPCA$x <- NULL
#     rangesPCA$y <- NULL
#   }
# })
plotSimMat = function(
  X,
  eps = 1,
  p = 0.95,
  type   = c("methods","systems"),
  method = c("complete","single"),
  view   = c("matrix","cluster"),
  simabs = FALSE,
  reduce =  FALSE,
  cex.lab = 1,
  nb = 500,
  pclust = 0.95,
  gPars = gPars
) {

  type   = match.arg(type)
  method = match.arg(method)
  view   = match.arg(view)

  # Expose gPars list
  for (n in names(gPars))
    assign(n, rlist::list.extract(gPars, n))

  par(
    mfrow = c(1,1),
    mgp = mgp,
    pty = "m",
    mar = c(4,mar[2:3],2),
    tcl = tcl,
    cex = cex,
    lwd = lwd
  )

  if(type == "systems")
    X = t(X)
  N = ncol(X)

  if(simabs)
    X = abs(X)

  # Build similarity matrix
  Sim = matrix(0,N,N)
  for (i in 1:N)
    for (j in 1:i) {
      Sim[i,j] = mean(abs(X[,i]-X[,j]) <= eps)
      Sim[j,i] = Sim[i,j]
    }
  rownames(Sim) = colnames(Sim) = colnames(X)

  # Filter and reduce matrix
  if(p >0) {
    Sim[Sim<p] = 0
    if(reduce) {
      sel = which(rowSums(Sim) > 1)
      validate(
        need(
          length(sel) > 0,
          "Threshold to high: no methods left !"
        )
      )
      Sim = Sim[sel,sel]
    }
  }

  # Plot output

  if(view == "matrix") {
    order = hclust(dist(Sim))$order
    Sim = Sim[order,order]
    ErrViewLib::plotSIPMat(
      Sim,
      cex.lab = cex.lab,
      order = FALSE,
      gPars=gPars
    )

  } else {
    hc = pvclust::pvclust(
      Sim,
      method.dist = "euclidian",
      method.hclust = method,
      nboot = nb,
      parallel = TRUE,
      quiet = TRUE)
    pvclust:::plot.pvclust(
      hc,
      hang = -1,
      print.pv = "au",
      print.num = FALSE,
      cex = cex.lab
    )
    pvclust::pvrect(hc, alpha = pclust)
    out = pvclust::pvpick(hc,alpha = pclust)
    invisible(out)
  }
}
observe({
  output$simPlot <- renderPlot({
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

    if (input$corTrendSim)
      Errors = trendCorr (Data, Errors, input$corDegreeSim)

    plotSimMat(
      Errors,
      eps     = input$simEps,
      p       = input$simPcut,
      method  = input$simClustMethod,
      view    = input$simView,
      cex.lab = input$simCexLab,
      simabs  = input$simAbs,
      reduce  = input$simRed,
      gPars   = gPars
    )

  },
  width  = 1.25*plotWidth, height = plotHeight
  )
})


