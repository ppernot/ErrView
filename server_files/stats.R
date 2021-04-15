observeEvent(
  input$genStats, {

    # Remove outliers,if any
    if(!is.null(outSel())) {
      Errors = Errors[ !outSel(), ]
      Data = Data[ !outSel(), ]
      # systems= systems[ !outSel() ]
    }

    if (input$corTrendStat)
      Errors = trendCorr (Data, Errors, input$ctsDegree)

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
    return(cat(' Please select desired stats, \n click on Generate and wait...'))

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
tableparams <- reactiveValues()
observeEvent(
  # Save pageLength between call to outStats
  {input$genStats &
      input$pinvChoice &
      input$numDig == 1 &
      input$formUnc
  },
  {
  if(is.null(input$outStats_rows_current)){
    # Default to fill pleasingly window space
    tableparams$pageLength <- 12
  }
  else{
    tableparams$pageLength <- length(input$outStats_rows_current)
  }
  }
)
output$outStats = DT::renderDataTable({
  req(bsList())

  bs = bsList()

  df = ErrViewLib::genTabStat(
    bs,
    comp   = input$pinvChoice,
    ref    = 0,
    numDig = input$numDig,
    units  = dataUnits(),
    short  = input$formUnc
  )

  # Remove useless columns
  # sel = ! colnames(df) %in% c('punc','pg')
  sel = !grepl('punc_',colnames(df)) &
        !grepl('pg_',colnames(df))
  df = df[,sel]

  # Set units in the footer to avoid mixing with data
  sketch <- htmltools::withTags(table(
    class = "display",
    style = "bootstrap",
    tableHeader(colnames(df)),
    tableFooter(unlist(df[1,]))
  ))

  DT::datatable(
    df[-1, ],
    # Remove units from data
    container = sketch,
    options = list(
      paging      = TRUE,
      pageLength  = tableparams$pageLength,
      ordering    = TRUE,
      searching   = FALSE,
      scrollX     = TRUE,
      dom         = 'Btip',
      lengthMenu  = list(
        list( 10, 12, 25, 50, -1 ),
        list( '10 rows', 'Default','25 rows', '50 rows', 'Show all' )
      ),
      buttons     = list(
        'pageLength',
        list(
          extend = "copy",
          text = "Copy",
          footer = TRUE
        ),
        list(
          extend = "csv",
          text = "CSV",
          footer = TRUE
        ),
        list(
          extend = "pdf",
          text = "PDF",
          footer = TRUE
        )
      ),
      deferRender = TRUE
    ),
    selection = list(
      target   = 'row',
      selected = which.min(as.numeric(bs[['mue']]$val))
    ),
    escape        = TRUE,
    rownames      = FALSE,
    extensions    = c('Buttons')
  )

})
