library(shiny)
library(magrittr)

years = nycflights13::planes$year %>% 
  unique() %>% 
  sort()

htmlTemplate("template.html",
             selector = selectInput("year", label = NULL, choices = c("All", years))
             )
