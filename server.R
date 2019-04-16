library(magrittr)
library(dplyr)
library(shiny)
library(jsonlite)

data = nycflights13::planes %>% 
  select(
    Tailnum = tailnum,
    Year = year,
    Type = type,
    Manufacturer = manufacturer,
    Model = model,
    Engines = engines,
    Engine = engine,
    Seats = seats,
    -speed
    ) %>%
  toJSON(dataframe = "rows")

shinyServer(function(input, output, session) {
	session$sendCustomMessage("init", data)
	observe({
	  session$sendCustomMessage("update", input$n_bins)
	})
})