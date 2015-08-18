library(shiny)
library(httr)
library(rjson)

shinyServer(
    function(input, output) {
        
        chrom <- reactive({
            input$chromosome
        })
        
        pos <- reactive({
            input$position
        })
        
        a <- reactive({
            input$allele
        })
        
        
        output$text1 <- renderText({
            request <- paste0("http://genomicsbeacon.ohsu.edu:8002/cgi-bin/ucscBeacon/query?chromosome=",chrom(),"&position=",pos(),"&alternateBases=",a())
#            request <- paste0("http://localhost/cgi-bin/ucscBeacon/query?chromosome=",chrom(),"&position=",pos(),"&alternateBases=",a())
            r <- GET(request)
            response <- fromJSON(content(r, as = "text"))
            exists <- response$response$exists
            if (exists){
                #paste0(response)
		paste0('Yes. ', response[[2]]$alternateBases, ' recorded at this position.')
            }else{
		#paste0(response[[2]]$alternateBases)
                paste0('No. ', response[[2]]$alternateBases, ' not recorded at this position.')
            }
        })
    }
)
