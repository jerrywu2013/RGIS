library(shiny)

ui <- fluidPage(
  leafletOutput("mymap"),
  p(),
)

server <- function(input, output, session) {
  
####################
  cities <- read.csv(textConnection("
positiondata,Lat,Long,sumrate
1,24.97155,121.54907,10
2,24.97283,121.53409,30
3,24.97415,121.53824,40
4,24.98033,121.54408,5
5,24.97088,121.53706,79
6,24.97156,121.53532,88
"))
  coldata<-c("#B80000","#008F00","#52008F","#8F008F","#E0E000","#F700F7")
####################  

  
  output$mymap <- renderLeaflet(
    leaflet(cities) %>% addTiles() %>%
      addCircles(lng = ~Long, lat = ~Lat, weight = 1,
                 radius = ~sumrate * 30, popup = ~positiondata, color = ~coldata)
  )
}

shinyApp(ui, server)