#Date:2015/06/03
#Author:Jerry

#devtools::install_github("rstudio/leaflet")
#library(leaflet)

###Basic
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  #addProviderTiles("Stamen.Toner") %>%
  #addProviderTiles("CartoDB.Positron") %>% 
  addMarkers(lng=121.541652, lat=25.013068, popup="NTUST")
m  # Print the map


###Popups
content <- paste(sep = "<br/>",
                 "<b><a href='http://www.ntust.edu.tw/'>NTUST</a></b>",
                 "The National Taiwan University of Science and Technology, commonly referred to as Taiwan Tech, is a public/national technological university located in Taipei, Taiwan.")

leaflet() %>% addTiles() %>%
  addPopups(121.541652, 25.013068, content,
            options = popupOptions(closeButton = FALSE))


###Lines and Shapes

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


leaflet(cities) %>% addTiles() %>% 
  addCircles(lng = ~Long, lat = ~Lat, weight = 1,
             radius = ~sumrate * 30, popup = ~positiondata, color = ~coldata)



