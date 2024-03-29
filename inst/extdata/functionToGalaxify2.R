functionToGalaxify2 <- function(inputfile1=GalaxyInput(),
    inputfile2=GalaxyInput(), plotTitle=character(),
    plotSubTitle="My subtitle", outputfile1=GalaxyOutput("mydata", "csv"),
    outputfile2=GalaxyOutput("myplot", "pdf"))
{
    ## Make sure the file can be read
    data1 <- tryCatch({
        as.matrix(read.delim(inputfile1, row.names=1))
    }, error=function(err) {
        stop("failed to read first data file: ", conditionMessage(err))
    })
    
    data2 <- tryCatch({
        as.matrix(read.delim(inputfile2, row.names=1))
    }, error=function(err) {
        stop("failed to read second data file: ", conditionMessage(err))
    })
    
    data3 <- data1 + data2
    
    write.csv(data3, file=outputfile1)
    
    pdf(outputfile2)
    plot(data3)
    dev.off()
}
