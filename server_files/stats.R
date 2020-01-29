bsList <- reactiveVal()
observeEvent(
  input$genStats, {
    # Remove outliers,if any
    if(!is.null(outSel()))
      Errors = Errors[ !outSel(), ]

    bs = estBS1(
      Errors,
      props = input$statsChoice,
      eps = 1,
      do.sip = input$sipChoice,
      silent=TRUE
    )
    bs$outliers = outSel()
    bsList(bs)
  }
)


output$outStats <- renderPrint({
  if(is.null(bsList()))
    return(cat(' Please select stats, \n click on Generate \n and wait...'))

  bs = bsList()
  outliers = bs$outliers

  if(!is.null(outSel())) {
    cat('Outliers: ',systems[outSel()],'\n\n')
  } else {
    cat('No outliers selected\n\n')
  }
  if(!identical(outliers,outSel()))
    return(cat('Outliers changed: please regenerate stats...'))

  df = genTabStat(bs, comp=input$pinvChoice, ref = 0, numDig=1)
  sel = ! colnames(df) %in% c('punc','pg')
  print(df[,sel])
})

# output$plotECDF <- renderPlot({
#   if(is.null(input$dataFile))
#     return(NULL)
#
#   plotUncEcdf(
#     abs(Errors),
#     xlab = NULL,
#     xmax = NULL,
#     title = '',
#     show.leg = TRUE,
#     show.MAE = TRUE,
#     col.index = 1:ncol(Errors),
#     weights = NULL,
#     units = 'a.u.',
#     label = 0,
#     gPars)
# })
