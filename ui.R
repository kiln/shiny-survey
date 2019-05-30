# Import packages, including Shiny and Shiny Widgets
library(magrittr)
library(shiny)

# Create list of years from nycflights data which can be used by year_selector to filter rows 
years <- nycflights13::planes$year %>% 
  unique() %>% 
  sort()

# Creates HTML elements for filtering data by year and changing shape of circles
htmlTemplate("template.html",
             year_selector = selectInput("year", "Year", choices = c("All", years)),
             shape_buttons = selectInput("shape", "Shape", 
                                         choices = c("Circle" = "circle", "Triangle" = "triangle", "Square" = "square", "Hexagon" = "hexagon")
                                         )
             )
