output$selectMsg <- renderPrint({
  if(is.null(input$dataFile))
    return(NULL)
  cat('Data set : ', input$dataFile[['name']],'\n')

  data = read.csv(
    file=input$dataFile$datapath,
    header=TRUE,
    stringsAsFactors = FALSE,
    check.names = FALSE)

  systems  <<- data[,1]
  methList <<- colnames(data)[-1]
  Errors   <<- data[,-1]
  K(length(methList))

  cat('Systems  : ', length(systems),'\n')
  cat('Methods  : ', K(),'\n')
})


