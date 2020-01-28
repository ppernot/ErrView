K <- reactiveVal()
output$selectMsg <- renderPrint({
  if(is.null(input$dataFile)) {
    cat('Expected datafile format (.csv):\n\n')
    cat('"","Ref","Meth1","Meth2",...,"MethN"\n')
    cat('"Syst1","0.1","0.2","0.3",...,"0.4"\n')
    cat('...\n')
    cat('"SystM","0.5","0.6","0.7",...,"0.8"\n\n')
    return()
  }

  cat('Data set : ', input$dataFile[['name']],'\n')

  data = read.csv(
    file=input$dataFile$datapath,
    header=TRUE,
    stringsAsFactors = FALSE,
    check.names = FALSE)

  systems  <<- data[,1]
  rownames(data) = systems
  Ref      <<- data[,2]
  Data     <<- data[,-c(1,2)]
  methList <<- colnames(Data)
  K(length(methList)) # Dynamic size for graphics updates

  if(input$useRelative)
    Errors   <<- (Ref - Data)/Ref
  else
    Errors   <<- Ref - Data


  cat('Errors (first lines)\n')
  print(head(signif(Errors,2),n=5))
  cat('\n')
  cat('Systems  : ', length(systems),'\n')
  cat('Methods  : ', K(),'\n')

})
