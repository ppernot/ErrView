plotUQ = function(
  x,
  y,
  uy        = NULL,
  nclass    = NULL,  # Nb class for histogram
  xlab      = 'x',
  ylab      = 'y',
  plotGauss = FALSE, # Plot Gaussian fit of hist.
  outLiers  = FALSE, # Mark outliers
  p         = 0.9,   # Width of proba interval to detect outliers
  labels    = 1:length(x),
  select    = NULL,  # Indices of points to colorize
  main      = NULL,
  qrDegree  = 1, # Degree of polynomials
  qrMeth    = 'lasso', # default 'br'
  qrFrac    = 0.8,
  nVal      = 100,
  xlim      = range(x),
  ylim      = range(y),
  scaleLegBA = 0.75,
  scalePoints = 0.75,
  gPars
) {

  if (length(x)*length(y) == 0)
    return()

  # Expose gPars list
  for (n in names(gPars))
    assign(n, rlist::list.extract(gPars, n))

  loas = quantile(y,probs = c(0.025,0.975))

  par(
    mfrow = c(1, 1),
    mgp = mgp,
    pty = 'm',
    tcl = tcl,
    cex = cex,
    lwd = lwd
  )

  colp = cols_tr2[5]
  if (!is.null(select)) {
    y1 = y[select]
    y2 = y[!select]
    colp = rep(cols_tr2[2], length(select))
    colp[!select] = cols_tr2[5]
  }

  # Subfigure with histogram
  par(mar = c(3, 3, 1.6, 0),
      fig = c(0, 0.35, 0, 1))
  h = hist(y, nclass = nclass, plot = FALSE)
  binWidth = h$breaks[2] - h$breaks[1]
  n = length(h$counts)
  x.l = rep(0, n)
  x.r = x.l - h$counts
  y.b = h$breaks[1:n]
  y.t = h$breaks[2:(n + 1)]
  plot(
    x.l,
    y.t,
    type = 'n',
    ylim = ylim,
    ylab = ylab,
    xlim = c(-1.1 * max(h$counts), 0),
    xaxt = 'n',
    xaxs = 'i',
    xlab = ''
  )
  grid()
  rect(
    xleft = x.l,
    ybottom = y.b,
    xright = x.r,
    ytop = y.t,
    border = NA,
    col = cols_tr2[5]
  )
  if (plotGauss) {
    ym = mean(y)
    ys = sd(y)
    xg  = seq(ym - 6 * ys, ym + 6 * ys, length.out = 1000)
    yg  = dnorm(xg, ym, ys)
    yg  = yg / max(yg) * max(h$counts)
    lines(-yg, xg, col = cols[6])
  }
  abline(h = 0, lty = 3)

  if (!is.null(select)) {
    y1 = y[select]
    h = hist(y1, breaks = h$breaks, plot = FALSE)
    n = length(h$counts)
    x.l = rep(0, n)
    x.r = x.l - h$counts
    y.b = h$breaks[1:n]
    y.t = h$breaks[2:(n + 1)]
    rect(
      xleft = x.l,
      ybottom = y.b,
      xright = x.r,
      ytop = y.t,
      density = -1,
      border = NA,
      col = cols_tr2[2]
    )

    y1 = y[!select]
    h = hist(y1, breaks = h$breaks, plot = FALSE)
    n = length(h$counts)
    x.l = rep(0, n)
    x.r = x.l - h$counts
    y.b = h$breaks[1:n]
    y.t = h$breaks[2:(n + 1)]
    rect(
      xleft = x.l,
      ybottom = y.b,
      xright = x.r,
      ytop = y.t,
      density = -1,
      border = NA,
      col = cols_tr2[5]
    )
  }
  abline(h = loas, col=cols[c(2,2)])

  sk = moments::skewness(y)
  ku = moments::kurtosis(y)
  sig = sd(y)
  legend(
    'topleft', bty = 'n',
    legend = '',
    title = paste0(
      'sd   = ',signif(sig,2),'\n',
      'skew = ',signif(sk,2),'\n',
      'kurt = ',signif(ku,2),'\n',
      'CI95 = [',signif(loas[1],2),', ',signif(loas[2],2),']'
      ),
    title.col= cols[3],
    inset = 0.125, box.col = NA, bg = 'white',
    title.adj = 0
  )
  box()

  # Right plot ####
  par(
    mar = c(3, 0, 1.6, 3),
    fig = c(0.35, 1, 0, 1),
    new = TRUE
  )
  pch = 16

  # Transparent filled symbols
  if (!is.null(select)) {
    y1 = y[select]
    y2 = y[!select]
    colp = rep(cols_tr2[2], length(select))
    colp[!select] = cols_tr2[5]
  }
  plot(
    x,
    y,
    pch = pch,
    col = colp,
    xlim = xlim,
    ylim = ylim,
    xlab = xlab,
    yaxt = 'n',
    cex = scalePoints*cex,
    main = NULL
  )
  grid()
  if (!is.null(uy))
    segments(x, y - 2 * uy, x, y + 2 * uy, col = colp)
  nClass = length(unique(colp))

  abline(h = 0, lty = 3)

  # Quantile regression
  qrFor = y ~ 1
  if(qrDegree > 0)
    qrFor = as.formula(
      paste0('y ~ 1 + ',
             paste0('I(x^',1:qrDegree,')',
                    collapse = '+')
      )
    )
  qreg = quantreg::rq(
    qrFor,
    method = qrMeth,
    tau = c(0.025,0.5,0.975)
  )
  pqreg = predict(qreg)
  matlines(
    x, pqreg,
    col = cols[4],
    lwd = 3,
    lty = c(2,1,2)
  )

  # Local coverages
  ns = 5
  ls = floor(length(x)/ns)
  sel = list()
  for(i in 1:ns)
    sel[[i]] = ((i-1)*ls+1):(i*ls)

  # Prediction Interval Ratios

  pirQR = c()
  for(i in 1:ns)
    pirQR[i] = 1/mean(
      diff(quantile(y[sel[[i]]],c(0.025,0.975))) /
        (pqreg[sel[[i]],3] - pqreg[sel[[i]],1]))

  pir0 = c()
  for(i in 1:ns)
    pir0[i] = 1/mean(
      diff(quantile(y[sel[[i]]],c(0.025,0.975))) /
        (loas[2] - loas[1]))

  for(i in 1:ns) {
    icol = 6 + i%%2
    rect(min(x[sel[[i]]]),
         1.1*min(y),
         max(x[sel[[i]]]),
         1.1*max(y),
         col = cols_tr[icol],
         border=NA)
    mtext(
      signif(pir0[[i]],2),
      side = 3,
      cex  = 0.8,
      col  = cols[2],
      at   = mean(x[sel[[i]]])
    )
    mtext(
      signif(pirQR[[i]],2),
      side = 3,
      cex  = 0.8,
      col  = cols[4],
      at   = mean(x[sel[[i]]]),
      line = 1
    )
  }

  if (outLiers) {
    # Mark and label quantile-based outliers
    plow = (1 - p) / 2
    pup  = p + plow
    lab  = y > quantile(y, p = pup) | y < quantile(y, p = plow)
    if (sum(lab) > 0) {
      points(
        x = x[lab],
        y = y[lab],
        pch = 16,
        col = cols[6],
        cex = scalePoints*cex
      )
      text(
        x = x[lab],
        y = y[lab],
        labels = labels[lab],
        pos = 4
      )
    }
  }

  # Plot 95% confidence interval on reg-line
  reg = lm(y ~ 1 + x)
  indx = order(x)
  p = predict(reg, interval = 'conf')
  matlines(
    x[indx],
    p[indx, ],
    col = cols[3],
    lwd = gPars$lwd,
    lty = c(1, 2, 2))

  # LOAs
  abline(h = loas, col = cols[2])
  mtext(
    '02.5%',
    side = 4,
    at = loas[1],
    col = cols[2],
    cex =  scaleLegBA * cex,
    las = 1,
    line=0.25
  )
  mtext(
    '97.5%',
    side = 4,
    at = loas[2],
    col = cols[2],
    cex =  scaleLegBA * cex,
    las = 1,
    line=0.25
  )

  # QuantReg Validation
  ## Split sample
  N = length(x)
  pv = c()
  for(i in 1:nVal) {
    iTrain = sample(
      1:N,
      floor(qrFrac*N),
      replace = FALSE
    )
    yt = y[iTrain]
    xt = x[iTrain]

    # Quantile regression
    qreg = quantreg::rq(
      qrFor,
      method = qrMeth,
      data = data.frame(
        x = xt,
        y = yt
      ),
      tau = c(0.025,0.975)
    )

    # Validation
    xv = x[-iTrain]
    yv = y[-iTrain]

    pqreg = predict(
      qreg,
      newdata = data.frame(x=xv)
    )

    # Percentage of validation data between quantiles
    pv[i] = mean(
      (pqreg[,2]-yv) * (pqreg[,1]-yv) <= 0
    )
  }
  pvm = mean(pv)

  # Infos
  p_score = olsrr::ols_test_score(reg)$p
  legend('topleft',
         title = paste0(
           main,'\n',
           'p(homosc.) = ',signif(p_score,2),'\n',
           'P95 = ',signif(pvm,2)
         ),
         title.col = cols[3],
         inset = 0.1,
         title.adj = 0,
         bty = 'n', #box.col = NA, bg = 'white',
         legend = '')
  box()
}
output$methodsUQ <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  selectInput(
    "selMethUQ",
    label = "Method",
    choices = methList,
    multiple = FALSE
  )

})
output$plotUQ <- renderPlot({
  validate(
    need(
      !is.null(input$dataFile),
      'Please choose a datafile !'
    )
  )

  if(!is.null(outSel()) &
     input$removeGlobOutUQ) {
    Errors  = Errors[ !outSel(), ]
    Data    = Data[ !outSel(), ]
    systems = systems[ !outSel() ]
  }

  gpLoc = gPars
  gpLoc$pty = 'm'

  x = Data[ ,input$selMethUQ]
  xlab = paste0('Data [',dataUnits(),']')
  if(input$unifxUQ) {
    # Scale, center and uniformize x
    x = pnorm(scale(x))
    xlab = paste0('pnorm(scale(Data [',dataUnits(),']))')
  }

  y = Errors[ ,input$selMethUQ]
  # Remove trend in errors
  if(input$untUQ) {
    fo = y ~ 1
    if(input$untDegree > 0)
      fo = as.formula(
        paste0('y ~ 1 +',
               paste0('I(x^',1:input$untDegree,')',
                      collapse = '+')
        )
      )
    untReg = lm(fo)
    y = residuals(untReg)
  }

  nclass = input$nbClassUQ
  if(nclass == 0)
    nclass = nclass.Sturges(y)

  indx = order(x) # Order for clean line plots
  plotUQ(
    x [indx], y[indx],
    uy        = NULL,
    nclass    = nclass, # Nb class for histogram
    xlab      = xlab,
    ylab      = paste0('Errors [',dataUnits(),']'),
    plotGauss = TRUE, # Plot Gaussian fit of hist.
    outLiers  = input$outUQ, # Mark outliers
    p         = 0.95, # Width of interval to detect outliers
    labels    = systems[indx],
    select    = NULL, # Indices of points to colorize
    main      = input$selMethUQ,
    qrDegree  = input$qrDegree, # Degree of polynomials
    qrMeth    = input$qrMeth ,
    xlim      = c(min(x),1.1*max(x)),
    ylim      = range(y),
    gPars     = gpLoc
  )
},
width = plotWidth, height = plotHeight)
