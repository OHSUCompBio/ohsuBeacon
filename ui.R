library(shiny)

shinyUI(fluidPage(
  
  id = "page",
  
  theme = "bootstrap.css",
                  
  includeCSS('response.css'),
  titlePanel("", windowTitle="OHSU Beacon"),
  headerPanel(
    a(hr(img(id="logo", src="OHSU_H_RGB_pos.jpg")))
  ),
  
  
  sidebarLayout(
    sidebarPanel(
      helpText("Query the OHSU Beacon."),
      textInput("chromosome", "Chromosome:", "1"),
      textInput("position", "Position:", "1"),
      textInput("allele", "Allele:", "T"),
      submitButton("Submit")
    ),
    
    mainPanel(
      tags$div(
        id = "response",
        p('Beacon responded with: '),
        textOutput("text1")
      )
   )
  ),

  tags$div(
    id = "image",
    hr(p('Learn more about Beacons at:',
      a('http://ga4gh.org/#/beacon')),
    p(em('* Research with this data may have regulatory requirements; please check with research administrators at your institution.')))
  )
))