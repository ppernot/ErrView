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
  Ref      <<- data[,2]
  Data     <<- data[,-c(1,2)]
  methList <<- colnames(Data)
  K(length(methList)) # Dynamic size for graphics updates
  Errors   <<- Ref - Data


  cat('Systems  : ', length(systems),'\n')
  cat('Methods  : ', K(),'\n')
})


