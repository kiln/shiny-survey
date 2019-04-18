library(shiny)
library(shinyWidgets)
library(magrittr)

years = nycflights13::planes$year %>% 
  unique() %>% 
  sort()

htmlTemplate("template.html",
             year_selector = selectInput("year", "Year", choices = c("All", years)),
             shape_buttons = selectInput("shape", "Shape", 
                                         choices = c("Circle" = "circle", "Triangle" = "triangle", "Square" = "square", "Hexagon" = "hexagon"),
                                         )
             )
