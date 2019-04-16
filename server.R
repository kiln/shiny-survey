library(magrittr)
library(dplyr)
library(shiny)

data = nycflights13::planes %>% 
  select(
    Tailnum = tailnum,
    Year = year,
    Type = type,
    Manufacturer = manufacturer,
    Model = model,
    Engine = engine,
    Seats = seats,
    -speed
    ) 

shinyServer(function(input, output, session) {
	session$sendCustomMessage("init", data)
	observe({
	  session$sendCustomMessage("update", input$n_bins)
	})
})