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
output$outStatsMsg <- renderPrint({
  if(is.null(bsList()))
    return(cat(' Please select desired stats, \n click on Generate \n and wait...'))

  bs = bsList()
  outliers = bs$outliers

  if(!is.null(outSel())) {
    cat('Outliers: ',systems[outSel()],'\n\n')
  } else {
    cat('No outliers selected\n\n')
  }
  if(!identical(outliers,outSel()))
    return(cat('Outliers changed: please regenerate stats...'))
})
output$outStats1 <- renderPrint({
  if(is.null(bsList()))
    return(NULL)

  bs = bsList()
  df = genTabStat(
    bs,
    comp=input$pinvChoice,
    ref = 0,
    numDig=1,
    units = dataUnits()
  )
  sel = ! colnames(df) %in% c('punc','pg')
  rownames(df)=NULL
  print(df[,sel],)
})
output$outStats = DT::renderDataTable({
  if(is.null(bsList()))
    return(NULL)

  bs = bsList()

  df = genTabStat(
    bs,
    comp=input$pinvChoice,
    ref = 0,
    numDig=1,
    units = dataUnits()
  )

  # Remove useless columns
  sel = ! colnames(df) %in% c('punc','pg')
  df = df[,sel]

  # Remove row names as a column 'Methods' is present
  rownames(df)=NULL


  DT::datatable(
    df,
    options = list(paging    = FALSE,
                   ordering  = TRUE,
                   searching = FALSE,
                   scrollX   = TRUE,
                   dom       = 't'   ),
    selection = list(target='row',
         selected=which.min(df$mue)
    ),
    escape    = FALSE
  )

})
