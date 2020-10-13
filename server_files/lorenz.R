output$methodsLorenz <- renderUI({
  if(is.null(input$dataFile))
    return(NULL)

  checkboxGroupInput(
    "selMethLorenz",
    label = "Choose methods",
    choiceNames = methList,
    choiceValues = methList,
    selected = methList[1]
  )

})
# rangesLorenz <- reactiveValues(x = NULL, y = NULL)
output$plotLorenz <- renderPlot({
  if(is.null(input$dataFile)) {
    validate(
      need(
        !is.null(input$dataFile),
        'Please choose a datafile !'
      )
    )
    return()
  }

  if(!is.null(outSel()))
    Errors = Errors[ !outSel(), ]

  # Local set of colors
  nMeth = length(methList)
  gpLoc = gPars
  gpLoc$cols  = rev(inlmisc::GetColors(nMeth+1))[1:nMeth]
  gpLoc$pty   = 's'

  X = Errors[ ,input$selMethLorenz, drop = FALSE]

  if(input$lorenzCenter)
    if(class(X)== "numeric")
      X = scale(X, scale=FALSE)
    else
      X = apply(X, 2, scale, scale=FALSE)

  ErrViewLib::plotLorenz(
    abs(X),
    show.norm = input$lorenzNorm,
    show.leg  = TRUE,
    col.index = which(methList %in% input$selMethLorenz),
    label     = 0,
    leg.lwd   = 2*gPars$lwd,
    gPars     = gpLoc)

},
width = plotWidth, height = plotHeight)

# observeEvent(input$Lorenz_dblclick, {
#   brush <- input$Lorenz_brush
#   if (!is.null(brush)) {
#     rangesLorenz$x <- c(brush$xmin, brush$xmax)
#     rangesLorenz$y <- c(brush$ymin, brush$ymax)
#   } else {
#     rangesLorenz$x <- NULL
#     rangesLorenz$y <- NULL
#   }
# })
